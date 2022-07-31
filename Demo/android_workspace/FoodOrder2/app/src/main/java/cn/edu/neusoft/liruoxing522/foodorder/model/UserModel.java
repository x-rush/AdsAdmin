package cn.edu.neusoft.liruoxing522.foodorder.model;

import cn.edu.neusoft.liruoxing522.foodorder.bean.UserBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.UserIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class UserModel extends BaseModel implements UserIface<UserBean> {
    Service service;
    Retrofit retrofit;

    public UserModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getUserMeg(int user_id, TListener<UserBean> tListener) {
        service=getService();
        Call<UserBean> call = service.getUserMeg(user_id);
        callenqueue(call,tListener);
    }
}
