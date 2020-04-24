package com.lmx.pushplatform.client;

import com.google.common.base.Charsets;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.hash.HashFunction;
import com.google.common.hash.Hashing;
import com.google.common.net.HostAndPort;
import io.netty.channel.ChannelHandlerContext;

import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * 一致性hash路由策略，相比id取模，只会牺牲少数请求
 */
public class ConsistencyHashRouter {
    //虚拟节点因子
    private static final int VIRTUAL_NODE_FACTOR = 16;
    private List<Connector> realClients = Lists.newArrayList();
    private List<String> realClientNodes = Lists.newArrayList();
    //hash环，key降序排列
    private TreeMap<Integer, Connector> hashCycle = Maps.newTreeMap();
    private HashFunction hashFunction = Hashing.md5();

    public void initHashCycle(List<String> nodes, ChannelHandlerContext channelHandlerContext) {
        realClientNodes.addAll(nodes);
        for (int i = 0; i < nodes.size(); i++) {
            String node = nodes.get(i);
            Connector client = new Connector();
            client.initConn(HostAndPort.fromString(node).getHostText(),
                    HostAndPort.fromString(node).getPort());
            if (channelHandlerContext != null)
                client.addCallBack(channelHandlerContext);
            realClients.add(client);
            hashCycle.put(hash(node), client);
            for (int j = 0; j < VIRTUAL_NODE_FACTOR; j++) {
                hashCycle.put(hash(node + "_VIRTUAL_" + j), client);
            }
        }
    }

    public void modifyHashCycle(List<String> nodes) {
        //全部离线
        if (nodes.size() == 0) {
            dropCritical(realClientNodes);
        } else if (realClientNodes.size() > nodes.size()) {//剔除故障节点
            List<String> waitRem = Lists.newArrayList(realClientNodes);
            waitRem.remove(nodes);
            dropCritical(waitRem);
        } else if (realClientNodes.size() < nodes.size()) {//新增节点
            for (int m = 0; m < nodes.size(); m++) {
                String node = nodes.get(m);
                if (!realClientNodes.contains(node)) {
                    realClientNodes.add(node);
                    Connector client = new Connector();
                    client.initConn(HostAndPort.fromString(node).getHostText(),
                            HostAndPort.fromString(node).getPort());
                    realClients.add(client);
                    hashCycle.put(hash(node), client);
                    for (int j = 0; j < VIRTUAL_NODE_FACTOR; j++) {
                        hashCycle.put(hash(node + "_VIRTUAL_" + j), client);
                    }
                }
            }
        }
    }

    void dropCritical(List<String> waitRem) {
        for (int n = 0; n < waitRem.size(); n++) {
            String node = waitRem.get(n);
            realClientNodes.remove(node);
            for (int i = 0; i < realClients.size(); i++) {
                if (realClients.get(i).toString().equals(node))
                    realClients.remove(i);
            }
            hashCycle.remove(hash(node));
            for (int j = 0; j < VIRTUAL_NODE_FACTOR; j++) {
                hashCycle.remove(hash(node + "_VIRTUAL_" + j));
            }
        }
    }

    public int hash(String key) {
        int hash = hashFunction.hashString(key, Charsets.UTF_8).asInt();
        return hash % Integer.MAX_VALUE;
    }

    public Connector router(String key) {
        SortedMap<Integer, Connector> tail = hashCycle.tailMap(hash(key));
        //顺时针查找相邻节点
        return tail.size() != 0 ? tail.get(tail.firstKey()) : hashCycle.get(hashCycle.firstKey());
    }

    public int hashCycleSize() {
        return hashCycle.size();
    }

    public List<Connector> getRealClients() {
        return realClients;
    }

    void clear() {
        realClients.clear();
        realClientNodes.clear();
        hashCycle.clear();
    }
}
