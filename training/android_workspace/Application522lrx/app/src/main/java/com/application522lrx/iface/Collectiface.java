package com.application522lrx.iface;

/**
 * Created by Administrator on 2017/6/6.
 */

public interface Collectiface <T>{
    void getResultList(String mod,
                       int page,
                       String sessionID,
                       CollectListener<T> listener);
}
