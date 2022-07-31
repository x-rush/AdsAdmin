package com.application522lrx.iface;

import com.application522lrx.bean.UserBean;

/**
 * Created by Administrator on 2017/5/25.
 */

public interface LoginListener {
    void onResponse(UserBean userBean);
    void onFail(String msg);
}