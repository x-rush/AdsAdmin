package com.application522lrx.service;

import com.application522lrx.bean.ArticleBean;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.Path;
import retrofit2.http.Query;

/**
 * Created by Administrator on 2017/5/16.
 */

public interface ArticleService {
        @GET("api.php/lists/mod/{mod}")
        Call<List<ArticleBean>> getArticleList(@Path("mod") String mod, @Query("page") int page, @Header("SessionID") String sessionID);

        @GET("api.php/lists/mod/{mod}/userid/{userid}")
        Call<List<ArticleBean>> getArticleList(@Path("mod") String mod, @Query("page") int page, @Header("SessionID") String sessionID,
                                               @Query("userid") int userid);
}
