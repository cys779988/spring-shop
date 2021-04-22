package com.spring.shop.cart.web;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.shop.cart.service.CartService;
import com.spring.shop.cart.service.CartVO;
import com.spring.shop.cart.service.OrderDetailVO;
import com.spring.shop.cart.service.OrderVO;
import com.spring.shop.item.service.ItemVO;
import com.spring.shop.member.service.MemberVO;


@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;

	// 카트담기
	@ResponseBody
	@RequestMapping("/addCart.do")
	public int addCart(CartVO cartVO, HttpSession session) {

		int result = 0;
		if(cartVO.getIngNum()!=null && cartVO.getIngNum()!="") {
			cartVO.setItemNum(cartVO.getIngNum());
		}
		if(cartVO.getRecipeNum()!=null && cartVO.getRecipeNum()!="") {
			cartVO.setItemNum(cartVO.getRecipeNum());
		}
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member != null) {
			cartVO.setUserId(member.getUserId());
			cartService.addCart(cartVO);
			result = 1;
		}
		return result;
	}

	// 카트목록
	@RequestMapping(value = "/cartList.do")
	public String getCartList(HttpSession session, Model model) {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		List<CartVO> cartList = cartService.cartList(userId);

		model.addAttribute("cartList", cartList);

		return "cart/cartList";
	}
	
	// 주문
	@RequestMapping(value = "/order.do", method =RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setUserId(userId);

		cartService.orderInfo(order);

		orderDetail.setOrderId(orderId);
		cartService.orderInfo_Details(orderDetail);

		cartService.cartAllDelete(userId);

		return "redirect:/cart/orderList.do";
	}

	// 카트삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart.do")
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		int result = 0;
		int cartNum = 0;

		if (member != null) {
			cart.setUserId(userId);

			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				cartService.deleteCart(cart);
			}
			result = 1;
			
		}
		return result;
	}


	// 주문 목록
	@RequestMapping(value = "/orderList.do", method =RequestMethod.GET)
	public String getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);

		List<OrderVO> orderList = cartService.orderList(order);

		model.addAttribute("orderList", orderList);

		return "cart/orderList";
	}

	// 주문 상세 목록
	@RequestMapping(value = "/orderView.do", method =RequestMethod.GET)
	public String getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model)
			throws Exception {
		

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);
		order.setOrderId(orderId);

		List<OrderVO> orderView = cartService.orderView(order);

		model.addAttribute("orderView", orderView);
		return "cart/orderView";
	}
	
	// 관리자 주문 목록
	@RequestMapping(value = "/adminOrderList.do", method =RequestMethod.GET)
	public String getOrderList(Model model) throws Exception {
	
	   
	 List<OrderVO> orderList = cartService.adminOrderList();
	 
	 model.addAttribute("orderList", orderList);
	 return "cart/admin_order_list";
	}

	// 관리자 주문 상세 목록
	@RequestMapping(value = "/adminOrderView.do", method =RequestMethod.GET)
	public String getOrderList(@RequestParam("n") String orderId,
	      OrderVO orderVO, Model model) throws Exception {
	 
	 
	 orderVO.setOrderId(orderId);  
	 List<OrderVO> orderView = cartService.adminOrderView(orderVO);
	 
	 model.addAttribute("orderView", orderView);
	 
	 return "cart/admin_order_view";
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/adminOrderView.do", method =RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
	
	   
	 cartService.delivery(order);
	 
	 List<OrderVO> orderView = cartService.orderView(order);
	 ItemVO item = new ItemVO();
	   
	 for(OrderVO i : orderView) {
		 item.setIngNum(i.getIngNum());
		 item.setIngStock(i.getCartStock());
		 cartService.changeStock(item);
	 }

	 return "redirect:adminOrderView.do?n=" + order.getOrderId();
	}
}
