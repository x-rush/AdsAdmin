package com.application522lrx.service;

import com.application522lrx.bean.UserBean;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/**
 * Created by Administrator on 2017/5/25.
 */

public interface LoginService {
    @GET("api.php/login")
    Call<UserBean> getLogin(
            @Query("username") String userName,
            @Query("password") String passWord
//            @Header("SessionID") String sessionID
    );
}