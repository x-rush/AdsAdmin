package cn.edu.neusoft.liruoxing.listener;


public interface RetrofitListener<T> {
    void onSuccess(T t, int flag);
    void onFail(String msg);

}
