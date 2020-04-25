import com.lmx.pushplatform.client.DynamicConnector;
import com.lmx.pushplatform.proto.PushRequest;
import org.junit.Test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

public class ClientTest {
    //订阅消息的app名称
    private String appName = "stock-app";
    //并发数
    private int currencyNum = 2;
    private ExecutorService executorService = Executors.newFixedThreadPool(currencyNum + 16);

    @Test
    public void mockCurrencyApp() {
        AtomicInteger atomicInteger = new AtomicInteger(0);
        for (int i = 0; i <= currencyNum; i++) {
            executorService.execute(() -> {
                try {
                    DynamicConnector dynamicConnector = new DynamicConnector();
                    //用手机号模拟设备号（一般是mac地址）
                    String fromId = String.valueOf(15821303232L + atomicInteger.getAndIncrement());
                    //订阅推送事件
                    PushRequest reg = new PushRequest();
                    reg.setMsgType(PushRequest.MessageType.REGISTY.ordinal());
                    reg.setPushType(PushRequest.PushType.PUSH.ordinal());
                    reg.setFromId(fromId);
                    reg.setAppKey(appName);
                    dynamicConnector.sendOnly(reg);
                    while (true) {
                        //发送心跳维持在线活跃状态
                        reg = new PushRequest();
                        reg.setMsgType(PushRequest.MessageType.HEARTBEAT.ordinal());
                        reg.setPushType(PushRequest.PushType.PUSH.ordinal());
                        reg.setAppKey(appName);
                        reg.setFromId(fromId);
                        dynamicConnector.sendOnly(reg);
                        Thread.sleep(10 * 1000L);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    //如果异常则退出当前等待消息的app进程
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

}
