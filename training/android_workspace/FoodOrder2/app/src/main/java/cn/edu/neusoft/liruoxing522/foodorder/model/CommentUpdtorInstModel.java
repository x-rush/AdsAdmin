package cn.edu.neusoft.liruoxing522.foodorder.model;

import cn.edu.neusoft.liruoxing522.foodorder.bean.RegisterBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.CommentUpdtorInstIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class CommentUpdtorInstModel extends BaseModel implements CommentUpdtorInstIface<RegisterBean> {
    Service service;
    Retrofit retrofit;

    public CommentUpdtorInstModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getinresultMeg(int order_id, String content, TListener<RegisterBean> tListener) {
        service=getService();
        Call<RegisterBean> call = service.getinCommentMeg(order_id,content);
        callenqueue(call,tListener);
    }

    @Override
    public void getupresultMeg(int order_id, String content, TListener<RegisterBean> tListener) {
        service=getService();
        Call<RegisterBean> call1 = service.getupdtCommentMeg(order_id,content);
        callenqueue(call1,tListener);
    }
}
