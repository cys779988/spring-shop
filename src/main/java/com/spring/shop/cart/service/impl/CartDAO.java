package com.spring.shop.cart.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.cart.service.CartVO;
import com.spring.shop.cart.service.OrderDetailVO;
import com.spring.shop.cart.service.OrderVO;
import com.spring.shop.item.service.ItemVO;


@Repository
public class CartDAO{

	@Autowired
	private SqlSession sqlSession;

	
	public void addCart(CartVO cartVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("cartMapper.addCart", cartVO);
	}

	
	public List<CartVO> cartList(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.cartList", userId);
	}

	
	public void deleteCart(CartVO cartVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("cartMapper.deleteCart", cartVO);
	}
	
	public void orderInfo(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("cartMapper.orderInfo", orderVO);
	}
	
	public void orderInfo_Details(OrderDetailVO orderDetailVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("cartMapper.orderInfo_Details", orderDetailVO);
	}
	
	
	public void cartAllDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("cartMapper.cartAllDelete", userId);
	}

	
	public List<OrderVO> orderList(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.orderList", orderVO);
	}
	
	
	public List<OrderVO> orderView(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.orderView", orderVO);
	}
	
	
	public List<OrderVO> adminOrderList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.adminOrderList");
	}
	
	public List<OrderVO> adminOrderView(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.adminOrderView", orderVO);
	}
	
	public void delivery(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("cartMapper.delivery", orderVO);
	}
	
	public void changeStock(ItemVO itemVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("cartMapper.changeStock", itemVO);
	}
}
