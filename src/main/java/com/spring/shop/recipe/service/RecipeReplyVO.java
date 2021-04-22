package com.spring.shop.recipe.service;

import java.util.Date;

public class RecipeReplyVO {
	private String recipeNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;

	public String getRecipeNum() {
		return recipeNum;
	}

	public void setRecipeNum(String recipeNum) {
		this.recipeNum = recipeNum;
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
