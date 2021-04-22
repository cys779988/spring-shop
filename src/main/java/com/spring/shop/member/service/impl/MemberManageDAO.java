package com.spring.shop.member.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.member.service.MemberManageVO;


@Repository
public class MemberManageDAO{
	@Autowired
	SqlSession sqlSession;

	public List<MemberManageVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberManageMapper.listPage", scri);
	}

	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberManageMapper.listCount", scri);
	}

	public MemberManageVO read(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberManageMapper.read", userId);
	}

	public void delete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("memberManageMapper.delete", userId);
	}

}
