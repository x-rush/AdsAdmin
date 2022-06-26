package cn.edu.neusoft.liruoxing.service;

import cn.edu.neusoft.liruoxing.bean.MatchBean;
import cn.edu.neusoft.liruoxing.bean.MatchDetailBean;
import cn.edu.neusoft.liruoxing.bean.MatchOrderBean;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;


public interface MatchService {
    @GET("match/matchList")
    Call<MatchBean> getMatchList();

    @GET("Match/matchDetail/match_id/{match_id}")
    Call<MatchDetailBean> getMatchDetail(@Path("match_id") String matchId);

    @GET("Match/enroll/user_id/{user_id}/match_id/{match_id}/num/{num}")
    Call<StatusBean> enroll(@Path("user_id") String user_id, @Path("match_id") String matchId, @Path("num") String num);

    @GET("Match/matchOrder/user_id/{user_id}")
    Call<MatchOrderBean> matchOrder(@Path("user_id") String user_id);
}
