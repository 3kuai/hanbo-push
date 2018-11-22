import com.lmx.pushplatform.client.ClientDelegate;
import com.lmx.pushplatform.proto.PushRequest;
import org.junit.Test;

public class ClientTest {
    private ClientDelegate clientDelegate = new ClientDelegate();

    @Test
    public void clientATest() {
        try {
            PushRequest pushRequest = new PushRequest();
            pushRequest.setMsgType(0);
            pushRequest.setFromId("15821303235");
            clientDelegate.sendOnly(pushRequest);
            Thread.sleep(Integer.MAX_VALUE);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void clientBTest() {
        try {
            PushRequest pushRequest = new PushRequest();
            pushRequest.setMsgType(0);
            pushRequest.setFromId("13120615313");
            clientDelegate.sendOnly(pushRequest);

            PushRequest pushRequest_ = new PushRequest();
            pushRequest_.setMsgType(1);
            pushRequest_.setFromId("13120615313");
            pushRequest_.setToId("15821303235");
            pushRequest_.setMsgContent("this is a push message");
            clientDelegate.sendAndGet(pushRequest_);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
