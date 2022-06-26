package cn.edu.neusoft.liruoxing.service;

import cn.edu.neusoft.liruoxing.bean.LoginBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface LoginService {
    @GET("Login/index")
    Call<LoginBean> login(@Query("phone") String phone, @Query("password") String password);
}
