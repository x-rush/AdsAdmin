package com.erpdemo.entity;

import java.util.Date;

public class SysSaleList {

    private Integer id;

    private Float amountpaid;

    private Float amountpayable;

    private String remarks;

    private Date saledate;

    private String salenum;

    private Integer state;

    private Integer customerid;

    private Integer userid;

    private Date addtime;

    private Integer delflag;
    
    private SysSaleListGoods sysSaleListGoods;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Float getAmountpaid() {
        return amountpaid;
    }

    public void setAmountpaid(Float amountpaid) {
        this.amountpaid = amountpaid;
    }

    public Float getAmountpayable() {
        return amountpayable;
    }

    public void setAmountpayable(Float amountpayable) {
        this.amountpayable = amountpayable;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Date getSaledate() {
        return saledate;
    }

    public void setSaledate(Date saledate) {
        this.saledate = saledate;
    }

    public String getSalenum() {
        return salenum;
    }

    public void setSalenum(String salenum) {
        this.salenum = salenum == null ? null : salenum.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Integer getDelflag() {
        return delflag;
    }

    public void setDelflag(Integer delflag) {
        this.delflag = delflag;
    }

	public SysSaleListGoods getSysSaleListGoods() {
		return sysSaleListGoods;
	}

	public void setSysSaleListGoods(SysSaleListGoods sysSaleListGoods) {
		this.sysSaleListGoods = sysSaleListGoods;
	}

	public SysSaleList() {
		super();
	}

	public SysSaleList(Integer id, Float amountpaid, Float amountpayable, String remarks, Date saledate, String salenum,
			Integer state, Integer customerid, Integer userid, Date addtime, Integer delflag,
			SysSaleListGoods sysSaleListGoods) {
		super();
		this.id = id;
		this.amountpaid = amountpaid;
		this.amountpayable = amountpayable;
		this.remarks = remarks;
		this.saledate = saledate;
		this.salenum = salenum;
		this.state = state;
		this.customerid = customerid;
		this.userid = userid;
		this.addtime = addtime;
		this.delflag = delflag;
		this.sysSaleListGoods = sysSaleListGoods;
	}
	
	
}