package com.spring.shop.member.service;

import java.util.List;

import com.spring.shop.common.service.SearchCriteria;


public interface MemberManageService {
	public List<MemberManageVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public MemberManageVO read(String userId) throws Exception;
	
	public void delete(String userId) throws Exception;
}
