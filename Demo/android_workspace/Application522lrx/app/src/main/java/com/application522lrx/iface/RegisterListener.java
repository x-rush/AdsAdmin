package com.application522lrx.iface;

/**
 * Created by Administrator on 2017/5/27.
 */

public interface RegisterListener {
    void onResponse(String regInfo);
    void onFail(String msg);
}