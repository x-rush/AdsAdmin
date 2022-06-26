package com.application522lrx.iface;

import com.application522lrx.bean.VideoBean;

import java.util.List;

/**
 * Created by zci on 2017/5/15.
 */

public interface NewVideoListener {
    void onResponse(List<VideoBean> list);
    void onFail(String msg);
}
