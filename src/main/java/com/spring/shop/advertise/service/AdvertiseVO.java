package com.spring.shop.advertise.service;

import java.util.Date;

public class AdvertiseVO {
	private int adNum;
	private String adName;
	private String adDes;
	private String adImg;
	private Date regdate;
	private String adThumbImg;
	public int getAdNum() {
		return adNum;
	}
	public void setAdNum(int adNum) {
		this.adNum = adNum;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getAdDes() {
		return adDes;
	}
	public void setAdDes(String adDes) {
		this.adDes = adDes;
	}
	public String getAdImg() {
		return adImg;
	}
	public void setAdImg(String adImg) {
		this.adImg = adImg;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getAdThumbImg() {
		return adThumbImg;
	}
	public void setAdThumbImg(String adThumbImg) {
		this.adThumbImg = adThumbImg;
	}
}
