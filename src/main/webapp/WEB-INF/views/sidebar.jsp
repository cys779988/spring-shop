<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.centerd {
	margin-right: auto;
	margin-left: auto;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 100%;
	background-color: #ffffff;
	overflow-x: hidden;
	overflow-y: auto;
}

#page-content-wrapper {
	width: 100%;
	padding: 20px;
}
/* 사이드바 스타일 */
.sidebar-nav {
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #000000;
}

.sidebar-nav li a:hover {
	color: #000000;
	background: rgb(255, 255, 100, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}
</style>
<div id="sidebar-wrapper">
	<c:if test="${member != null }">
		<ul class="sidebar-nav">
			<li><a href="${pageContext.request.contextPath}/member/modifyForm.do">회원정보수정</a></li>
			<li><a href="${pageContext.request.contextPath}/member/deleteForm.do">회원정보탈퇴</a></li>
			<li><a href="${pageContext.request.contextPath}/cart/cartList.do">장바구니목록</a></li>
			
			<c:if test="${member.authority == 1 || member.authority == 3}"> 
				<li><a href="${pageContext.request.contextPath}/ingredient/admin_ing_list.do">식재료관리페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/recipe/admin_recipe_list.do">레시피관리페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/cart/adminOrderList.do">주문관리페이지</a></li>
			</c:if>
			<c:if test="${member.authority == 2 || member.authority == 3}">
				<li><a href="${pageContext.request.contextPath}/advertise/list.do">광고관리페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/memberManage/list.do">회원정보관리페이지</a></li>
			</c:if>
		</ul>
	</c:if>
</div>