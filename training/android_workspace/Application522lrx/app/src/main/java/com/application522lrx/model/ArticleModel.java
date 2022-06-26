package com.application522lrx.model;

import com.application522lrx.bean.ArticleBean;
import com.application522lrx.iface.ArticleListerner;
import com.application522lrx.iface.Articleiface;
import com.application522lrx.service.ArticleService;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Administrator on 2017/5/16.
 */

public class ArticleModel implements Articleiface {
    private static ArticleModel model;
    private Retrofit retrofit;
    private String BASEURL="http://amicool.neusoft.edu.cn/";

    public ArticleModel(){
        retrofit = new Retrofit.Builder()
                .baseUrl(BASEURL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }
    public static ArticleModel getInstance(){
        if(model==null){
            model = new ArticleModel();

        }
        return model;
    }

    public void getResultList(String mod, int page, String sessionID, final ArticleListerner listener) {
        ArticleService articeservice = retrofit.create(ArticleService.class);
        Call<List<ArticleBean>> call = articeservice.getArticleList(mod, page, sessionID);
        call.enqueue(new Callback<List<ArticleBean>>() {
            @Override
            public void onResponse(Call<List<ArticleBean>> call, Response<List<ArticleBean>> response) {
                if (response.body()!=null&&response.body().size()!=0) {
                    listener.onResponse(response.body());
                } else {
                    listener.onFail("FAIL");
                }
            }

            @Override
            public void onFailure(Call<List<ArticleBean>> call, Throwable t) {
                listener.onFail(t.toString());
            }
        });
    }
}
