package com.spring.shop.cart.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.cart.service.CartService;
import com.spring.shop.cart.service.CartVO;
import com.spring.shop.cart.service.OrderDetailVO;
import com.spring.shop.cart.service.OrderVO;
import com.spring.shop.item.service.ItemVO;


@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
	
	@Override
	public void addCart(CartVO cartVO) {
		// TODO Auto-generated method stub
		dao.addCart(cartVO);
	}
	@Override
	public List<CartVO> cartList(String userId) {
		// TODO Auto-generated method stub
		return dao.cartList(userId);
	}
	@Override
	public void deleteCart(CartVO cartVO) {
		// TODO Auto-generated method stub
		dao.deleteCart(cartVO);
	}
	@Override
	public void orderInfo(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		dao.orderInfo(orderVO);
	}
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetailVO) throws Exception {
		// TODO Auto-generated method stub
		dao.orderInfo_Details(orderDetailVO);
	}
	
	@Override
	public void cartAllDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		dao.cartAllDelete(userId);	
	}
	
	@Override
	public List<OrderVO> orderList(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList(orderVO);
	}
	
	@Override
	public List<OrderVO> orderView(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderView(orderVO);
	}
	@Override
	public List<OrderVO> adminOrderList() throws Exception {
		// TODO Auto-generated method stub
		return dao.adminOrderList();
	}
	@Override
	public List<OrderVO> adminOrderView(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.adminOrderView(orderVO);
	}
	@Override
	public void delivery(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		dao.delivery(orderVO);
	}
	@Override
	public void changeStock(ItemVO itemVO) throws Exception {
		// TODO Auto-generated method stub
		dao.changeStock(itemVO);
	}
}
