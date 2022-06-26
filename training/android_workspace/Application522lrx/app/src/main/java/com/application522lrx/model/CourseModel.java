package com.application522lrx.model;

import com.application522lrx.bean.TwareBean;
import com.application522lrx.iface.CourseListener;
import com.application522lrx.iface.Courseiface;
import com.application522lrx.service.CourseService;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Administrator on 2017/6/10.
 */

public class CourseModel implements Courseiface {

    private CourseService service;
    private static CourseModel model;
    private List<TwareBean> list;
    private Retrofit retrofit;

    private String BASEURL="http://amicool.neusoft.edu.cn/";
    public CourseModel(){//获取对象并解析
        retrofit =new Retrofit.Builder()
                .baseUrl(BASEURL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }
    public static CourseModel getInstance(){
        if(model==null){
            model = new CourseModel();

        }
        return model;
    }

    @Override
    public void getResultList(String mod,final int page, String sessionID, final CourseListener listener) {
        CourseService coursesService =retrofit.create(CourseService.class);
        Call<List<TwareBean>> call= coursesService.getResultList(mod,page,sessionID);
        call.enqueue(new Callback<List<TwareBean>>() {
            @Override
            public void onResponse(Call<List<TwareBean>> call, Response<List<TwareBean>> response) {
                if(response.body()!=null&&response.body().size()!=0){
                    listener.onResponse( response.body());
                }
                else
                {
                    listener.onFail("FAIL");
                }
            }

            @Override
            public void onFailure(Call<List<TwareBean>> call, Throwable t) {
                listener.onFail(t.toString());
            }
        });
    }
}
