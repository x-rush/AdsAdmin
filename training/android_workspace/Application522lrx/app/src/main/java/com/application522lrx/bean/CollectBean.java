package com.application522lrx.bean;

/**
 * Created by Administrator on 2017/6/8.
 */

public class CollectBean <T>{

    private int id;
    private int resid;
    private int userid;
    private String cctime;
    private String listorder;
    private String vstat;
    private T bean;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResid() {
        return resid;
    }

    public void setResid(int resid) {
        this.resid = resid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getCctime() {
        return cctime;
    }

    public void setCctime(String cctime) {
        this.cctime = cctime;
    }

    public String getListorder() {
        return listorder;
    }

    public void setListorder(String listorder) {
        this.listorder = listorder;
    }

    public String getVstat() {
        return vstat;
    }

    public void setVstat(String vstat) {
        this.vstat = vstat;
    }

    public T getBean() {
        return bean;
    }

    public void setBean(T bean) {
        this.bean = bean;
    }
}
