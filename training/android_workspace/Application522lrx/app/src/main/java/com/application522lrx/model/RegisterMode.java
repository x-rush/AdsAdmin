package com.application522lrx.model;

import com.application522lrx.iface.RegisterListener;
import com.application522lrx.service.RegisterService;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.scalars.ScalarsConverterFactory;

/**
 * Created by Administrator on 2017/6/6.
 */

public class RegisterMode {
    Retrofit retrofit;
    private static String BASEURL="http://amicool.neusoft.edu.cn/";
    public RegisterMode(){
        retrofit=new Retrofit.Builder()
                .baseUrl(BASEURL)
                .addConverterFactory(ScalarsConverterFactory.create())
                .build();
    }
    public void register(String userName, String passWord, String tel, final RegisterListener listener){
        RegisterService service = retrofit.create(RegisterService.class);
        Call<String> call = service.getReg(userName,passWord,tel);
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                if(response.body()!=null && response.isSuccessful()){

                    listener.onResponse(response.body());

                }
                else{

                    listener.onFail("onResponse fail");//使用了java的回调机制
                }
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                listener.onFail(t.toString());
            }
        });
    }
}
