package cn.edu.neusoft.liruoxing522.foodorder.Iface;

import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;

/**
 * Created by www44 on 2017/12/10.
 */

public interface CollectFoodorShopIface<T> {
    void getfoodcollectedMsg(int user_id, int food_id, TListener<T> tListener);
    void getshopcollectedMsg(int user_id, int shop_id, TListener<T> tListener);
}
