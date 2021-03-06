package com.erpdemo.entity;

import java.util.Date;

public class GoodsModelEntity {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods_model.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods_model.tid
     *
     * @mbggenerated
     */
    private Integer tid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods_model.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods_model.price
     *
     * @mbggenerated
     */
    private Double price;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods_model.userid
     *
     * @mbggenerated
     */
    private Integer userid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods_model.delflag
     *
     * @mbggenerated
     */
    private Integer delflag;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods_model.addtime
     *
     * @mbggenerated
     */
    private Date addtime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods_model.id
     *
     * @return the value of t_goods_model.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods_model.id
     *
     * @param id the value for t_goods_model.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods_model.tid
     *
     * @return the value of t_goods_model.tid
     *
     * @mbggenerated
     */
    public Integer getTid() {
        return tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods_model.tid
     *
     * @param tid the value for t_goods_model.tid
     *
     * @mbggenerated
     */
    public void setTid(Integer tid) {
        this.tid = tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods_model.name
     *
     * @return the value of t_goods_model.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods_model.name
     *
     * @param name the value for t_goods_model.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods_model.price
     *
     * @return the value of t_goods_model.price
     *
     * @mbggenerated
     */
    public Double getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods_model.price
     *
     * @param price the value for t_goods_model.price
     *
     * @mbggenerated
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods_model.userid
     *
     * @return the value of t_goods_model.userid
     *
     * @mbggenerated
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods_model.userid
     *
     * @param userid the value for t_goods_model.userid
     *
     * @mbggenerated
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods_model.delflag
     *
     * @return the value of t_goods_model.delflag
     *
     * @mbggenerated
     */
    public Integer getDelflag() {
        return delflag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods_model.delflag
     *
     * @param delflag the value for t_goods_model.delflag
     *
     * @mbggenerated
     */
    public void setDelflag(Integer delflag) {
        this.delflag = delflag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods_model.addtime
     *
     * @return the value of t_goods_model.addtime
     *
     * @mbggenerated
     */
    public Date getAddtime() {
        return addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods_model.addtime
     *
     * @param addtime the value for t_goods_model.addtime
     *
     * @mbggenerated
     */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}