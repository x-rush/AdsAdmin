package cn.edu.neusoft.liruoxing522.foodorder.Iface;

import cn.edu.neusoft.liruoxing522.foodorder.Listener.TListener;

/**
 * Created by www44 on 2017/11/1.
 */

public interface CommentUpdtorInstIface<T> {
    void getinresultMeg(int order_id, String content, TListener<T> tListener);
    void getupresultMeg(int order_id, String content, TListener<T> tListener);
}
