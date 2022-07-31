package cn.edu.neusoft.liruoxing522.foodorder.Listener;

/**
 * Created by Administrator on 2017/11/8.
 */

public interface TListener <T>{
    void onResponse(T t);
    void onFail(String msg);
}

