package com.spring.shop.notice.service;

import java.util.Date;

public class NoticeVO {
	private int nno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int hit;
	private String nImg;
	private String nThumbImg;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getnImg() {
		return nImg;
	}
	public void setnImg(String nImg) {
		this.nImg = nImg;
	}
	public String getnThumbImg() {
		return nThumbImg;
	}
	public void setnThumbImg(String nThumbImg) {
		this.nThumbImg = nThumbImg;
	}
}
