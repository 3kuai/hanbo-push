package com.lmx.pushplatform.client;

import com.google.common.eventbus.Subscribe;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.channel.ChannelHandlerContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class DynamicConnector {
    private ServiceSubscriber subscriber = ServiceSubscriber.getInstance();
    private ConsistencyHashRouter consistencyHashRouter = new ConsistencyHashRouter();
    private final Logger LOGGER = LoggerFactory.getLogger(DynamicConnector.class);
    final static int RETRY_TIMES = 3;

    public DynamicConnector() {
        try {
            InnerEventBus.reg(this);
            LOGGER.info("subscribe pushService thread started");
            subscriber.subScribeApp();
            initConnect();
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }

    public DynamicConnector(String key, ChannelHandlerContext channelHandlerContext) {
        try {
            InnerEventBus.reg(this);
            LOGGER.info("subscribe pushService thread started");
            subscriber.subScribeApp();
            initConnect(key, channelHandlerContext);
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }

    public void initConnect(ChannelHandlerContext channelHandlerContext) {
        List<String> hosts = subscriber.getServiceAddress();
        consistencyHashRouter.initHashCycle(hosts, channelHandlerContext);
    }

    public void initConnect(String key, ChannelHandlerContext channelHandlerContext) {
        List<String> hosts = subscriber.getServiceAddress();
        consistencyHashRouter.initHashCycle(hosts, channelHandlerContext, key);
    }

    public void initConnect() {
        List<String> hosts = subscriber.getServiceAddress();
        consistencyHashRouter.clear();
        consistencyHashRouter.initHashCycle(hosts, null);
    }

    @Subscribe
    public synchronized void eventHandler(List<String> hosts) {
        LOGGER.info("subscriber refresh client connector address={}", hosts);
        consistencyHashRouter.modifyHashCycle(hosts);
    }

    public synchronized void sendOnly(PushRequest pushRequest) {
        if (!hasClients())
            return;
        try {
            Connector connector = consistencyHashRouter.router(pushRequest.getFromId());
            connector.sendOnly(pushRequest);
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }

    public synchronized PushResponse sendAndGet(PushRequest pushRequest) {
        if (!hasClients())
            return null;
        PushResponse pushResponse = null;
        int cnt = 0;
        do {
            try {
                Connector connector = consistencyHashRouter.router(pushRequest.getFromId());
                pushResponse = connector.sendAndGet(pushRequest);
                if (pushResponse != null) {
                    return pushResponse;
                }
                cnt++;
            } catch (Exception e) {
                initConnect();
            }
        } while (pushResponse == null && cnt < RETRY_TIMES);
        return null;
    }

    boolean hasClients() {
        return consistencyHashRouter.hashCycleSize() > 0;
    }

    public List<Connector> getClients() {
        return consistencyHashRouter.getRealClients();
    }

    public Connector getClient(String key) {
        return consistencyHashRouter.router(key);
    }

    public synchronized void removeCallBackChannel() {
        InnerEventBus.unReg(this);
        for (Connector c : consistencyHashRouter.getRealClients()) {
            c.close();
        }
    }
}
