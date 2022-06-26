package cn.edu.neusoft.liruoxing522.foodorder.Listener;

import java.util.List;

/**
 * Created by Administrator on 2017/11/8.
 */

public interface ListListener<T>{
    void onResponse(List<T> t);
    void onFail(String msg);
}

