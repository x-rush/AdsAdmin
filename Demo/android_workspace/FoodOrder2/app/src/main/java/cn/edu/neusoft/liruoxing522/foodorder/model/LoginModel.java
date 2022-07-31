package cn.edu.neusoft.liruoxing522.foodorder.model;

import retrofit2.Call;

import cn.edu.neusoft.liruoxing522.foodorder.Iface.LoginIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import cn.edu.neusoft.liruoxing522.foodorder.bean.LoginBean;
import retrofit2.Retrofit;

/**
 * Created by Administrator on 2017/11/8.
 */
public class LoginModel extends BaseModel implements LoginIface<LoginBean> {
    Service service;
    Retrofit retrofit;

    public LoginModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getUserList(String username, String password, final TListener<LoginBean> tListener) {
        service=getService();
        Call<LoginBean> call = service.getAddress(username,password);
        callenqueue(call,tListener);
    }
}