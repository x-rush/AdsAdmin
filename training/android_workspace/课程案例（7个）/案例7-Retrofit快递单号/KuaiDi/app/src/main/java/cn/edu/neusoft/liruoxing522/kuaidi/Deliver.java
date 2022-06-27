package cn.edu.neusoft.liruoxing522.kuaidi;

import java.util.List;

/**
 * Created by Thinkpad on 2017/10/11.
 */

public class Deliver {

    /**
     * message : ok
     * nu : 452248118504
     * ischeck : 1
     * condition : F00
     * com : zhongtong
     * status : 200
     * state : 3
     * data : [{"time":"2017-09-07 19:28:01","ftime":"2017-09-07 19:28:01","context":"[大连市] [大连沙区十部]的派件已签收 感谢使用中通快递,期待再次为您服务!","location":"大连沙区十部"},{"time":"2017-09-07 13:30:42","ftime":"2017-09-07 13:30:42","context":"[大连市] [大连沙区十部]的丛培杰15840909132正在第1次派件 电话:15840909132 请保持电话畅通、耐心等待","location":"大连沙区十部"},{"time":"2017-09-07 12:58:29","ftime":"2017-09-07 12:58:29","context":"[大连市] 快件到达 [大连沙区十部]","location":"大连沙区十部"},{"time":"2017-09-07 08:58:48","ftime":"2017-09-07 08:58:48","context":"[大连市] 快件离开 [大连]已发往[大连沙区十部]","location":"大连"},{"time":"2017-09-07 07:17:20","ftime":"2017-09-07 07:17:20","context":"[大连市] 快件到达 [大连]","location":"大连"},{"time":"2017-09-05 20:08:51","ftime":"2017-09-05 20:08:51","context":"[嘉兴市] 快件离开 [杭州中转部]已发往[大连]","location":"杭州中转部"},{"time":"2017-09-05 03:42:09","ftime":"2017-09-05 03:42:09","context":"[嘉兴市] 快件到达 [杭州中转部]","location":"杭州中转部"},{"time":"2017-09-04 21:40:26","ftime":"2017-09-04 21:40:26","context":"[金华市] 快件离开 [金华中转部]已发往[杭州中转部]","location":"金华中转部"},{"time":"2017-09-04 21:07:18","ftime":"2017-09-04 21:07:18","context":"[金华市] 快件到达 [金华中转部]","location":"金华中转部"},{"time":"2017-09-04 19:35:05","ftime":"2017-09-04 19:35:05","context":"[金华市] 快件离开 [义乌中转部]已发往[金华中转部]","location":"义乌中转部"},{"time":"2017-09-04 19:33:47","ftime":"2017-09-04 19:33:47","context":"[金华市] 快件到达 [义乌中转部]","location":"义乌中转部"},{"time":"2017-09-03 21:40:42","ftime":"2017-09-03 21:40:42","context":"[金华市] 快件离开 [义乌营销部]已发往[大连]","location":"义乌营销部"},{"time":"2017-09-03 21:40:26","ftime":"2017-09-03 21:40:26","context":"[金华市] [义乌营销部]的义乌市场营销部已收件 电话:17769759013","location":"义乌营销部"}]
     */

    private String message;
    private String nu;
    private String ischeck;
    private String condition;
    private String com;
    private String status;
    private String state;
    private List<DataBean> data;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getNu() {
        return nu;
    }

    public void setNu(String nu) {
        this.nu = nu;
    }

    public String getIscheck() {
        return ischeck;
    }

    public void setIscheck(String ischeck) {
        this.ischeck = ischeck;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getCom() {
        return com;
    }

    public void setCom(String com) {
        this.com = com;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * time : 2017-09-07 19:28:01
         * ftime : 2017-09-07 19:28:01
         * context : [大连市] [大连沙区十部]的派件已签收 感谢使用中通快递,期待再次为您服务!
         * location : 大连沙区十部
         */

        private String time;
        private String ftime;
        private String context;
        private String location;

        public String getTime() {
            return time;
        }

        public void setTime(String time) {
            this.time = time;
        }

        public String getFtime() {
            return ftime;
        }

        public void setFtime(String ftime) {
            this.ftime = ftime;
        }

        public String getContext() {
            return context;
        }

        public void setContext(String context) {
            this.context = context;
        }

        public String getLocation() {
            return location;
        }

        public void setLocation(String location) {
            this.location = location;
        }
    }
}
