package cn.edu.neusoft.liruoxing522.foodorder.Iface;

import cn.edu.neusoft.liruoxing522.foodorder.Listener.ListListener;

/**
 * Created by www44 on 2017/11/1.
 */

public interface SearchIface<T> {
    void getSearchMeg(String search, ListListener<T> listListener);
}
