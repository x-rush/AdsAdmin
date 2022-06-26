package cn.edu.neusoft.liruoxing522.foodorder.Iface;

import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;

/**
 * Created by www44 on 2017/11/8.
 */

public interface ChangeIface<T> {
    void getChangeMeg(int user_id, String username, String password, String mobilenum, String address, TListener<T> tListener);
}
