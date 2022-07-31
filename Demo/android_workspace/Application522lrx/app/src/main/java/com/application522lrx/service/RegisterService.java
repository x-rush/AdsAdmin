package com.application522lrx.service;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/**
 * Created by Administrator on 2017/6/6.
 */

public interface RegisterService {
    @GET("api.php/reg")
    Call<String> getReg(@Query("username") String username,
                        @Query("password") String password, @Query("tel") String tel);
}
