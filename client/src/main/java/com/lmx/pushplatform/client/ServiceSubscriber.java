package com.lmx.pushplatform.client;

import com.google.common.collect.Lists;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;

public class ServiceSubscriber {
    private String REGISTER_PATH = "/push";
    private String host = System.getProperty("zk.hosts");
    private final Logger LOGGER = LoggerFactory.getLogger(ServiceSubscriber.class);
    private CountDownLatch latch = new CountDownLatch(1);
    private List<String> serviceAddress = new ArrayList<>();
    private static boolean first = true;
    private static ServiceSubscriber serviceSubscriber = new ServiceSubscriber();

    private ServiceSubscriber() {
    }

    public static ServiceSubscriber getInstance() {
        return serviceSubscriber;
    }

    public List<String> getServiceAddress() {
        return serviceAddress;
    }

    public void subScribeApp() throws Exception {
        if (first) {
            final ZooKeeper zooKeeper = new ZooKeeper(host, 10 * 1000, event -> {
                if (event.getState() == Watcher.Event.KeeperState.SyncConnected) {
                    latch.countDown();
                }
            });
            latch.await();
            watchNode(zooKeeper);
            first = false;
        }
    }

    private void watchNode(final ZooKeeper zooKeeper) {
        try {
            List<String> nodeList = zooKeeper.getChildren(REGISTER_PATH + "/apps", event -> {
                if (event.getType() == Watcher.Event.EventType.NodeChildrenChanged) {
                    watchNode(zooKeeper);
                }
            });
            Set<String> curServiceAddress = new HashSet<>();
            for (String node : nodeList) {
                byte[] bytes = zooKeeper.getData(REGISTER_PATH + "/apps/" + node, false, null);
                curServiceAddress.add(new String(bytes));
            }
            serviceAddress = Lists.newArrayList(curServiceAddress);
            LOGGER.info("current online pushService node={}", serviceAddress);
            if (!first)
                InnerEventBus.pub(serviceAddress);
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }
}
