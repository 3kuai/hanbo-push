import com.google.common.collect.Lists;
import com.lmx.pushplatform.client.Connector;
import com.lmx.pushplatform.client.ConsistencyHashRouter;
import com.lmx.pushplatform.client.DynamicConnector;
import com.lmx.pushplatform.proto.PushRequest;
import org.junit.Test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

public class ClientTest {
    private String appName = "stock-app";
    private ConsistencyHashRouter consistencyHashRouter = new ConsistencyHashRouter();
    private ExecutorService executorService = Executors.newFixedThreadPool(100);

    @Test
    public void clientATest() {
        AtomicInteger atomicInteger = new AtomicInteger(2);
        for (int i = 2; i <= 5; i++) {
            executorService.execute(() -> {
                try {
                    DynamicConnector dynamicConnector = new DynamicConnector();
                    PushRequest reg = new PushRequest();
                    reg.setMsgType(PushRequest.MessageType.REGISTY.ordinal());
                    reg.setPushType(PushRequest.PushType.PUSH.ordinal());
                    reg.setFromId("1582130323" + atomicInteger.getAndIncrement());
                    reg.setAppKey(appName);
                    dynamicConnector.sendOnly(reg);
                    while (true) {
                        reg.setMsgType(PushRequest.MessageType.HEARTBEAT.ordinal());
                        dynamicConnector.sendOnly(reg);
                        Thread.sleep(10 * 1000L);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.exit(0);
                }
            });
        }
        try {
            Thread.sleep(Long.MAX_VALUE);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void clientBTest() {
        DynamicConnector dynamicConnector = new DynamicConnector();
        try {
            PushRequest reg = new PushRequest();
            reg.setMsgType(PushRequest.MessageType.REGISTY.ordinal());
            reg.setPushType(PushRequest.PushType.PUSH.ordinal());
            reg.setFromId("13120615313");
            reg.setAppKey(appName);
            dynamicConnector.sendOnly(reg);

            PushRequest pub = new PushRequest();
            pub.setMsgType(PushRequest.MessageType.DILIVERY_MSG.ordinal());
            pub.setPushType(PushRequest.PushType.PUSH.ordinal());
            pub.setFromId("13120615313");
            pub.setToId(Lists.newArrayList("15821303235"));
            pub.setMsgContent("this is a push message");
            pub.setAppKey(appName);
            for (int i = 0; i < 20; i++) {
                dynamicConnector.sendAndGet(pub);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void consistencyHash() {
        consistencyHashRouter.initHashCycle(Lists.newArrayList("192.168.1.100", "192.168.1.102", "192.168.1.105"), null);
        for (int i = 0; i < 100; i++) {
            Connector node = consistencyHashRouter.router("213.60.11." + ++i);
            System.err.println(node);
        }
    }
}
