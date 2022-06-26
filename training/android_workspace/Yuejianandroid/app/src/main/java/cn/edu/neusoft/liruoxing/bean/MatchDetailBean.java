package cn.edu.neusoft.liruoxing.bean;

public class MatchDetailBean {

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
            private String match_name;
            private String match_pic;
            private String address;
            private String match_price;
            private String match_time;

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
        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }
        public String getMatch_price() {
            return match_price;
        }

        public void setMatch_price(String match_price) {
            this.match_price = match_price;
        }
        public String getMatch_time() {
            return match_time;
        }

        public void setMatch_time(String match_time) {
            this.match_time = match_time;
        }
        }
    }


