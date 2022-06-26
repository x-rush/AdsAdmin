package com.application522lrx.model;

import com.application522lrx.bean.VideoBean;
import com.application522lrx.iface.NewVideoListener;
import com.application522lrx.iface.NewVideoiface;
import com.application522lrx.service.VideosService;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Neusoft on 2016/12/21.
 */

public class NewVideosModel implements NewVideoiface {
    private static NewVideosModel model;
    private List<VideoBean> list;
    private Retrofit retrofit;

    private String BASEURL="http://amicool.neusoft.edu.cn/";
    public NewVideosModel(){
        retrofit =new Retrofit.Builder()
                .baseUrl(BASEURL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }
    public static NewVideosModel getInstance(){
        if(model==null){
            model = new NewVideosModel();

        }
        return model;
    }

    @Override
    public void getResultList(String mod, final int page, String sessionID, final NewVideoListener listener) {
        VideosService videosService =retrofit.create(VideosService.class);
        Call<List<VideoBean>> call= videosService.getResultList(mod,page,sessionID);
        call.enqueue(new Callback<List<VideoBean>>() {
            @Override
            public void onResponse(Call<List<VideoBean>> call, Response<List<VideoBean>> response) {
                if(response.body()!=null&&response.body().size()!=0){
                    listener.onResponse( response.body());
                }
                else
                {
                    listener.onFail("FAIL");
                }
            }

            @Override
            public void onFailure(Call<List<VideoBean>> call, Throwable t) {
                listener.onFail(t.toString());
            }
        });
    }
}
