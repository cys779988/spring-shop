package com.spring.shop.advertise.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.advertise.service.AdvertiseService;
import com.spring.shop.advertise.service.AdvertiseVO;
import com.spring.shop.common.service.SearchCriteria;


@Service
public class AdvertiseServiceImpl implements AdvertiseService {
	@Autowired
	AdvertiseDAO dao;
	
	@Override
	public List<AdvertiseVO> adList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	
	@Override
	public void adRegist(AdvertiseVO vo) throws Exception{
		// TODO Auto-generated method stub
		dao.regist(vo);
	}
	
	@Override
	public AdvertiseVO adRead(int adNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(adNum);
	}
	
	@Override
	public void update(AdvertiseVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	
	@Override
	public void delete(int adNum) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(adNum);
	}
	
}
