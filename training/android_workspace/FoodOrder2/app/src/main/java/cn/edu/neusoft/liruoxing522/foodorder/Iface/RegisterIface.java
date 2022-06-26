package cn.edu.neusoft.liruoxing522.foodorder.Iface;


import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;

/**
 * Created by MSI on 2017/11/13.
 */
public interface RegisterIface<T> {
    void getReglist(String username,String password, String mobilenum,String address,String comment,TListener<T> tListener);
}