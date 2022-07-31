package cn.edu.neusoft.liruoxing522.foodorder.Service;


import cn.edu.neusoft.liruoxing522.foodorder.bean.LoginBean;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

/**
 * Created by MSI on 2017/11/1.
 */

public interface LoginService {
    @GET("userLogin.do")
    Call<LoginBean> getAddress(@Query("username") String username, @Query("userpass") String userpass);
}
