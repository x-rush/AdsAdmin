package cn.edu.neusoft.liruoxing522.foodorder.model;

import cn.edu.neusoft.liruoxing522.foodorder.bean.PurchaseBean;
import cn.edu.neusoft.liruoxing522.foodorder.Iface.PurchaseIface;
import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;
import cn.edu.neusoft.liruoxing522.foodorder.Service.Service;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Created by www44 on 2017/11/1.
 */

public class PurchaseModel extends BaseModel implements PurchaseIface<PurchaseBean> {
    Service service;
    Retrofit retrofit;

    public PurchaseModel(){
        retrofit=getRetrofit();
    }

    @Override
    public void getPurchaseMsg(int user_id, int food_id, int num, double sum, String suggesttion, TListener<PurchaseBean> tListener) {
        service=getService();
        Call<PurchaseBean> call = service.getPurchase(user_id,food_id,num,sum,suggesttion);
        callenqueue(call,tListener);
    }
}
