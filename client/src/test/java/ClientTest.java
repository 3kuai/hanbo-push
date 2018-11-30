import com.google.common.collect.Lists;
import com.lmx.pushplatform.client.DynamicConnector;
import com.lmx.pushplatform.proto.PushRequest;
import org.junit.Test;

public class ClientTest {
    private DynamicConnector dynamicConnector = new DynamicConnector();
    private String appName = "stockApp";

    @Test
    public void clientATest() {
        try {
            PushRequest reg = new PushRequest();
            reg.setMsgType(PushRequest.MessageType.REGISTY.ordinal());
            reg.setPushType(PushRequest.PushType.PUSH.ordinal());
            reg.setFromId("15821303235");
            reg.setAppKey(appName);
            dynamicConnector.sendOnly(reg);
            Thread.sleep(Integer.MAX_VALUE);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void clientBTest() {
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
            dynamicConnector.sendAndGet(pub);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
