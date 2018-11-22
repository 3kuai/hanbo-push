package com.lmx.pushplatform.client;

import com.lmx.pushplatform.proto.PushResponse;

import java.util.concurrent.*;

/**
 * Created by limingxin on 2017/8/13.
 */
public class SendFuture implements Future<PushResponse> {
    CountDownLatch cd;
    PushResponse response;

    public void setCd(CountDownLatch cd) {
        this.cd = cd;
    }

    public void setResponse(PushResponse response) {
        this.response = response;
    }

    @Override
    public boolean cancel(boolean mayInterruptIfRunning) {
        return false;
    }

    @Override
    public boolean isCancelled() {
        return false;
    }

    @Override
    public boolean isDone() {
        cd.countDown();
        return false;
    }

    @Override
    public PushResponse get() throws InterruptedException, ExecutionException {
        return this.response;
    }

    @Override
    public PushResponse get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
        if (!cd.await(timeout, unit)) {
            throw new TimeoutException();
        }
        return this.response;
    }
}
