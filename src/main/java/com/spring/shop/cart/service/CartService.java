package com.spring.shop.cart.service;

import java.util.List;

import com.spring.shop.item.service.ItemVO;


public interface CartService {
	//카트담기
	public void addCart(CartVO cartVO);
	//장바구니 목록
	public List<CartVO> cartList(String userId);
	//장바구니 삭제
	public void deleteCart(CartVO cartVO);
	//주문 정보
	public void orderInfo(OrderVO orderVO) throws Exception;
	//주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetailVO) throws Exception;
	//장바구니 비우기
	public void cartAllDelete(String userId) throws Exception;
	//주문 목록
	public List<OrderVO> orderList(OrderVO orderVO) throws Exception;
	//특정 주문 목록
	public List<OrderVO> orderView(OrderVO orderVO) throws Exception;
	//관리자 주문 목록
	public List<OrderVO> adminOrderList() throws Exception;
	//관리자 특정 주문 목록
	public List<OrderVO> adminOrderView(OrderVO orderVO) throws Exception;
	//배송 상태
	public void delivery(OrderVO orderVO) throws Exception; 
	//상품 수량 조절
	public void changeStock(ItemVO ingredientVO) throws Exception;
}