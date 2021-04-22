package com.spring.shop.cart.service;

import java.util.Date;

public class CartVO {
	private int cartNum;
	private String userId;
	private String ingNum;
	private String recipeNum;
	private String itemNum;
	private int cartStock;
	private Date regDate;
	private String ingName;
	private String ingPrice;
	private String ingThumbImg;
	private String recipeName;
	private String recipePrice;
	private String recipeThumbImg;
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getIngNum() {
		return ingNum;
	}
	public void setIngNum(String ingNum) {
		this.ingNum = ingNum;
	}
	public String getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(String recipeNum) {
		this.recipeNum = recipeNum;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getIngName() {
		return ingName;
	}
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	public String getIngPrice() {
		return ingPrice;
	}
	public void setIngPrice(String ingPrice) {
		this.ingPrice = ingPrice;
	}
	public String getIngThumbImg() {
		return ingThumbImg;
	}
	public void setIngThumbImg(String ingThumbImg) {
		this.ingThumbImg = ingThumbImg;
	}
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	public String getRecipePrice() {
		return recipePrice;
	}
	public void setRecipePrice(String recipePrice) {
		this.recipePrice = recipePrice;
	}
	public String getRecipeThumbImg() {
		return recipeThumbImg;
	}
	public void setRecipeThumbImg(String recipeThumbImg) {
		this.recipeThumbImg = recipeThumbImg;
	}
}