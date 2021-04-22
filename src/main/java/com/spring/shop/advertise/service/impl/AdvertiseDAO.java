package com.spring.shop.advertise.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.advertise.service.AdvertiseVO;
import com.spring.shop.common.service.SearchCriteria;


@Repository
public class AdvertiseDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<AdvertiseVO> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("advertiseMapper.listPage",scri);
	}
	
	
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("advertiseMapper.listCount",scri);
	}
	
	
	public void regist(AdvertiseVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("advertiseMapper.insert",vo);
	}
	
	
	public AdvertiseVO read(int adNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("advertiseMapper.read",adNum);
	}
	
	
	public void update(AdvertiseVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("advertiseMapper.update",vo);
	}
	
	
	public void delete(int adNum) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("advertiseMapper.delete",adNum);
	}
	
}
