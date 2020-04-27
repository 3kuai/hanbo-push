package com.lmx.pushplatform.client;

import com.google.common.eventbus.EventBus;

public class InnerEventBus {
    static EventBus eventBus = new EventBus();

    public static void pub(Object o) {
        eventBus.post(o);
    }

    public static void reg(Object o) {
        eventBus.register(o);
    }

    public static void unReg(Object o) {
        eventBus.unregister(o);
    }
}
