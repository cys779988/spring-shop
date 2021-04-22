package com.spring.shop.item.service;

import java.util.List;

import com.spring.shop.common.service.SearchCriteria;

public interface ItemService {

	public void ingRegister(ItemVO vo);

	public List<ItemVO> ingList(SearchCriteria scri);

	public int listCount(SearchCriteria scri);

	public ItemVO ingView(String ingNum);

	public void ingredientModify(ItemVO vo);

	public void ingredientDelete(String ingNum);

	public List<ItemVO> sellIngList(SearchCriteria scri);

	public List<ItemVO> sellIngCateList(String ingCateCode);

	public ItemVO sellIngView(String ingNum);

	public void registIngReply(ItemReplyVO replyVO);

	public List<ItemReplyVO> ingReplyList(String ingNum);

	public void deleteIngReply(ItemReplyVO replyVO);

	public String idCheck(int reqNum);

	public void modifyIngReply(ItemReplyVO replyVO);
}