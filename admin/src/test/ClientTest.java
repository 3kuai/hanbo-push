import com.lmx.pushplatform.gateway.RestApiApplication;
import com.lmx.pushplatform.gateway.dao.DeviceRep;
import com.lmx.pushplatform.gateway.entity.DeviceEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = RestApiApplication.class)
public class ClientTest {
    @Autowired
    private DeviceRep deviceRep;

    /**
     * 初始化设备
     */
    @Test
    public void generatorDevices() {
        for (int i = 5; i < 100; i++) {
            deviceRep.save(DeviceEntity.builder().appId("1")
                    .deviceId(String.valueOf(15821303232L + i))
                    .state(1)
                    .platform(1).createTime(new Date()).build());
        }
    }

}
