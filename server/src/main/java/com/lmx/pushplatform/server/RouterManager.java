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
    private static Jedis jedis;
    private static final String SPLITTER = ":";
    private static final String PUSH_KEY_PREFIX = "push" + SPLITTER + "user" + SPLITTER;
    private static final String IM_KEY_PREFIX = "im" + SPLITTER + "user" + SPLITTER;
    private static final Logger LOGGER = LoggerFactory.getLogger(RouterManager.class);

    static {
        try {
            jedis = new Jedis();
            jedis.setDataSource(new JedisPool(new JedisPoolConfig(),
                    System.getProperty("redis.host"), Integer.parseInt(System.getProperty("redis.port"))));
        } catch (Exception e) {
            LOGGER.error("", e);
            System.exit(0);
        }
    }

    public static String regRouter(PushRequest request) {
        String regId = request.getFromId();
        String realRegId = null;
        //推送
        if (request.getPushType() == PushRequest.PushType.PUSH.ordinal()) {
            realRegId = request.getAppKey() + SPLITTER + PUSH_KEY_PREFIX + regId;
        }//IM
        else if (request.getPushType() == PushRequest.PushType.IM.ordinal()) {
            realRegId = request.getAppKey() + SPLITTER + IM_KEY_PREFIX + regId;
        }
        jedis.set(realRegId, Server.host + SPLITTER + Server.port);
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
        return jedis.get(getLocalRouter(request,toId));
    }

    public static void removeRedisRouter(String id) {
        jedis.del(id);
    }
}
