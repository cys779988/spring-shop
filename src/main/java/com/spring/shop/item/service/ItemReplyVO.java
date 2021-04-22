package com.spring.shop.item.service;

import java.util.Date;

public class ItemReplyVO {
	private String ingNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
	
	public String getIngNum() {
		return ingNum;
	}
	public void setIngNum(String ingNum) {
		this.ingNum = ingNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getRepCon() {
		return repCon;
	}
	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}
	
}
