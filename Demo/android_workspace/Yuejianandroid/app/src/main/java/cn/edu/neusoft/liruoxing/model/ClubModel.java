package cn.edu.neusoft.liruoxing.model;

import cn.edu.neusoft.liruoxing.activity.ClubDetailActivity;
import cn.edu.neusoft.liruoxing.bean.ClubDetailBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.bean.ClubBean;
import cn.edu.neusoft.liruoxing.service.ClubService;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;

public class ClubModel {
    private  Retrofit retrofit1;

    public Retrofit model() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit;
    }

    public ClubModel(){
        retrofit1 = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }
    public void getClubList(final RetrofitListener listener){
        ClubService clubListService = retrofit1.create(ClubService.class);
        Call<ClubBean> call = clubListService.getClubList();
        call.enqueue(new retrofit2.Callback<ClubBean>() {
            @Override
            public void onResponse(retrofit2.Response<ClubBean> response) {
                listener.onSuccess(response.body(),1);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }
            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }


    public void getClubDetail(String id,final ClubDetailActivity listener){
        ClubService clubService = retrofit1.create(ClubService.class);
        Call<ClubDetailBean> call = clubService.getClubDetail(id);
        call.enqueue(new retrofit2.Callback<ClubDetailBean>() {
            @Override
            public void onResponse(retrofit2.Response<ClubDetailBean> response) {
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
