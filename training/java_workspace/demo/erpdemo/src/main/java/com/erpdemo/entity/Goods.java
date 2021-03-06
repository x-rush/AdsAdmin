package com.erpdemo.entity;

import java.util.Date;

public class Goods {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.code
     *
     * @mbggenerated
     */
    private String code;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.inventoryquantity
     *
     * @mbggenerated
     */
    private Integer inventoryquantity;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.lastpurchasingprice
     *
     * @mbggenerated
     */
    private Float lastpurchasingprice;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.minnum
     *
     * @mbggenerated
     */
    private Integer minnum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.model
     *
     * @mbggenerated
     */
    private String model;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.producer
     *
     * @mbggenerated
     */
    private String producer;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.purchasingprice
     *
     * @mbggenerated
     */
    private Float purchasingprice;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.remarks
     *
     * @mbggenerated
     */
    private String remarks;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.sellingprice
     *
     * @mbggenerated
     */
    private Float sellingprice;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.state
     *
     * @mbggenerated
     */
    private Integer state;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.unit
     *
     * @mbggenerated
     */
    private String unit;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.addtime
     *
     * @mbggenerated
     */
    private Date addtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.userid
     *
     * @mbggenerated
     */
    private Integer userid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.delflag
     *
     * @mbggenerated
     */
    private Integer delflag;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_goods.typeid
     *
     * @mbggenerated
     */
    private Integer typeid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.id
     *
     * @return the value of t_goods.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.id
     *
     * @param id the value for t_goods.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.code
     *
     * @return the value of t_goods.code
     *
     * @mbggenerated
     */
    public String getCode() {
        return code;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.code
     *
     * @param code the value for t_goods.code
     *
     * @mbggenerated
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.inventoryquantity
     *
     * @return the value of t_goods.inventoryquantity
     *
     * @mbggenerated
     */
    public Integer getInventoryquantity() {
        return inventoryquantity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.inventoryquantity
     *
     * @param inventoryquantity the value for t_goods.inventoryquantity
     *
     * @mbggenerated
     */
    public void setInventoryquantity(Integer inventoryquantity) {
        this.inventoryquantity = inventoryquantity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.lastpurchasingprice
     *
     * @return the value of t_goods.lastpurchasingprice
     *
     * @mbggenerated
     */
    public Float getLastpurchasingprice() {
        return lastpurchasingprice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.lastpurchasingprice
     *
     * @param lastpurchasingprice the value for t_goods.lastpurchasingprice
     *
     * @mbggenerated
     */
    public void setLastpurchasingprice(Float lastpurchasingprice) {
        this.lastpurchasingprice = lastpurchasingprice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.minnum
     *
     * @return the value of t_goods.minnum
     *
     * @mbggenerated
     */
    public Integer getMinnum() {
        return minnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.minnum
     *
     * @param minnum the value for t_goods.minnum
     *
     * @mbggenerated
     */
    public void setMinnum(Integer minnum) {
        this.minnum = minnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.model
     *
     * @return the value of t_goods.model
     *
     * @mbggenerated
     */
    public String getModel() {
        return model;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.model
     *
     * @param model the value for t_goods.model
     *
     * @mbggenerated
     */
    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.name
     *
     * @return the value of t_goods.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.name
     *
     * @param name the value for t_goods.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.producer
     *
     * @return the value of t_goods.producer
     *
     * @mbggenerated
     */
    public String getProducer() {
        return producer;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.producer
     *
     * @param producer the value for t_goods.producer
     *
     * @mbggenerated
     */
    public void setProducer(String producer) {
        this.producer = producer == null ? null : producer.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.purchasingprice
     *
     * @return the value of t_goods.purchasingprice
     *
     * @mbggenerated
     */
    public Float getPurchasingprice() {
        return purchasingprice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.purchasingprice
     *
     * @param purchasingprice the value for t_goods.purchasingprice
     *
     * @mbggenerated
     */
    public void setPurchasingprice(Float purchasingprice) {
        this.purchasingprice = purchasingprice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.remarks
     *
     * @return the value of t_goods.remarks
     *
     * @mbggenerated
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.remarks
     *
     * @param remarks the value for t_goods.remarks
     *
     * @mbggenerated
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.sellingprice
     *
     * @return the value of t_goods.sellingprice
     *
     * @mbggenerated
     */
    public Float getSellingprice() {
        return sellingprice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.sellingprice
     *
     * @param sellingprice the value for t_goods.sellingprice
     *
     * @mbggenerated
     */
    public void setSellingprice(Float sellingprice) {
        this.sellingprice = sellingprice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.state
     *
     * @return the value of t_goods.state
     *
     * @mbggenerated
     */
    public Integer getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.state
     *
     * @param state the value for t_goods.state
     *
     * @mbggenerated
     */
    public void setState(Integer state) {
        this.state = state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.unit
     *
     * @return the value of t_goods.unit
     *
     * @mbggenerated
     */
    public String getUnit() {
        return unit;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.unit
     *
     * @param unit the value for t_goods.unit
     *
     * @mbggenerated
     */
    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.addtime
     *
     * @return the value of t_goods.addtime
     *
     * @mbggenerated
     */
    public Date getAddtime() {
        return addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.addtime
     *
     * @param addtime the value for t_goods.addtime
     *
     * @mbggenerated
     */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.userid
     *
     * @return the value of t_goods.userid
     *
     * @mbggenerated
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.userid
     *
     * @param userid the value for t_goods.userid
     *
     * @mbggenerated
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.delflag
     *
     * @return the value of t_goods.delflag
     *
     * @mbggenerated
     */
    public Integer getDelflag() {
        return delflag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.delflag
     *
     * @param delflag the value for t_goods.delflag
     *
     * @mbggenerated
     */
    public void setDelflag(Integer delflag) {
        this.delflag = delflag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_goods.typeid
     *
     * @return the value of t_goods.typeid
     *
     * @mbggenerated
     */
    public Integer getTypeid() {
        return typeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_goods.typeid
     *
     * @param typeid the value for t_goods.typeid
     *
     * @mbggenerated
     */
    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

	@Override
	public String toString() {
		return "Goods [id=" + id + ", code=" + code + ", inventoryquantity=" + inventoryquantity
				+ ", lastpurchasingprice=" + lastpurchasingprice + ", minnum=" + minnum + ", model=" + model + ", name="
				+ name + ", producer=" + producer + ", purchasingprice=" + purchasingprice + ", remarks=" + remarks
				+ ", sellingprice=" + sellingprice + ", state=" + state + ", unit=" + unit + ", addtime=" + addtime
				+ ", userid=" + userid + ", delflag=" + delflag + ", typeid=" + typeid + "]";
	}
	
	
}