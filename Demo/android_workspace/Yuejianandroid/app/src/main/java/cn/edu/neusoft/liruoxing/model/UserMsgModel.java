package cn.edu.neusoft.liruoxing.model;

import cn.edu.neusoft.liruoxing.bean.UserBean;
import cn.edu.neusoft.liruoxing.listener.RetrofitListener;
import cn.edu.neusoft.liruoxing.service.MineMsgService;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;

public class UserMsgModel {
    private Retrofit retrofit1;

    public Retrofit model() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit;
    }

    public UserMsgModel() {
        retrofit1 = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public void getUserMessage(final RetrofitListener listener, String UserId) {
        MineMsgService mineMessageService = retrofit1.create(MineMsgService.class);
        Call<UserBean> call = mineMessageService.getUserMessage(UserId);
        call.enqueue(new retrofit2.Callback<UserBean>() {
            @Override
            public void onResponse(retrofit2.Response<UserBean> response) {
                listener.onSuccess(response.body(), 1);
                //list_club.setAdapter(new ClubAdapter(response.body()));
            }

            @Override
            public void onFailure(Throwable t) {
                listener.onFail(t.getMessage());
            }
        });
    }

//    public void updateMessage(final RetrofitListener listener,
//                              String userId, String username,
//                              String phone, String address, String password) {
//        MineMsgService mineMessageService = retrofit1.create(MineMsgService.class);
//        Call<UserBean> call = mineMessageService.updateMessage(userId, username, phone, address, password);
//        call.enqueue(new retrofit2.Callback<UserBean>() {
//            @Override
//            public void onResponse(retrofit2.Response<UserBean> response) {
//                listener.onSuccess(response.body(), 2);
//                //list_club.setAdapter(new ClubAdapter(response.body()));
//            }
//
//            @Override
//            public void onFailure(Throwable t) {
//                listener.onFail(t.getMessage());
//            }
//        });
//    }


}
