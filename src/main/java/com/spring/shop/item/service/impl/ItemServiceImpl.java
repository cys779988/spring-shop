package com.spring.shop.item.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.item.service.ItemReplyVO;
import com.spring.shop.item.service.ItemService;
import com.spring.shop.item.service.ItemVO;



@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDAO dao;
	
	@Override
	public void ingRegister(ItemVO vo) {
		// TODO Auto-generated method stub
		dao.ingRegister(vo);
	}
	@Override
	public List<ItemVO> ingList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.ingList(scri);
	}
	

	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	@Override
	public ItemVO ingView(String ingNum) {
		// TODO Auto-generated method stub
		return dao.ingView(ingNum);
	}
	@Override
	public void ingredientModify(ItemVO vo) {
		// TODO Auto-generated method stub
		dao.ingredientModify(vo);
	}
	@Override
	public void ingredientDelete(String ingNum) {
		// TODO Auto-generated method stub
		dao.ingredientDelete(ingNum);
	}
	
	@Override
	public List<ItemVO> sellIngList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.sellIngList(scri);
	}
	@Override
	public List<ItemVO> sellIngCateList(String ingCateCode) {
		// TODO Auto-generated method stub
		return dao.sellIngCateList(ingCateCode);
	}
	@Override
	public ItemVO sellIngView(String ingNum) {
		// TODO Auto-generated method stub
		return dao.sellIngView(ingNum);
	}
	@Override
	public void registIngReply(ItemReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.registIngReply(replyVO);
	}
	@Override
	public List<ItemReplyVO> ingReplyList(String ingNum) {
		// TODO Auto-generated method stub
		return dao.ingReplyList(ingNum);
	}
	@Override
	public void deleteIngReply(ItemReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.deleteIngReply(replyVO);
	}
	@Override
	public String idCheck(int reqNum) {
		// TODO Auto-generated method stub
		return dao.idCheck(reqNum);
	}
	@Override
	public void modifyIngReply(ItemReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.modifyIngReply(replyVO);
	}
}
