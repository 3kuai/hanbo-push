package com.lmx.pushplatform.client;

import com.google.common.eventbus.Subscribe;
import com.google.common.net.HostAndPort;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;

import java.util.ArrayList;
import java.util.List;

public class ClientDelegate {
    private Subscriber subScriber = new Subscriber();
    private List<Client> clients = new ArrayList<>();

    public ClientDelegate() {
        try {
            subScriber.subScribeApp();
            initConnect();
        } catch (Exception e) {
            e.printStackTrace();
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
    public void sub(List<String> hosts) {
        if (hosts == null)
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
            clients.remove(val);
            return null;
        }
    }

    boolean hasClients() {
        return clients.size() > 0;
    }
}
