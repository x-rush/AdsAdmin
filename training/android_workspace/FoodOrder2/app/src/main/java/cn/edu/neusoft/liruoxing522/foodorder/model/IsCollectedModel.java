package cn.edu.neusoft.liruoxing522.foodorder.model;

import cn.edu.neusoft.liruoxing522.foodorder.bean.IsCollectBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.IsCollectedIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class IsCollectedModel extends BaseModel implements IsCollectedIface<IsCollectBean> {
    Service service;
    Retrofit retrofit;

    public IsCollectedModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getcollectedMsg(int user_id, int shop_food_id, int flag, TListener<IsCollectBean> tListener) {
        service=getService();
        Call<IsCollectBean> call = service.getIscollected(user_id,shop_food_id,flag);
        callenqueue(call,tListener);
    }
}
