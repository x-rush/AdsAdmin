package com.application522lrx.service;

import com.application522lrx.bean.ArticleBean;
import com.application522lrx.bean.CollectBean;
import com.application522lrx.bean.TwareBean;
import com.application522lrx.bean.VideoBean;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.Path;
import retrofit2.http.Query;

/**
 * Created by Administrator on 2017/6/6.
 */

public interface CollectService {
    @GET("api.php/listmycollect/mod/collect{mod}")
    Call<List<CollectBean<ArticleBean>>> getCArticleList(
            @Path("mod") String mod,
            @Query("page") int page,
            @Header("SessionID") String sessionID);

    @GET("api.php/listmycollect/mod/collect{mod}")
    Call<List<CollectBean<VideoBean>>> getCVideoList(
            @Path("mod") String mod,
            @Query("page") int page,
            @Header("SessionID") String sessionID);
    @GET("api.php/listmycollect/mod/collect{mod}")
    Call<List<CollectBean<TwareBean>>> getCTwareList(
            @Path("mod") String mod,
            @Query("page") int page,
            @Header("SessionID") String sessionID);

}
