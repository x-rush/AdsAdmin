package cn.edu.neusoft.liruoxing522.foodorder.model;

import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.ChangeIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/13.
 */

public class ChangeModel extends BaseModel implements ChangeIface<RegisterBean> {
    Service service;
    Retrofit retrofit;

    public ChangeModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getChangeMeg(int user_id, String username, String password, String mobilenum, String address, TListener<RegisterBean> tListener) {
        service=getService();
        Call<RegisterBean> call = service.getchangeMeg(user_id,username,password,mobilenum,address);
        callenqueue(call,tListener);
    }
}
