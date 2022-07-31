package cn.edu.neusoft.liruoxing522.foodorder.model;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.bean.OrderOrCommentBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.FoodCommentIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class FoodCommentModel extends BaseModel implements FoodCommentIface<OrderOrCommentBean> {
    Service service;
    Retrofit retrofit;

    public FoodCommentModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getFoodCommentMeg(int food_id, ListListener<OrderOrCommentBean> listListener) {
        service=getService();
        Call<List<OrderOrCommentBean>> call = service.getfoodCommentMeg(food_id);
        callenqueueList(call,listListener);
    }
}
