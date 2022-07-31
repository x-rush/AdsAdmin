package cn.edu.neusoft.liruoxing522.foodorder.model;

import java.util.List;

import cn.edu.neusoft.liruoxing522.foodorder.bean.FoodListBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.SearchIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class SearchModel extends BaseModel implements SearchIface<FoodListBean> {
    Service service;
    Retrofit retrofit;

    public SearchModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getSearchMeg(String search, ListListener<FoodListBean> listListener) {
        service=getService();
        Call<List<FoodListBean>> call = service.getSearchMsg(search);
        callenqueueList(call,listListener);
    }
}
