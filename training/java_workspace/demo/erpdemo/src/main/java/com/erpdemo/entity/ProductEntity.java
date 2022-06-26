package com.erpdemo.entity;

import java.util.Date;

public class ProductEntity {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_product.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_product.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_product.price
     *
     * @mbggenerated
     */
    private Double price;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_product.userid
     *
     * @mbggenerated
     */
    private Integer userid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_product.delflag
     *
     * @mbggenerated
     */
    private Integer delflag;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_product.addtime
     *
     * @mbggenerated
     */
    private Date addtime;
    
    private int ptypeid;
    
    
    private ProductTypeEntity productType;
    
    
    
    public ProductTypeEntity getProductType() {
		return productType;
	}

	public void setProductType(ProductTypeEntity productType) {
		this.productType = productType;
	}

	public int getPtypeid() {
		return ptypeid;
	}

	public void setPtypeid(int ptypeid) {
		this.ptypeid = ptypeid;
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_product.id
     *
     * @return the value of tb_product.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_product.id
     *
     * @param id the value for tb_product.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_product.name
     *
     * @return the value of tb_product.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_product.name
     *
     * @param name the value for tb_product.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_product.price
     *
     * @return the value of tb_product.price
     *
     * @mbggenerated
     */
    public Double getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_product.price
     *
     * @param price the value for tb_product.price
     *
     * @mbggenerated
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_product.userid
     *
     * @return the value of tb_product.userid
     *
     * @mbggenerated
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_product.userid
     *
     * @param userid the value for tb_product.userid
     *
     * @mbggenerated
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_product.delflag
     *
     * @return the value of tb_product.delflag
     *
     * @mbggenerated
     */
    public Integer getDelflag() {
        return delflag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_product.delflag
     *
     * @param delflag the value for tb_product.delflag
     *
     * @mbggenerated
     */
    public void setDelflag(Integer delflag) {
        this.delflag = delflag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_product.addtime
     *
     * @return the value of tb_product.addtime
     *
     * @mbggenerated
     */
    public Date getAddtime() {
        return addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_product.addtime
     *
     * @param addtime the value for tb_product.addtime
     *
     * @mbggenerated
     */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}