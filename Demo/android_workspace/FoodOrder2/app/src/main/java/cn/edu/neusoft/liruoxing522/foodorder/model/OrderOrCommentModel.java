package cn.edu.neusoft.liruoxing522.foodorder.model;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.bean.OrderOrCommentBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.OrderOrCommentIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class OrderOrCommentModel extends BaseModel implements OrderOrCommentIface<OrderOrCommentBean> {
    Service service;
    Retrofit retrofit;

    public OrderOrCommentModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getOrderMeg(int user_id, ListListener<OrderOrCommentBean> listListener) {
        service=getService();
        Call<List<OrderOrCommentBean>> call = service.getOrderMeg(user_id);
        callenqueueList(call,listListener);
    }

    @Override
    public void getCommentMeg(int user_id, ListListener<OrderOrCommentBean> listListener) {
        service=getService();
        Call<List<OrderOrCommentBean>> call1 = service.getCommentMeg(user_id);
        callenqueueList(call1,listListener);
    }
}
