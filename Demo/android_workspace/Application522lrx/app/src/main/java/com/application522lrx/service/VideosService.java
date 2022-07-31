package com.application522lrx.service;

import com.application522lrx.bean.SVideoBean;
import com.application522lrx.bean.VideoBean;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.Path;
import retrofit2.http.Query;

public interface VideosService {
	@GET("api.php/lists/mod/{mod}")
    Call<List<VideoBean>> getResultList(@Path("mod") String mod, @Query("page") int page, @Header("SessionID") String sessionID);

    @GET("api.php/listspecial/mod/{mod}")
    Call<List<SVideoBean>> getSResultList(@Path("mod") String mod, @Query("page") int page, @Header("SessionID") String sessionID);

    @GET("api.php/lists/mod/{mod}/userid/{userid}")
    Call<List<VideoBean>> getResultList(@Path("mod") String mod, @Query("page") int page, @Header("SessionID") String sessionID,
                                        @Query("userid") int userid);

    @GET("api.php/get/mod/{mod}")
    Call<VideoBean> getVideo(@Path("mod") String mod, @Query("id") int id);
	
}
