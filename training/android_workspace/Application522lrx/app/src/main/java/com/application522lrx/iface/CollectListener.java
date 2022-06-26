package com.application522lrx.iface;

import com.application522lrx.bean.CollectBean;

import java.util.List;

/**
 * Created by Administrator on 2017/6/6.
 */

public interface CollectListener<T> {
    void onResponse(List<CollectBean<T>> beanlist);
    void onFail(String msg);
}