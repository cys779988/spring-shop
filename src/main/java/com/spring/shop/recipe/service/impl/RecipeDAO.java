package com.spring.shop.recipe.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.recipe.service.ItemVO;
import com.spring.shop.recipe.service.RecipeReplyVO;
import com.spring.shop.recipe.service.RecipeVO;


@Repository
public class RecipeDAO {
	@Autowired
	private SqlSession sqlSession;

	
	public void recipeRegist(RecipeVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("recipeMapper.recipeRegist", vo);
	}

	public List<?> selectItemList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recipeMapper.selectItemList");
	}

	public ItemVO checkItemInfo(String n) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.checkItemInfo",n);
	}
	
	public List<RecipeVO> recipeList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recipeMapper.recipeList",scri);
	}

	
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.listCount",scri);
	}

	
	public RecipeVO recipeView(String recipeNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.recipeView", recipeNum);
	}

	
	public void recipeModify(RecipeVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("recipeMapper.recipeModify", vo);
	}

	
	public void recipeDelete(String recipeNum) {
		// TODO Auto-generated method stub
		sqlSession.delete("recipeMapper.recipeDelete", recipeNum);
	}

	
	public List<RecipeVO> sellRecipeList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recipeMapper.sellRecipeList",scri);
	}
	
	public List<RecipeVO> sellRecipeCateList(String recipeCateCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recipeMapper.sellRecipeCateList", recipeCateCode);
	}
	
	public RecipeVO sellRecipeView(String recipeNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.sellRecipeView", recipeNum);
	}
	
	public void registRecipeReply(RecipeReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("recipeMapper.registRecipeReply", replyVO);
	}
	
	public List<RecipeReplyVO> recipeReplyList(String recipeNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recipeMapper.recipeReplyList", recipeNum);
	}
	
	public void deleteRecipeReply(RecipeReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("recipeMapper.deleteRecipeReply", replyVO);
	}
	
	public String idCheck(int reqNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipeMapper.replyUserIdCheck", reqNum);
	}
	
	public void modifyRecipeReply(RecipeReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.update("recipeMapper.modifyRecipeReply", replyVO);
	}

}
