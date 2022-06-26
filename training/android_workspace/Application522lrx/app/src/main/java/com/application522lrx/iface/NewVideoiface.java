package com.application522lrx.iface;

/**
 * Created by zci on 2017/5/15.
 */

public interface NewVideoiface {
    void getResultList(String mod, int page, String sessionID,
                       NewVideoListener listener);
}
