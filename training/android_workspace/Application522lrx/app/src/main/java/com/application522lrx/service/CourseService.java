package com.application522lrx.service;

import com.application522lrx.bean.TwareBean;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.Path;
import retrofit2.http.Query;

/**
 * Created by Administrator on 2017/6/10.
 */

public interface CourseService {
    @GET("api.php/lists/mod/{mod}")
    Call<List<TwareBean>> getCourseList(@Path("mod") String mod, @Query("page") int page, @Header("SessionID") String sessionID);

    @GET("api.php/lists/mod/{mod}")
    Call<List<TwareBean>> getResultList(@Path("mod") String mod, @Query("page") int page, @Header("SessionID") String sessionID);
}
