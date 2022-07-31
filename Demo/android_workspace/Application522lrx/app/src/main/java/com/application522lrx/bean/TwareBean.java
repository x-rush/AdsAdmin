package com.application522lrx.bean;

/**
 * Created by Neusoft on 2016/12/21.
 */

//public class TwareBean extends AmicoolBean{
public class TwareBean{
    private int id;
    private String name;//文章标题
    private String thumb;//文章图片id，本例使用静态图片
    private String update_time;//文章时间
    private String description;
    private int ressrcid;
    private String ressrcname;
    private String clang;
    private int userid;
    private String pdfattach;//pdf地址

//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//
//        TwareBean twareBean = (TwareBean) o;
//
//        if (ressrcid != twareBean.ressrcid) return false;
//        if (description != null ? !description.equals(twareBean.description) : twareBean.description != null)
//            return false;
//        if (ressrcname != null ? !ressrcname.equals(twareBean.ressrcname) : twareBean.ressrcname != null)
//            return false;
//        if (clang != null ? !clang.equals(twareBean.clang) : twareBean.clang != null) return false;
//        if (swfattach != null ? !swfattach.equals(twareBean.swfattach) : twareBean.swfattach != null)
//            return false;
//        if (swfattachsize != null ? !swfattachsize.equals(twareBean.swfattachsize) : twareBean.swfattachsize != null)
//            return false;
//        if (pdfattach != null ? !pdfattach.equals(twareBean.pdfattach) : twareBean.pdfattach != null)
//            return false;
//        return pdfattachsize != null ? pdfattachsize.equals(twareBean.pdfattachsize) : twareBean.pdfattachsize == null;
//
//    }
//
//    @Override
//    public int hashCode() {
//        int result = description != null ? description.hashCode() : 0;
//        result = 31 * result + ressrcid;
//        result = 31 * result + (ressrcname != null ? ressrcname.hashCode() : 0);
//        result = 31 * result + (clang != null ? clang.hashCode() : 0);
//        result = 31 * result + (swfattach != null ? swfattach.hashCode() : 0);
//        result = 31 * result + (swfattachsize != null ? swfattachsize.hashCode() : 0);
//        result = 31 * result + (pdfattach != null ? pdfattach.hashCode() : 0);
//        result = 31 * result + (pdfattachsize != null ? pdfattachsize.hashCode() : 0);
//        return result;
//    }

//    private String swfattach;
//    private String swfattachsize;
//    private String pdfattach;
//    private String pdfattachsize;
//
//    public String getDescription() {
//        return description;
//    }
//
//    public void setDescription(String description) {
//        this.description = description;
//    }
//
//    public int getRessrcid() {
//        return ressrcid;
//    }
//
//    public void setRessrcid(int ressrcid) {
//        this.ressrcid = ressrcid;
//    }
//
//    public String getRessrcname() {
//        return ressrcname;
//    }
//
//    public void setRessrcname(String ressrcname) {
//        this.ressrcname = ressrcname;
//    }
//
//    public String getClang() {
//        return clang;
//    }
//
//    public void setClang(String clang) {
//        this.clang = clang;
//    }
//
//    public String getSwfattach() {
//        return swfattach;
//    }
//
//    public void setSwfattach(String swfattach) {
//        this.swfattach = swfattach;
//    }
//
//    public String getSwfattachsize() {
//        return swfattachsize;
//    }
//
//    public void setSwfattachsize(String swfattachsize) {
//        this.swfattachsize = swfattachsize;
//    }
//
//    public String getPdfattach() {
//        return pdfattach;
//    }
//
//    public void setPdfattach(String pdfattach) {
//        this.pdfattach = pdfattach;
//    }
//
//    public String getPdfattachsize() {
//        return pdfattachsize;
//    }
//
//    public void setPdfattachsize(String pdfattachsize) {
//        this.pdfattachsize = pdfattachsize;
//    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getThumb() {
        return thumb;
    }


    public void setThumb(String thumb) {
        this.thumb = thumb;
    }


    public String getUpdate_time() {
        return update_time;
    }


    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public int getUserid() {
        return userid;
    }


    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getRessrcid() {
        return ressrcid;
    }

    public void setRessrcid(int ressrcid) {
        this.ressrcid = ressrcid;
    }

    public String getRessrcname() {
        return ressrcname;
    }

    public void setRessrcname(String ressrcname) {
        this.ressrcname = ressrcname;
    }

    public String getClang() {
        return clang;
    }

    public void setClang(String clang) {
        this.clang = clang;
    }

    public String getPdfattach() {
        return pdfattach;
    }

    public void setPdfattach(String pdfattach) {
        this.pdfattach = pdfattach;
    }
}
