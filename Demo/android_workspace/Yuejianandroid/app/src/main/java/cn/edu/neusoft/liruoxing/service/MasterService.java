package cn.edu.neusoft.liruoxing.service;

import cn.edu.neusoft.liruoxing.bean.CommentBean;
import cn.edu.neusoft.liruoxing.bean.MasterBean;
import cn.edu.neusoft.liruoxing.bean.MasterDetailBean;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;


public interface MasterService {
    @GET("Master/masterList")
    Call<MasterBean> getMasterList();

    @GET("Master/masterDetail/master_id/{master_id}")
    Call<MasterDetailBean> getMasterDetail(@Path("master_id") String masterId);

    @GET("Master/comment/comment_content/{comment_content}/master_id/{master_id}/user_id/{user_id}")
    Call<CommentBean> comment(@Path("comment_content") String comment_content,
                              @Path("master_id") String masterId,
                              @Path("user_id") String userId);

    @GET("Master/careMaster/user_id/{user_id}/master_id/{master_id}")
    Call<StatusBean> careMaster(@Path("user_id") String userId,@Path("master_id") String masterId);

    @GET("Master/cancelCareMaster/user_id/{user_id}/master_id/{master_id}")
    Call<StatusBean> cancelCareMaster(@Path("user_id") String userId,@Path("master_id") String masterId);

    @GET("Master/careList/user_id/{user_id}")
    Call<MasterBean> careMasterList(@Path("user_id") String userId);

}
