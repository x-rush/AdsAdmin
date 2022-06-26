package cn.edu.neusoft.liruoxing522.retrofitdemo;

/**
 * Created by Administrator on 2017/10/11.
 */

public interface AddressListener {
    void onResponse(Address address);
    void onFail(String msg);
}
