package cn.edu.neusoft.liruoxing.model;

import cn.edu.neusoft.liruoxing.activity.MasterDetailActivity;
import cn.edu.neusoft.liruoxing.bean.CommentBean;
import cn.edu.neusoft.liruoxing.bean.MasterBean;
import cn.edu.neusoft.liruoxing.bean.MasterDetailBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.service.MasterService;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;


public class MasterModel {
    private  Retrofit retrofit1;
    public Retrofit model() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit;
    }

    public MasterModel(){
        retrofit1 = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public void getMasterList(final RetrofitListener listener){
        MasterService masterService = retrofit1.create(MasterService.class);
        Call<MasterBean> call = masterService.getMasterList();
        call.enqueue(new retrofit2.Callback<MasterBean>() {
            @Override
            public void onResponse(retrofit2.Response<MasterBean> response) {
                listener.onSuccess(response.body(),2);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }

    public void getMasterDetail(String id,final MasterDetailActivity listener){
        MasterService masterService = retrofit1.create(MasterService.class);
        Call<MasterDetailBean> call = masterService.getMasterDetail(id);
        call.enqueue(new retrofit2.Callback<MasterDetailBean>() {
            @Override
            public void onResponse(retrofit2.Response<MasterDetailBean> response) {
                listener.onSuccess(response.body(),3);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }

    public void comment(String comment_content, String masterId,String userId,
                        final RetrofitListener listener){
        MasterService masterService = retrofit1.create(MasterService.class);
        Call<CommentBean> call = masterService.comment(comment_content,masterId,userId);
        call.enqueue(new retrofit2.Callback<CommentBean>() {
            @Override
            public void onResponse(retrofit2.Response<CommentBean> response) {
                listener.onSuccess(response.body(),1);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }
}
