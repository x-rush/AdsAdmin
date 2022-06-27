package cn.edu.neusoft.liruoxing522.kuaidi;

/**
 * Created by Thinkpad on 2017/10/11.
 */

public interface DeliverListener {
    void onResponse(Deliver deliver);
    void onFail(String msg);
}
