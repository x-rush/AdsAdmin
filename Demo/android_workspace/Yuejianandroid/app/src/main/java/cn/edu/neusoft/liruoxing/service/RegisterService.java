package cn.edu.neusoft.liruoxing.service;

import cn.edu.neusoft.liruoxing.bean.RegisterBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface RegisterService {
    @GET("Register/index/phone/{phone}/password/{password}/username/{username}")
    Call<RegisterBean> register(@Path("phone") String phone, @Path("password") String password, @Path("username") String username);
}
