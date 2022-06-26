package cn.edu.neusoft.liruoxing522.retrofitdemo;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/**
 * Created by Administrator on 2017/10/11.
 */

public interface Service {
    @GET("geocoding")
    Call<Address> getAddress(@Query("a")String a);
}
