package com.lmx.pushplatform.server;

import com.turo.pushy.apns.ApnsClient;
import com.turo.pushy.apns.ApnsClientBuilder;
import com.turo.pushy.apns.PushNotificationResponse;
import com.turo.pushy.apns.util.ApnsPayloadBuilder;
import com.turo.pushy.apns.util.SimpleApnsPushNotification;
import com.turo.pushy.apns.util.TokenUtil;
import com.turo.pushy.apns.util.concurrent.PushNotificationFuture;
import com.turo.pushy.apns.util.concurrent.PushNotificationResponseListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;

/**
 * IOS push
 */
public class ApnsPushHelper {
    private static Logger LOGGER = LoggerFactory.getLogger(ApnsPushHelper.class);

    private static ApnsClient apnsClient;

    static {
        try {
            apnsClient = new ApnsClientBuilder()
                    .setApnsServer(ApnsClientBuilder.DEVELOPMENT_APNS_HOST)
                    .setClientCredentials(new File("/data/certificate/c.p12"), "p12-file-password")
                    .build();
        } catch (IOException e) {
            LOGGER.error("", e);
        }
    }

    public static void sendMsg(String tokenStr, String appPkgName, String msg) {
        ApnsPayloadBuilder payloadBuilder = new ApnsPayloadBuilder();
        payloadBuilder.setAlertBody(msg);
        String payload = payloadBuilder.buildWithDefaultMaximumLength();
        String token = TokenUtil.sanitizeTokenString(tokenStr);
        final SimpleApnsPushNotification pushNotification = new SimpleApnsPushNotification(token, appPkgName, payload);
        final PushNotificationFuture<SimpleApnsPushNotification, PushNotificationResponse<SimpleApnsPushNotification>> pushNotificationFuture
                = apnsClient.sendNotification(pushNotification);
        pushNotificationFuture.addListener(new PushNotificationResponseListener<SimpleApnsPushNotification>() {

            @Override
            public void operationComplete(final PushNotificationFuture<SimpleApnsPushNotification, PushNotificationResponse<SimpleApnsPushNotification>> future) throws Exception {
                // When using a listener, callers should check for a failure to send a
                // notification by checking whether the future itself was successful
                // since an exception will not be thrown.
                if (future.isSuccess()) {
                    final PushNotificationResponse<SimpleApnsPushNotification> pushNotificationResponse =
                            pushNotificationFuture.getNow();

                    // Handle the push notification response as before from here.
                    pushNotificationResponse.getApnsId();
                    pushNotificationResponse.getTokenInvalidationTimestamp();
                } else {
                    // Something went wrong when trying to send the notification to the
                    // APNs gateway. We can find the exception that caused the failure
                    // by getting future.cause().
                    LOGGER.error("", future.cause());
                }
            }
        });
    }
}
