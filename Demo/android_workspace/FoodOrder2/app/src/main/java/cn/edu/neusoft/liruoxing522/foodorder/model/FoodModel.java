package cn.edu.neusoft.liruoxing522.foodorder.model;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodListBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.FoodIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class FoodModel extends BaseModel implements FoodIface<FoodListBean> {
    Service service;
    Retrofit retrofit;

    public FoodModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getFoodMeg(int shop_id, ListListener<FoodListBean> listListener) {
        service=getService();
        Call<List<FoodListBean>> call = service.getFoodlist(shop_id);
        callenqueueList(call,listListener);
    }
}
