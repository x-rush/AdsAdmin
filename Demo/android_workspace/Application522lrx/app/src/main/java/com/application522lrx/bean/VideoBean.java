package com.application522lrx.bean;

import java.io.Serializable;

public class VideoBean extends AmicoolBean implements Serializable{

	private String description;
	private String videopath;

	private String srcsc;
	private String srcscsize;
	private String donesc;
	private String donescsize;

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		VideoBean videoBean = (VideoBean) o;

		if (description != null ? !description.equals(videoBean.description) : videoBean.description != null)
			return false;
		if (videopath != null ? !videopath.equals(videoBean.videopath) : videoBean.videopath != null)
			return false;
		if (srcsc != null ? !srcsc.equals(videoBean.srcsc) : videoBean.srcsc != null) return false;
		if (srcscsize != null ? !srcscsize.equals(videoBean.srcscsize) : videoBean.srcscsize != null)
			return false;
		if (donesc != null ? !donesc.equals(videoBean.donesc) : videoBean.donesc != null)
			return false;
		return donescsize != null ? donescsize.equals(videoBean.donescsize) : videoBean.donescsize == null;

	}

	@Override
	public int hashCode() {
		int result = description != null ? description.hashCode() : 0;
		result = 31 * result + (videopath != null ? videopath.hashCode() : 0);
		result = 31 * result + (srcsc != null ? srcsc.hashCode() : 0);
		result = 31 * result + (srcscsize != null ? srcscsize.hashCode() : 0);
		result = 31 * result + (donesc != null ? donesc.hashCode() : 0);
		result = 31 * result + (donescsize != null ? donescsize.hashCode() : 0);
		return result;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getVideopath() {
		return videopath;
	}

	public void setVideopath(String videopath) {
		this.videopath = videopath;
	}

	public String getSrcsc() {
		return srcsc;
	}

	public void setSrcsc(String srcsc) {
		this.srcsc = srcsc;
	}

	public String getSrcscsize() {
		return srcscsize;
	}

	public void setSrcscsize(String srcscsize) {
		this.srcscsize = srcscsize;
	}

	public String getDonesc() {
		return donesc;
	}

	public void setDonesc(String donesc) {
		this.donesc = donesc;
	}

	public String getDonescsize() {
		return donescsize;
	}

	public void setDonescsize(String donescsize) {
		this.donescsize = donescsize;
	}
}
