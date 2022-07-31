package cn.edu.neusoft.liruoxing.bean;

import java.util.List;



public class CareMasterListBean {


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

        private int id;
        private String master_name;
        private String master_avatar;
        private int zans;
        private String intro;
        private String address;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getMaster_name() {
            return master_name;
        }

        public void setMaster_name(String master_name) {
            this.master_name = master_name;
        }

        public String getMaster_avatar() {
            return master_avatar;
        }

        public void setMaster_avatar(String master_avatar) {
            this.master_avatar = master_avatar;
        }

        public int getZans() {
            return zans;
        }

        public void setZans(int zans) {
            this.zans = zans;
        }

        public String getIntro() {
            return intro;
        }

        public void setIntro(String intro) {
            this.intro = intro;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }
    }
}
