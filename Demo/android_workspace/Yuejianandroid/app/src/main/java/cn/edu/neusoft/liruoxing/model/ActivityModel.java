package cn.edu.neusoft.liruoxing.model;

import cn.edu.neusoft.liruoxing.activity.ActivityDetailActivity;
import cn.edu.neusoft.liruoxing.bean.ActivityBean;
import cn.edu.neusoft.liruoxing.bean.ActivityDetailBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.service.ActivityService;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;

public class ActivityModel {
    private  Retrofit retrofit1;
    public Retrofit model() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit;
    }

    public ActivityModel(){
        retrofit1 = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public void getActivityList(final RetrofitListener listener){
        ActivityService activityService = retrofit1.create(ActivityService.class);
        Call<ActivityBean> call = activityService.getActivityList();
        call.enqueue(new retrofit2.Callback<ActivityBean>() {
            @Override
            public void onResponse(retrofit2.Response<ActivityBean> response) {
                listener.onSuccess(response.body(),1);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }

    public void getActivityDetail(String id,final ActivityDetailActivity listener){
        ActivityService activityService = retrofit1.create(ActivityService.class);
        Call<ActivityDetailBean> call = activityService.getActivityDetail(id);
        call.enqueue(new retrofit2.Callback<ActivityDetailBean>() {
            @Override
            public void onResponse(retrofit2.Response<ActivityDetailBean> response) {
                listener.onSuccess(response.body(),3);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }

}
