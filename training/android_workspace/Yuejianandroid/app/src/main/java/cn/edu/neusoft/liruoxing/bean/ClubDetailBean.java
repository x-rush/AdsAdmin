package cn.edu.neusoft.liruoxing.bean;

import java.util.List;



public class ClubDetailBean {


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
        private String club_name;
        private String club_intro;
        private String address;
        private String phone;
        private int admin_id;
        private String club_pic;
        private String open_time;
        private List<TrainerBean> trainer;
        private List<CourseBean> course;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getClub_name() {
            return club_name;
        }

        public void setClub_name(String club_name) {
            this.club_name = club_name;
        }

        public String getClub_intro() {
            return club_intro;
        }

        public void setClub_intro(String club_intro) {
            this.club_intro = club_intro;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public int getAdmin_id() {
            return admin_id;
        }

        public void setAdmin_id(int admin_id) {
            this.admin_id = admin_id;
        }

        public String getClub_pic() {
            return club_pic;
        }

        public void setClub_pic(String club_pic) {
            this.club_pic = club_pic;
        }

        public String getOpen_time() {
            return open_time;
        }

        public void setOpen_time(String open_time) {
            this.open_time = open_time;
        }

        public List<TrainerBean> getTrainer() {
            return trainer;
        }

        public void setTrainer(List<TrainerBean> trainer) {
            this.trainer = trainer;
        }

        public List<CourseBean> getCourse() {
            return course;
        }

        public void setCourse(List<CourseBean> course) {
            this.course = course;
        }

        public static class TrainerBean {
            /**
             * id : 1
             * name : jack
             * intro : sad
             * avatar : ada
             * club_id : 1
             */

            private int id;
            private String name;
            private String intro;
            private String avatar;
            private int club_id;

            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public String getName() {
                return name;
            }

            public void setName(String name) {
                this.name = name;
            }

            public String getIntro() {
                return intro;
            }

            public void setIntro(String intro) {
                this.intro = intro;
            }

            public String getAvatar() {
                return avatar;
            }

            public void setAvatar(String avatar) {
                this.avatar = avatar;
            }

            public int getClub_id() {
                return club_id;
            }

            public void setClub_id(int club_id) {
                this.club_id = club_id;
            }
        }

        public static class CourseBean {
            /**
             * id : 1
             * name : jack
             * intro : sad
             * avatar : ada
             * club_id : 1
             */

            private int id;
            private String name;
            private String intro;
            private String avatar;
            private int club_id;

            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public String getName() {
                return name;
            }

            public void setName(String name) {
                this.name = name;
            }

            public String getIntro() {
                return intro;
            }

            public void setIntro(String intro) {
                this.intro = intro;
            }

            public String getAvatar() {
                return avatar;
            }

            public void setAvatar(String avatar) {
                this.avatar = avatar;
            }

            public int getClub_id() {
                return club_id;
            }

            public void setClub_id(int club_id) {
                this.club_id = club_id;
            }
        }
    }
}
