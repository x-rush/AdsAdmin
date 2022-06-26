package cn.edu.neusoft.liruoxing522.kuaidi;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/**
 * Created by Thinkpad on 2017/10/11.
 */

public interface Service {
 @GET("query")
 Call<Deliver> getAddress(@Query("type") String type, @Query("postid") String postid);
}
