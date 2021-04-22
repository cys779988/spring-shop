package com.spring.shop.recipe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.recipe.service.ItemVO;
import com.spring.shop.recipe.service.RecipeReplyVO;
import com.spring.shop.recipe.service.RecipeService;
import com.spring.shop.recipe.service.RecipeVO;


@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeDAO dao;
	
	@Override
	public void recipeRegist(RecipeVO vo) {
		// TODO Auto-generated method stub
		dao.recipeRegist(vo);
	}
	@Override
	public List<?> selectItemList() {
		// TODO Auto-generated method stub
		return dao.selectItemList();
	}
	@Override
	public ItemVO checkItemInfo(String n) {
		// TODO Auto-generated method stub
		return dao.checkItemInfo(n);
	}
	@Override
	public List<RecipeVO> recipeList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.recipeList(scri);
	}
	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	@Override
	public RecipeVO recipeView(String ingNum) {
		// TODO Auto-generated method stub
		return dao.recipeView(ingNum);
	}
	@Override
	public void recipeModify(RecipeVO vo) {
		// TODO Auto-generated method stub
		dao.recipeModify(vo);
	}
	@Override
	public void recipeDelete(String recipeNum) {
		// TODO Auto-generated method stub
		dao.recipeDelete(recipeNum);
	}
	
	@Override
	public List<RecipeVO> sellRecipeList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.sellRecipeList(scri);
	}
	@Override
	public List<RecipeVO> sellRecipeCateList(String recipeCateCode) {
		// TODO Auto-generated method stub
		return dao.sellRecipeCateList(recipeCateCode);
	}
	@Override
	public RecipeVO sellRecipeView(String recipeNum) {
		// TODO Auto-generated method stub
		return dao.sellRecipeView(recipeNum);
	}
	@Override
	public void registRecipeReply(RecipeReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.registRecipeReply(replyVO);
	}
	@Override
	public List<RecipeReplyVO> recipeReplyList(String recipeNum) {
		// TODO Auto-generated method stub
		return dao.recipeReplyList(recipeNum);
	}
	@Override
	public void deleteRecipeReply(RecipeReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.deleteRecipeReply(replyVO);
	}
	@Override
	public String idCheck(int reqNum) {
		// TODO Auto-generated method stub
		return dao.idCheck(reqNum);
	}
	@Override
	public void modifyRecipeReply(RecipeReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.modifyRecipeReply(replyVO);
	}
	
}
