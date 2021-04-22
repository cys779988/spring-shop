package com.spring.shop.advertise.service;

import java.util.List;

import com.spring.shop.common.service.SearchCriteria;


public interface AdvertiseService {

	public List<AdvertiseVO> adList(SearchCriteria scri) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;

	public void adRegist(AdvertiseVO vo) throws Exception;

	public AdvertiseVO adRead(int adNum) throws Exception;

	public void update(AdvertiseVO vo) throws Exception;

	public void delete(int adNum) throws Exception;

}
