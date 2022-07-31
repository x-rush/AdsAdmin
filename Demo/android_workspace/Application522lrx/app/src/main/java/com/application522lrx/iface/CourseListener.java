package com.application522lrx.iface;

import com.application522lrx.bean.TwareBean;

import java.util.List;

/**
 * Created by Administrator on 2017/6/10.
 */

public interface CourseListener {
    void onResponse(List<TwareBean> list);
    void onFail(String msg);
}
