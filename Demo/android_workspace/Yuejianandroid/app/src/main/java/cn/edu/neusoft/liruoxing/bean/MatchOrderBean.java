package cn.edu.neusoft.liruoxing.bean;

import java.util.List;



public class MatchOrderBean {

    private int status;
    private String message;
    private List<DataBean> data;

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

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {

        private String match_name;
        private String match_pic;
        private String match_price;
        private String address;
        private String match_time;
        private String phone;
        private String username;
        private int num;
        private int match_id;
        private int user_id;
        private int id;

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

        public String getMatch_price() {
            return match_price;
        }

        public void setMatch_price(String match_price) {
            this.match_price = match_price;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getMatch_time() {
            return match_time;
        }

        public void setMatch_time(String match_time) {
            this.match_time = match_time;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public int getNum() {
            return num;
        }

        public void setNum(int num) {
            this.num = num;
        }

        public int getMatch_id() {
            return match_id;
        }

        public void setMatch_id(int match_id) {
            this.match_id = match_id;
        }

        public int getUser_id() {
            return user_id;
        }

        public void setUser_id(int user_id) {
            this.user_id = user_id;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }
    }
}
