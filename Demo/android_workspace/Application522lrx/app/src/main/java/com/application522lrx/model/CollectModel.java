package com.application522lrx.model;

import com.application522lrx.bean.ArticleBean;
import com.application522lrx.bean.CollectBean;
import com.application522lrx.iface.CollectListener;
import com.application522lrx.iface.Collectiface;
import com.application522lrx.service.CollectService;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Administrator on 2017/6/6.
 */

public class CollectModel implements Collectiface<ArticleBean> {
    private Retrofit retrofit;
    private String BASEURL
            ="http://amicool.neusoft.edu.cn/";
    //构造函数
    public CollectModel()
    {   //使用Retrofit----1
        retrofit=new Retrofit.Builder()
                .baseUrl(BASEURL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    @Override
    public void getResultList(String mod, int page, String sessionID, final CollectListener<ArticleBean> listener) {
        CollectService service=retrofit.create(CollectService.class);
        System.out.println("---------------haha");
        Call<List<CollectBean<ArticleBean>>> call;
        System.out.println("---------------xixi");

        call=service.getCArticleList(mod,page,sessionID);
        System.out.println("---------------huhu");

        call.enqueue(new Callback<List<CollectBean<ArticleBean>>>() {
            @Override
            public void onResponse(Call<List<CollectBean<ArticleBean>>> call, Response<List<CollectBean<ArticleBean>>> response) {
                if(response.body()!=null && response.isSuccessful()){
                    listener.onResponse(response.body());
                }
                else listener.onFail("onresponse fail");
            }

            @Override
            public void onFailure(Call<List<CollectBean<ArticleBean>>> call, Throwable t) {
                listener.onFail(t.toString());
            }
        });
    }
}
