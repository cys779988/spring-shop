<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.orderInfo {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
}

.orderInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}

.orderView li {
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999;
}

.orderView li::after {
	content: "";
	display: block;
	clear: both;
}

.thumb {
	float: left;
	width: 200px;
	height: 200px;
}

.thumb img {
	width: 200px;
}

.gdsInfo {
	float: right;
	width: calc(100% - 220px);
	line-height: 2;
}

.gdsInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 100px;
	margin-right: 10px;
}

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
</style>

<title>1인 식탁</title>
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
			<section id="content">
				<div class="orderInfo">
					<c:forEach items="${orderView}" var="orderView" varStatus="status">

						<c:if test="${status.first}">
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
						</c:if>

					</c:forEach>
				</div>
				<ul class="orderView">
					<c:forEach items="${orderView}" var="orderView">
							<c:choose>
								<c:when test="${orderView.ingName ==null}">
								<li>
									<div class="thumb">
										<img src="${pageContext.request.contextPath }/${orderView.recipeThumbImg}" />
									</div>
									<div class="recipeInfo" style="margin-left:50px">
										<p>
											<span>상품명</span>
											${orderView.recipeName}
											<br/>
											<span>개당 가격</span>
											<fmt:formatNumber pattern="###,###,###" value="${orderView.recipePrice}" />원<br />
											<span>구입 수량</span>
											${orderView.cartStock} 개
											<br/>
											<span>최종 가격</span>
											<fmt:formatNumber pattern="###,###,###" value="${orderView.recipePrice * orderView.cartStock}" />원
										</p>
									</div>
								</li>
								</c:when>
								<c:otherwise>
								<li>
									<div class="thumb">
										<img src="${pageContext.request.contextPath }/${orderView.ingThumbImg}" />
									</div>
									<div class="ingInfo" style="margin-left:50px">
										<p>
											<span>상품명</span>
											${orderView.ingName}
											<br/>
											<span>개당 가격</span>
											<fmt:formatNumber pattern="###,###,###" value="${orderView.ingPrice}" />원<br />
											<span>구입 수량</span>
											${orderView.cartStock} 개
											<br/>
											<span>최종 가격</span>
											<fmt:formatNumber pattern="###,###,###" value="${orderView.ingPrice * orderView.cartStock}" />원
										</p>
									</div>
								</li>
								</c:otherwise>
							</c:choose>
					</c:forEach>
				</ul>
			</section>
		</div>
	<%@include file="../footer.jsp"%>
</body>

</html>