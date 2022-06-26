package cn.edu.neusoft.liruoxing.service;

import cn.edu.neusoft.liruoxing.bean.ActivityBean;
import cn.edu.neusoft.liruoxing.bean.ActivityDetailBean;
import cn.edu.neusoft.liruoxing.bean.ActivityOrderBean;
import cn.edu.neusoft.liruoxing.bean.StatusBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;


public interface ActivityService {
    @GET("activity/activityList")
    Call<ActivityBean> getActivityList();

    @GET("activity/activityDetail/activity_id/{activity_id}")
    Call<ActivityDetailBean> getActivityDetail(@Path("activity_id") String activityId);

    @GET("activity/enroll/user_id/{user_id}/activity_id/{activity_id}/num/{num}")
    Call<StatusBean> enroll(@Path("user_id") String user_id,@Path("activity_id") String activity_id,@Path("num") String num);

    @GET("activity/activityOrder/user_id/{user_id}")
    Call<ActivityOrderBean> activityOrder(@Path("user_id") String user_id);

}
