package cn.edu.neusoft.liruoxing522.foodorder.Iface;

import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;

/**
 * Created by www44 on 2017/12/10.
 */

public interface PurchaseIface<T> {
    void getPurchaseMsg(int user_id, int food_id, int num, double sum, String suggesttion, TListener<T> tListener);
}
