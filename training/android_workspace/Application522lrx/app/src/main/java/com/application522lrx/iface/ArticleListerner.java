package com.application522lrx.iface;

import com.application522lrx.bean.ArticleBean;

import java.util.List;

/**
 * Created by Administrator on 2017/5/16.
 */

public interface ArticleListerner {
    void onResponse(List<ArticleBean> list);
    void onFail(String msg);
}
