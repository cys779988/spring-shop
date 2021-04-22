<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

</head>

<body>
<%@include file="../header.jsp"%>
<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>주문목록</h2>
						</div>
					</div>
				</div>
			<hr />
			<section id="container">
				<div id="container_box">
					<section id="content">
						<ul class="orderList">
							<c:forEach items="${orderList}" var="orderList">
								<li>
									<div class="border">
										<p>
											<span>주문번호</span><a
												href="${pageContext.request.contextPath }/cart/orderView.do?n=${orderList.orderId}">${orderList.orderId}</a>
										</p>
										<p>
											<span>수령인</span>${orderList.orderRec}</p>
										<p>
											<span>주소</span>(${orderList.zip}) ${orderList.addr1}
											${orderList.addr2}
										</p>
										<p>
											<span>가격</span>
											<fmt:formatNumber pattern="###,###,###"
												value="${orderList.amount}" />
											원
										</p>
										<p>
											<span>상태</span>
											<c:if test="${orderList.delivery == 'N'}">
											배송시작전
											</c:if>
											<c:if test="${orderList.delivery == 'P'}">
											배송중
											</c:if>
											<c:if test="${orderList.delivery == 'Y'}">
											배송완료
											</c:if></p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</section>
				</div>
			</section>
		</div>
	<%@include file="../footer.jsp"%>
</body>

</html>