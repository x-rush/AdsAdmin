package cn.edu.neusoft.liruoxing.bean;



public class ActivityDetailBean {


    private int status;
    private String message;
    private DataBean data;

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

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static class DataBean {


        private int id;
        private String activity_name;
        private String address;
        private String activity_cost;
        private int sign_number;
        private int hotline;
        private String intro;
        private String activity_pic;
        private String activity_time;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getActivity_name() {
            return activity_name;
        }

        public void setActivity_name(String activity_name) {
            this.activity_name = activity_name;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getActivity_cost() {
            return activity_cost;
        }

        public void setActivity_cost(String activity_cost) {
            this.activity_cost = activity_cost;
        }

        public int getSign_number() {
            return sign_number;
        }

        public void setSign_number(int sign_number) {
            this.sign_number = sign_number;
        }

        public int getHotline() {
            return hotline;
        }

        public void setHotline(int hotline) {
            this.hotline = hotline;
        }

        public String getIntro() {
            return intro;
        }

        public void setIntro(String intro) {
            this.intro = intro;
        }

        public String getActivity_pic() {
            return activity_pic;
        }

        public void setActivity_pic(String activity_pic) {
            this.activity_pic = activity_pic;
        }

        public String getActivity_time() {
            return activity_time;
        }

        public void setActivity_time(String activity_time) {
            this.activity_time = activity_time;
        }
    }
}
