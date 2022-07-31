package cn.edu.neusoft.liruoxing.model;

import cn.edu.neusoft.liruoxing.activity.MatchDetailActivity;
import cn.edu.neusoft.liruoxing.bean.MatchBean;
import cn.edu.neusoft.liruoxing.bean.MatchDetailBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.service.MatchService;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;

public class MatchModel {
    private Retrofit retrofit1;
    public Retrofit model() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit;
    }

    public MatchModel(){
        retrofit1 = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public void getMatchList(final RetrofitListener listener){
        MatchService matchService = retrofit1.create(MatchService.class);
        Call<MatchBean> call = matchService.getMatchList();
        call.enqueue(new retrofit2.Callback<MatchBean>() {
            @Override
            public void onResponse(retrofit2.Response<MatchBean> response) {
                listener.onSuccess(response.body(),3);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }
    public void getMatchDetail(String id,final MatchDetailActivity listener){
        MatchService matchService = retrofit1.create(MatchService.class);
        Call<MatchDetailBean> call = matchService.getMatchDetail(id);
        call.enqueue(new retrofit2.Callback<MatchDetailBean>() {
            @Override
            public void onResponse(retrofit2.Response<MatchDetailBean> response) {
                listener.onSuccess(response.body(),2);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }
}
