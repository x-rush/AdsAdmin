package cn.edu.neusoft.liruoxing.model;

import java.util.List;

import cn.edu.neusoft.liruoxing.bean.OwnShowBean;
import cn.edu.neusoft.liruoxing.bean.SlideCommentBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.service.ShareService;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;

public class ShareModel {
    private Retrofit retrofit1;
    public Retrofit model() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit;
    }
    public ShareModel(){
        retrofit1 = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public void getOwnShowList(final RetrofitListener listener,String userId){
        ShareService shareService = retrofit1.create(ShareService.class);
        Call<OwnShowBean> call = shareService.getOwnShowList(userId);
        call.enqueue(new retrofit2.Callback<OwnShowBean>() {
            @Override
            public void onResponse(retrofit2.Response<OwnShowBean> response) {
                listener.onSuccess(response.body(),1);
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }

    public void getCommentList(final RetrofitListener listener,String slideId){
        ShareService shareService = retrofit1.create(ShareService.class);
        Call<List<SlideCommentBean>> call = shareService.commentList(slideId);
        call.enqueue(new retrofit2.Callback<List<SlideCommentBean>>() {
            @Override
            public void onResponse(retrofit2.Response<List<SlideCommentBean>> response) {
                listener.onSuccess(response.body(),1);
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }


}
