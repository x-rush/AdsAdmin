package cn.edu.neusoft.liruoxing.service;

import cn.edu.neusoft.liruoxing.bean.ClubBean;
import cn.edu.neusoft.liruoxing.bean.ClubDetailBean;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;


public interface ClubService {
    @GET("club/clubList")
    Call<ClubBean> getClubList();

    @GET("club/clubDetail/club_id/{club_id}")
    Call<ClubDetailBean> getClubDetail(@Path("club_id") String clubId);

    @GET("Club/careClub/user_id/{user_id}/club_id/{club_id}")
    Call<StatusBean> careClub(@Path("user_id") String userId, @Path("club_id") String clubId);

    @GET("Club/cancelCareClub/user_id/{user_id}/club_id/{club_id}")
    Call<StatusBean> cancelCareClub(@Path("user_id") String userId,@Path("club_id") String clubId);

    @GET("Club/careList/user_id/{user_id}")
    Call<ClubBean> careClubList(@Path("user_id") String userId);
}
