package cn.edu.neusoft.liruoxing.service;

import java.util.List;

import cn.edu.neusoft.liruoxing.bean.CommentStatusBean;
import cn.edu.neusoft.liruoxing.bean.OwnShowBean;
import cn.edu.neusoft.liruoxing.bean.SlideCommentBean;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Multipart;
import retrofit2.http.POST;
import retrofit2.http.Part;
import retrofit2.http.Path;


public interface ShareService {
    @GET("Slide/ownShow/user_id/{user_id}")
    Call<OwnShowBean> getOwnShowList(@Path("user_id") String userId);

    @GET("Slide/comments/show_id/{show_id}")
    Call<List<SlideCommentBean>> commentList(@Path("show_id") String showId);

    @GET("Slide/addComment/show_id/{show_id}/user_id/{user_id}/comment/{comment}")
    Call<CommentStatusBean> comment(@Path("show_id") String show_id,
                                    @Path("user_id") String userId,
                                    @Path("comment") String comment);

    @Multipart
    @POST("Slide/showPic")
    Call<StatusBean> uploadPic(@Part("user_id") String userId,
                               @Part("comment") String comment,
                               @Part("image") RequestBody image);
}
