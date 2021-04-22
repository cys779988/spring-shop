package com.spring.shop.recipe.service;

import java.util.List;

import com.spring.shop.common.service.SearchCriteria;


public interface RecipeService {
	public void recipeRegist(RecipeVO vo);
	public List<?> selectItemList();
	public ItemVO checkItemInfo(String n);
	public List<RecipeVO> recipeList(SearchCriteria scri);
	public int listCount(SearchCriteria scri);
	public RecipeVO recipeView(String recipeNum);
	public void recipeModify(RecipeVO vo);
	public void recipeDelete(String recipeNum);
	public List<RecipeVO> sellRecipeList(SearchCriteria scri);
	public List<RecipeVO> sellRecipeCateList(String recipeCateCode);
	public RecipeVO sellRecipeView(String recipeNum);
	public void registRecipeReply(RecipeReplyVO replyVO);
	public List<RecipeReplyVO> recipeReplyList(String recipeNum);
	public void deleteRecipeReply(RecipeReplyVO replyVO);
	public String idCheck(int reqNum);
	public void modifyRecipeReply(RecipeReplyVO replyVO);
}