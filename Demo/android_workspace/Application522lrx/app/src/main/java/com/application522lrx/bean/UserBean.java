package com.application522lrx.bean;

/**
 * Created by Neusoft on 2016/12/21.
 */

public class UserBean {
    private int id;
    private String sessionId;
    private String username;
    private String realname;
    private String rolename;
    private String sex;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSessionid() {
        return sessionId;
    }

    public void setSessionid(String sessionid) {
        this.sessionId = sessionid;
    }
}
