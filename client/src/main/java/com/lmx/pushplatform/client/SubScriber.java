package com.lmx.pushplatform.client;

import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

public class SubScriber {
    private String REGIST_PATH = "/push";
    private String host = System.getProperty("zk.hosts");
    private final Logger LOGGER = LoggerFactory.getLogger(SubScriber.class);
    private CountDownLatch latch = new CountDownLatch(1);
    private List<String> serviceAddress = new ArrayList<>();

    public List<String> getServiceAddress() {
        return serviceAddress;
    }

    public void subScribeApp() throws Exception {
        final ZooKeeper zooKeeper = new ZooKeeper(host, 60 * 1000, new Watcher() {
            @Override
            public void process(WatchedEvent event) {
                if (event.getState() == Event.KeeperState.SyncConnected) {
                    latch.countDown();
                }
                LOGGER.info("push client sub ok,event={}", event);
            }
        });
        latch.await();
        watchNode(zooKeeper);
    }

    private void watchNode(final ZooKeeper zooKeeper) {
        try {
            List<String> nodeList = zooKeeper.getChildren(REGIST_PATH + "/apps", new Watcher() {
                @Override
                public void process(WatchedEvent event) {
                    if (event.getType() == Event.EventType.NodeDataChanged) {
                        watchNode(zooKeeper);
                    }
                }
            });
            List<String> curServiceAddress = new ArrayList<>();
            for (String node : nodeList) {
                byte[] bytes = zooKeeper.getData(REGIST_PATH + "/apps/" + node, false, null);
                curServiceAddress.add(new String(bytes));
            }
            serviceAddress = curServiceAddress;
            LOGGER.info("serviceAddress data:={}", serviceAddress);
            if (serviceAddress.size() > 0)
                InnerEventBus.pub(serviceAddress);
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }
}
