package com.lmx.pushplatform.server;

import com.lmx.pushplatform.proto.PushRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * 分布式路由表
 * Created by Administrator on 2018/11/29.
 */
public class RouterManager {
    private static JedisPool jedisPool;
    private static final String SPLITTER = ":";
    private static final String PUSH_KEY_PREFIX = "push" + SPLITTER + "user" + SPLITTER;
    private static final String IM_KEY_PREFIX = "im" + SPLITTER + "user" + SPLITTER;
    private static final Logger LOGGER = LoggerFactory.getLogger(RouterManager.class);

    static {
        try {
            if (!System.getProperty("redis.password").isEmpty())
                jedisPool = new JedisPool(new JedisPoolConfig(),
                        System.getProperty("redis.host"), Integer.parseInt(System.getProperty("redis.port")),
                        5000, System.getProperty("redis.password"));
            else
                jedisPool = new JedisPool(new JedisPoolConfig(),
                        System.getProperty("redis.host"), Integer.parseInt(System.getProperty("redis.port")),
                        5000);
        } catch (Exception e) {
            LOGGER.error("", e);
            System.exit(0);
        }
    }

    public static String renewRouter(PushRequest request) {
        String regId = request.getFromId();
        String realRegId = getLocalRouter(request, regId);
        Jedis jedis = jedisPool.getResource();
        jedis.setex(realRegId, 60 * 5, PushServer.host + SPLITTER + PushServer.port);
        jedis.close();
        return realRegId;
    }

    public static String regRouter(PushRequest request) {
        String regId = request.getFromId();
        String realRegId = getLocalRouter(request, regId);
        Jedis jedis = jedisPool.getResource();
        //1分钟过期，通过心跳延长
        jedis.setex(realRegId, 60, PushServer.host + SPLITTER + PushServer.port);
        jedis.close();
        return realRegId;
    }

    public static String getLocalRouter(PushRequest request, String toId) {
        String realRegId = null;
        //推送
        if (request.getPushType() == PushRequest.PushType.PUSH.ordinal()) {
            realRegId = request.getAppKey() + SPLITTER + PUSH_KEY_PREFIX + toId;
        }//IM
        else if (request.getPushType() == PushRequest.PushType.IM.ordinal()) {
            realRegId = request.getAppKey() + SPLITTER + IM_KEY_PREFIX + toId;
        }
        return realRegId;
    }

    public static String getRedisRouter(PushRequest request, String toId) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            return jedis.get(getLocalRouter(request, toId));
        } finally {
            jedis.close();
        }
    }

    public static void removeRedisRouter(String id) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.del(id);
        } finally {
            jedis.close();
        }
    }
}
