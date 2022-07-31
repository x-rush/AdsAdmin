package cn.edu.neusoft.liruoxing.model;

import retrofit2.GsonConverterFactory;
import retrofit2.Retrofit;

public class LoginModel {
    public Retrofit model() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://10.0.2.2/Yuejianphp/public/api/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        return retrofit;
    }
}
