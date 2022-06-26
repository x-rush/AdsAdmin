package cn.edu.neusoft.liruoxing.bean;

import java.util.List;

public class MatchBean {
    private int status;
    private String message;
    private List<MatchBean.DataBean> data;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<MatchBean.DataBean> getData() {
        return data;
    }

    public void setData(List<MatchBean.DataBean> data) {
        this.data = data;
    }

    public static class DataBean {

        private int id;
        private String match_name;
        private String match_pic;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getMatch_name() {
            return match_name;
        }

        public void setMatch_name(String match_name) {
            this.match_name = match_name;
        }

        public String getMatch_pic() {
            return match_pic;
        }

        public void setMatch_pic(String match_pic) {
            this.match_pic = match_pic;
        }
    }
}
