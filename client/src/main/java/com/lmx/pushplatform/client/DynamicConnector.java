package com.lmx.pushplatform.client;

import com.google.common.eventbus.Subscribe;
import com.google.common.net.HostAndPort;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.channel.ChannelHandlerContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

public class DynamicConnector {
    private ServiceSubscriber subscriber = ServiceSubscriber.getServiceSubscriber();
    private List<Connector> clients = new ArrayList<>();
    private final Logger LOGGER = LoggerFactory.getLogger(DynamicConnector.class);

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

    public DynamicConnector(ChannelHandlerContext channelHandlerContext) {
        try {
            InnerEventBus.reg(this);
            LOGGER.info("subscribe pushService thread started");
            subscriber.subScribeApp();
            initConnect(channelHandlerContext);
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }

    public void initConnect(ChannelHandlerContext channelHandlerContext) {
        List<String> hosts = subscriber.getServiceAddress();
        for (int i = 0; i < hosts.size(); i++) {
            String hostAddress = hosts.get(i);
            Connector client = new Connector();
            client.initConn(HostAndPort.fromString(hostAddress).getHostText(),
                    HostAndPort.fromString(hostAddress).getPort(), channelHandlerContext);
            clients.add(client);
        }
    }

    public void initConnect() {
        List<String> hosts = subscriber.getServiceAddress();
        for (int i = 0; i < hosts.size(); i++) {
            String hostAddress = hosts.get(i);
            Connector client = new Connector();
            client.initConn(HostAndPort.fromString(hostAddress).getHostText(),
                    HostAndPort.fromString(hostAddress).getPort());
            clients.add(client);
        }
    }

    @Subscribe
    public synchronized void eventHandler(List<String> hosts) {
        LOGGER.info("subscriber refresh client connector address={}", hosts);
        clients.clear();
        for (String hostAddress : hosts) {
            Connector client = new Connector();
            client.initConn(HostAndPort.fromString(hostAddress).getHostText(),
                    HostAndPort.fromString(hostAddress).getPort());
            clients.add(client);
        }
    }

    public synchronized void sendOnly(PushRequest pushRequest) {
        if (!hasClients())
            return;
        int val = (int) System.currentTimeMillis() % clients.size();
        try {
            clients.get(val).sendOnly(pushRequest);
        } catch (Exception e) {
            LOGGER.error("", e);
            clients.remove(val);
        }
    }

    public synchronized PushResponse sendAndGet(PushRequest pushRequest) {
        if (!hasClients())
            return null;
        int val = (int) System.currentTimeMillis() % clients.size();
        try {
            return clients.get(val).sendAndGet(pushRequest);
        } catch (Exception e) {
            LOGGER.error("", e);
            clients.remove(val);
            return null;
        }
    }

    boolean hasClients() {
        return clients.size() > 0;
    }

    public List<Connector> getClients() {
        return clients;
    }

    public synchronized void removeImCallBackChannel(ChannelHandlerContext channelHandlerContext) {
        for (Connector c : clients) {
            c.getCallBackClients().remove(channelHandlerContext);
            c.close();
        }
    }

    public synchronized void removeAppCallBackChannel(ChannelHandlerContext channelHandlerContext) {
        for (Connector c : clients) {
            c.getCallBackClients().remove(channelHandlerContext);
            if (c.getCallBackClients().size() == 0) {
                c.close();
            }
        }
    }
}
