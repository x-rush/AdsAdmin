package cn.edu.neusoft.liruoxing522.foodorder.model;

import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodDetailBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.FoodDetailIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class FoodDetailModel extends BaseModel implements FoodDetailIface<FoodDetailBean> {
    Service service;
    Retrofit retrofit;

    public FoodDetailModel(){
        retrofit=getRetrofit();
    }


    @Override
    public void getFoodMeg(int food_id, TListener<FoodDetailBean> tListener) {
        service=getService();
        Call<FoodDetailBean> call = service.getFooddetail(food_id);
        callenqueue(call,tListener);
    }
}
