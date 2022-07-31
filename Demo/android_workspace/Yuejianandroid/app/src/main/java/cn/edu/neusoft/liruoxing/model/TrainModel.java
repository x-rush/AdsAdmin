package cn.edu.neusoft.liruoxing.model;

import cn.edu.neusoft.liruoxing.activity.TrainDetailActivity;
import cn.edu.neusoft.liruoxing.bean.TrainBean;
import cn.edu.neusoft.liruoxing.bean.TrainDetailBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.service.TrainService;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;


public class TrainModel {
    private  Retrofit retrofit1;
    public Retrofit model() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit;
    }
    public TrainModel(){
        retrofit1 = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public void getTrainList(final RetrofitListener listener){
        TrainService trainListService = retrofit1.create(TrainService.class);
        Call<TrainBean> call = trainListService.getTrainList();
        call.enqueue(new retrofit2.Callback<TrainBean>() {
            @Override
            public void onResponse(retrofit2.Response<TrainBean> response) {
                listener.onSuccess(response.body(),3);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }


    public void getTrainDetail(String id,final TrainDetailActivity listener){
        TrainService trainService = retrofit1.create(TrainService.class);
        Call<TrainDetailBean> call = trainService.getTrainDetail(id);
        call.enqueue(new retrofit2.Callback<TrainDetailBean>() {
            @Override
            public void onResponse(retrofit2.Response<TrainDetailBean> response) {
                listener.onSuccess(response.body(),4);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }
}
