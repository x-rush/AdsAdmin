package com.application522lrx.model;

import com.application522lrx.bean.UserBean;
import com.application522lrx.iface.LoginListener;
import com.application522lrx.service.LoginService;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Administrator on 2017/5/25.
 */

public class LoginModel {
    Retrofit retrofit;
    private static String BASEURL="http://amicool.neusoft.edu.cn/";

    public LoginModel() {
        retrofit=new Retrofit.Builder()
                .baseUrl(BASEURL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }
    public void login(String userName, String passWord, final LoginListener listener){
        LoginService service =retrofit.create(LoginService.class);
        Call<UserBean> call =service.getLogin(userName,passWord);
        call.enqueue(new Callback<UserBean>() {
            @Override
            public void onResponse(Call<UserBean> call, Response<UserBean> response) {
                if(response.body()!=null && response.isSuccessful()){

                    listener.onResponse(response.body());

                }
                else{

                    listener.onFail("onResponse fail");//使用了java的回调机制
                }
            }

            @Override
            public void onFailure(Call<UserBean> call, Throwable t) {
                listener.onFail(t.toString());
            }
        });
    }
}
