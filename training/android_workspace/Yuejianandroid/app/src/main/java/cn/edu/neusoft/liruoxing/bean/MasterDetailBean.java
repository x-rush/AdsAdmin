package cn.edu.neusoft.liruoxing.bean;

import java.util.List;


public class MasterDetailBean {


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
        private String master_name;
        private String master_avatar;
        private int zans;
        private String intro;
        private String address;
        private List<CourseBean> course;
        private List<CommentsBean> comments;

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

        public List<CourseBean> getCourse() {
            return course;
        }

        public void setCourse(List<CourseBean> course) {
            this.course = course;
        }

        public List<CommentsBean> getComments() {
            return comments;
        }

        public void setComments(List<CommentsBean> comments) {
            this.comments = comments;
        }

        public static class CourseBean {
            /**
             * id : 1
             * master_course_name : sad
             * master_course_intro : sd
             * video_address : asd
             * master_id : 1
             */

            private int id;
            private String master_course_name;
            private String master_course_intro;
            private String video_address;
            private int master_id;

            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public String getMaster_course_name() {
                return master_course_name;
            }

            public void setMaster_course_name(String master_course_name) {
                this.master_course_name = master_course_name;
            }

            public String getMaster_course_intro() {
                return master_course_intro;
            }

            public void setMaster_course_intro(String master_course_intro) {
                this.master_course_intro = master_course_intro;
            }

            public String getVideo_address() {
                return video_address;
            }

            public void setVideo_address(String video_address) {
                this.video_address = video_address;
            }

            public int getMaster_id() {
                return master_id;
            }

            public void setMaster_id(int master_id) {
                this.master_id = master_id;
            }
        }

        public static class CommentsBean {
            /**
             * id : 1
             * question_content : null
             * question_time : null
             * comment_time : 2018-07-02 15:44:57
             * comment_content : 111
             * master_id : 1
             * user_id : 1
             */

            private int id;
            private Object question_content;
            private Object question_time;
            private String comment_time;
            private String comment_content;
            private int master_id;
            private int user_id;

            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public Object getQuestion_content() {
                return question_content;
            }

            public void setQuestion_content(Object question_content) {
                this.question_content = question_content;
            }

            public Object getQuestion_time() {
                return question_time;
            }

            public void setQuestion_time(Object question_time) {
                this.question_time = question_time;
            }

            public String getComment_time() {
                return comment_time;
            }

            public void setComment_time(String comment_time) {
                this.comment_time = comment_time;
            }

            public String getComment_content() {
                return comment_content;
            }

            public void setComment_content(String comment_content) {
                this.comment_content = comment_content;
            }

            public int getMaster_id() {
                return master_id;
            }

            public void setMaster_id(int master_id) {
                this.master_id = master_id;
            }

            public int getUser_id() {
                return user_id;
            }

            public void setUser_id(int user_id) {
                this.user_id = user_id;
            }
        }
    }
}
