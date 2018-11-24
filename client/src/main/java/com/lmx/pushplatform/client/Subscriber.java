package com.lmx.pushplatform.client;

import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

public class Subscriber {
    private String REGIST_PATH = "/push";
    private String host = System.getProperty("zk.hosts");
    private final Logger LOGGER = LoggerFactory.getLogger(Subscriber.class);
    private CountDownLatch latch = new CountDownLatch(1);
    private List<String> serviceAddress = new ArrayList<>();
    private boolean isInit = true;

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
                    if (event.getType() == Event.EventType.NodeChildrenChanged) {
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
            LOGGER.info("current online pushService node={}", serviceAddress);
            if (!isInit)
                InnerEventBus.pub(serviceAddress);
            isInit = false;
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }
}
