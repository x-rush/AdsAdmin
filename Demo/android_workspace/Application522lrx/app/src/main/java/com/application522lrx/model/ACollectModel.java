package com.application522lrx.model;

import com.application522lrx.bean.ArticleBean;
import com.application522lrx.iface.ACollectListener;
import com.application522lrx.iface.ACollectiface;
import com.application522lrx.iface.ArticleListerner;
import com.application522lrx.iface.Articleiface;
import com.application522lrx.service.ACollectService;
import com.application522lrx.service.ArticleService;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.scalars.ScalarsConverterFactory;

/**
 * Created by Administrator on 2017/6/11.
 */

public class ACollectModel implements ACollectiface,Articleiface {
    private Retrofit retrofit;
    private String BASEURL
            ="http://amicool.neusoft.edu.cn/";
    //构造函数
    public ACollectModel()
    {   //使用Retrofit----1
        retrofit=new Retrofit.Builder()
                .baseUrl(BASEURL)
                .addConverterFactory(ScalarsConverterFactory.create())
                .build();
    }
    //收藏
    @Override
    public void collect(String mod, int id, String sessionid, final ACollectListener listener) {
        //使用Retrofit----2
        ACollectService collectService=retrofit.create(ACollectService.class);
        Call<String> call=collectService.collect(mod,id,sessionid);
        //使用Retrofit----3
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                if(response.isSuccessful() && response!=null)
                {  if(response.body().trim().toString().equals("0"))
                    listener.onResponse("1");//收藏失败
                else if(!response.body().trim().toString().contains("error"))
                    listener.onResponse("2");//收藏成功
                else
                    listener.onResponse("收藏："+response.body());


                }
                else   listener.onFail("collect onresponse fail");//
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                listener.onFail("收藏失败："+t.toString());
            }
        });
    }
    //取消收藏
    @Override
    public void uncollect(String mod, int id, String sessionid, final ACollectListener listener) {
        //使用Retrofit----2
        ACollectService  collectService=retrofit.create(ACollectService.class);
        Call<String> call=collectService.uncollect(mod,id,sessionid);
        //使用Retrofit----3
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                if(response.isSuccessful() && response!=null)
                {  if(response.body().trim().toString().equals("0"))
                    listener.onResponse("4");//取消收藏失败
                else if (response.body().trim().toString().equals("1"))
                    listener.onResponse("5");//取消收藏成功
                else
                    listener.onResponse("取消收藏："+response.body());

                }
                else   listener.onFail("uncollect onresponse fail");//uncollect onresponse fail
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                listener.onFail("取消收藏失败："+t.toString());
            }
        });
    }
    //判断是否收藏
    @Override
    public void exist(String mod, int id, String sessionid, final ACollectListener listener) {
        //使用Retrofit----2
        final ACollectService  collectService=retrofit.create(ACollectService.class);
        Call<String> call=collectService.exists(mod,id,sessionid);
        //使用Retrofit----3
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                if(response.isSuccessful() && response!=null)
                {  if(response.body().trim().toString().equals("0"))//已收藏
                    listener.onResponse("7");
                else if (response.body().trim().toString().equals("1"))//未收藏
                    listener.onResponse("8");
                else
                    listener.onResponse("判断收藏："+response.body());

                }
                else   listener.onFail("collect exist onresponse fail");//
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                listener.onFail("判断收藏失败："+t.toString());
            }
        });
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
