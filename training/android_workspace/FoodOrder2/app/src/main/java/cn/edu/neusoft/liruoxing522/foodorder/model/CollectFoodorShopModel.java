package cn.edu.neusoft.liruoxing522.foodorder.model;

import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.CollectFoodorShopIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class CollectFoodorShopModel extends BaseModel implements CollectFoodorShopIface<RegisterBean> {
    Service service;
    Retrofit retrofit;

    public CollectFoodorShopModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getfoodcollectedMsg(int user_id, int food_id, TListener<RegisterBean> tListener) {
        service=getService();
        Call<RegisterBean> call = service.getFoodcollect(user_id,food_id);
        callenqueue(call,tListener);
    }

    @Override
    public void getshopcollectedMsg(int user_id, int shop_id, TListener<RegisterBean> tListener) {
        service=getService();
        Call<RegisterBean> call1 = service.getShopcollect(user_id,shop_id);
        callenqueue(call1,tListener);
    }
}
