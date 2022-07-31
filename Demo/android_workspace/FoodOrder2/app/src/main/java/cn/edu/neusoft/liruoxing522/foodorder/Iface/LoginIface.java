package cn.edu.neusoft.liruoxing522.foodorder.Iface;


import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;

/**
 * Created by MSI on 2017/11/1.
 */

public interface LoginIface<T> {
        void getUserList(String username,
                         String userpass,
                         TListener<T> tListener);

}
