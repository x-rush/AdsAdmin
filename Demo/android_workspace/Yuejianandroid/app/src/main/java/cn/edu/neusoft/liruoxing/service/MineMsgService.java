package cn.edu.neusoft.liruoxing.service;

import cn.edu.neusoft.liruoxing.bean.StatusBean;
import cn.edu.neusoft.liruoxing.bean.UserBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface MineMsgService {
    @GET("Person/persons/user_id/{user_id}")
    Call<UserBean> getUserMessage(@Path("user_id") String userId);

    @GET("Person/updateMessage/user_id/{user_id}/username/{username}/phone/{phone}/address/{address}/password/{password}")
    Call<StatusBean> updateMessage(@Path("user_id") String userId, @Path("username") String username,
                                   @Path("phone") String phone, @Path("address") String address,
                                   @Path("password") String password);
}
