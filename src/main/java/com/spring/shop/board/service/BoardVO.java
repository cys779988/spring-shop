package com.spring.shop.board.service;

import java.util.Date;

public class BoardVO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int hit;
	private String bImg;
	private String bThumbImg;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getbImg() {
		return bImg;
	}
	public void setbImg(String bImg) {
		this.bImg = bImg;
	}
	public String getbThumbImg() {
		return bThumbImg;
	}
	public void setbThumbImg(String bThumbImg) {
		this.bThumbImg = bThumbImg;
	}
	
}