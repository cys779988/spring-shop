package com.spring.shop.item.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.item.service.ItemReplyVO;
import com.spring.shop.item.service.ItemVO;


@Repository
public class ItemDAO{
	@Autowired
	private SqlSession sqlSession;

	
	public void ingRegister(ItemVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("itemMapper.ingRegister", vo);
	}

	
	public List<ItemVO> ingList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("itemMapper.ingList",scri);
	}

	
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("itemMapper.listCount",scri);
	}

	
	public ItemVO ingView(String ingNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("itemMapper.ingredientView", ingNum);
	}

	
	public void ingredientModify(ItemVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("itemMapper.ingredientModify", vo);
	}

	
	public void ingredientDelete(String ingNum) {
		// TODO Auto-generated method stub
		sqlSession.delete("itemMapper.ingredientDelete", ingNum);
	}

	
	public List<ItemVO> sellIngList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("itemMapper.sellIngList",scri);
	}
	
	public List<ItemVO> sellIngCateList(String ingCateCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("itemMapper.sellIngCateList", ingCateCode);
	}
	
	public ItemVO sellIngView(String ingNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("itemMapper.sellIngView", ingNum);
	}
	
	public void registIngReply(ItemReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("itemMapper.registIngReply", replyVO);
	}
	
	public List<ItemReplyVO> ingReplyList(String ingNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("itemMapper.ingReplyList", ingNum);
	}
	
	public void deleteIngReply(ItemReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("itemMapper.deleteIngReply", replyVO);
	}
	
	public String idCheck(int reqNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("itemMapper.replyUserIdCheck", reqNum);
	}
	
	public void modifyIngReply(ItemReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.update("itemMapper.modifyIngReply", replyVO);
	}
}
