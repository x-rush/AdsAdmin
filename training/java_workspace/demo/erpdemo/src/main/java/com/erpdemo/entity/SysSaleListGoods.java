package com.erpdemo.entity;

import java.util.Date;

public class SysSaleListGoods {

    private Integer id;

    private String code;

    private Integer goodsid;

    private String model;

    private String name;

    private Integer num;

    private Float price;

    private Float total;

    private String unit;

    private Integer salelistid;

    private Integer typeid;

    private Date addtime;

    private Integer userid;

    private Integer delflag;
    
    private SysSaleList sysSaleList; 
    
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public Integer getSalelistid() {
        return salelistid;
    }

    public void setSalelistid(Integer salelistid) {
        this.salelistid = salelistid;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getDelflag() {
        return delflag;
    }

    public void setDelflag(Integer delflag) {
        this.delflag = delflag;
    }

	public SysSaleList getSysSaleList() {
		return sysSaleList;
	}

	public void setSysSaleList(SysSaleList sysSaleList) {
		this.sysSaleList = sysSaleList;
	}

	public SysSaleListGoods() {
		super();
	}

	public SysSaleListGoods(Integer id, String code, Integer goodsid, String model, String name, Integer num,
			Float price, Float total, String unit, Integer salelistid, Integer typeid, Date addtime, Integer userid,
			Integer delflag, SysSaleList sysSaleList) {
		super();
		this.id = id;
		this.code = code;
		this.goodsid = goodsid;
		this.model = model;
		this.name = name;
		this.num = num;
		this.price = price;
		this.total = total;
		this.unit = unit;
		this.salelistid = salelistid;
		this.typeid = typeid;
		this.addtime = addtime;
		this.userid = userid;
		this.delflag = delflag;
		this.sysSaleList = sysSaleList;
	}

	
	
}