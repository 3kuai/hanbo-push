package com.lmx.pushplatform.client;

import com.google.common.eventbus.Subscribe;
import com.google.common.net.HostAndPort;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

public class ClientDelegate {
    private Subscriber subScriber = new Subscriber();
    private List<Client> clients = new ArrayList<>();
    private final Logger LOGGER = LoggerFactory.getLogger(ClientDelegate.class);

    public ClientDelegate() {
        try {
            InnerEventBus.reg(this);
            LOGGER.info("subscribe pushService thread started");
            subScriber.subScribeApp();
            initConnect();
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }

    public void initConnect() {
        List<String> hosts = subScriber.getServiceAddress();
        for (int i = 0; i < hosts.size(); i++) {
            String hostAddress = hosts.get(i);
            Client client = new Client();
            client.initConn(HostAndPort.fromString(hostAddress).getHostText(),
                    HostAndPort.fromString(hostAddress).getPort());
            clients.add(client);
        }
    }

    @Subscribe
    public void eventHandler(List<String> hosts) {
        LOGGER.info("subscriber refresh client connector address={}", hosts);
        clients.clear();
        for (String hostAddress : hosts) {
            Client client = new Client();
            client.initConn(HostAndPort.fromString(hostAddress).getHostText(),
                    HostAndPort.fromString(hostAddress).getPort());
            clients.add(client);
        }
    }

    public void sendOnly(PushRequest pushRequest) {
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

    public PushResponse sendAndGet(PushRequest pushRequest) {
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

    public List<Client> getClients() {
        return clients;
    }
}
