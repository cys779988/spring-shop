<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
div#container_box ul li {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
}

.te{
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
}

span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
}
.thumb {
	float: left;
	width: 200px;
	height: 200px;
}
.thumb img {
	width: 200px;
}
</style>
</head>

<body>
<%@include file="../header.jsp"%>
<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>관리자-주문목록관리</h2>
						</div>
					</div>
				</div>
			<hr />
				<%@include file="nav.jsp"%>
				<div class="te">
						<ul class="orderView">
					<c:forEach items="${orderView}" var="orderView" varStatus="status">
						<c:if test="${status.first}">
							<p>
								<span>주문자</span>${orderView.userId}</p>
							<p>
								<span>수령인</span>${orderView.orderRec}</p>
							<p>
								<span>주소</span>(${orderView.zip}) ${orderView.addr1}
								${orderView.addr2}
							</p>
							<p>
								<span>가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.amount}" />
								원
							</p>
							<p>
								<span>상태</span>
								<c:if test="${orderView.delivery == 'N'}">
								배송시작전
								</c:if>
								<c:if test="${orderView.delivery == 'P'}">
								배송중
								</c:if>
								<c:if test="${orderView.delivery == 'Y'}">
								배송완료
								</c:if></p>

							<div class="deliveryChange">
								<form role="form" method="post" class="deliveryForm">

									<input type="hidden" name="orderId"
										value="${orderView.orderId}" /> <input type="hidden"
										name="delivery" class="delivery" value="" />
								<div class="submit-button text-right">
									<button type="button" class="delivery1_btn btn hvr-hover">배송중으로 전환</button>
									<button type="button" class="delivery2_btn btn hvr-hover">배송완료로 전환</button>
									</div>
								</form>
							</div>
						</c:if>
					</c:forEach>
					</ul>
					
				</div>
					<c:forEach items="${orderView}" var="orderView">
						<div class="te">
						<div class="row">
							<c:choose>
								<c:when test="${orderView.ingName ==null}">
									<div class="thumb">
										<img src="${pageContext.request.contextPath }/${orderView.recipeThumbImg}" />
									</div>
									<div class="ingInfo" style="margin-left:50px">
										<p>
											<span>상품명</span>${orderView.recipeName}<br />
											<span>개당 가격</span>
											<fmt:formatNumber pattern="###,###,###" value="${orderView.recipePrice}" /> 원
											<br />
											<span>구입 수량</span>${orderView.cartStock} 개<br />
											<span>최종 가격</span>
											<fmt:formatNumber pattern="###,###,###" value="${orderView.recipePrice * orderView.cartStock}" /> 원
										</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="thumb">
										<img src="${pageContext.request.contextPath }/${orderView.ingThumbImg}" />
									</div>
									<div class="ingInfo" style="margin-left:50px">
										<p>
											<span>상품명</span>${orderView.ingName}<br />
											<span>개당 가격</span>
											<fmt:formatNumber pattern="###,###,###" value="${orderView.ingPrice}" /> 원
											<br />
											<span>구입 수량</span>${orderView.cartStock} 개<br />
											<span>최종 가격</span>
											<fmt:formatNumber pattern="###,###,###" value="${orderView.ingPrice * orderView.cartStock}" /> 원
										</p>
									</div>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</c:forEach>
	</div>
	<%@include file="../footer.jsp"%>
<script>
	$(".delivery1_btn").click(function() {
		$(".delivery").val("P");
		run();
	});

	$(".delivery2_btn").click(function() {
		$(".delivery").val("Y");
		run();

	});

	function run() {
		$(".deliveryForm").submit();
	}
</script>
</body>

</html>