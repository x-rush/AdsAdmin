package com.application522lrx.iface;

/**
 * Created by Administrator on 2017/6/11.
 */

public interface ACollectiface {
    void collect(String mod, int id, String sessionid, ACollectListener listener);
    void uncollect(String mod, int id, String sessionid, ACollectListener listener);
    void exist(String mod, int id, String sessionid, ACollectListener listener);

}
