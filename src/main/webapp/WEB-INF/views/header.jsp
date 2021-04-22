<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"
   type="image/x-icon"> --%>
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<header class="main-header">
	<!-- Start Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
		<div class="container">
			<!-- Start Header Navigation -->
			<div class="navbar-header">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar-menu" aria-controls="navbars-rs-food"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/main.do"><img src="${pageContext.request.contextPath}/images/logo.png"
					class="logo" alt="Logo"></a>
			</div>
			<!-- End Header Navigation -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
					data-out="fadeOutUp">

					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/list.do">게시판</a></li>
					
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>

					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/recipe/sell_recipe_list.do">레시피</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ingredient/sell_ing_list.do">식재료</a></li>
					<c:if test="${member == null}">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a></li>
					</c:if>
					<c:if test="${member != null }">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cart/orderList.do">마이페이지</a></li>

						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cart/cartList.do">장바구니</a></li>
						<div class="submit-button text-right"><button class="write_btn btn hvr-hover">${member.userId }님환영합니다.</button></div>
					</c:if>
				</ul>
<!-- 				<form action="#">
					<input class="form-control" placeholder="Search here..."
						type="text">
				</form>
				<button type="submit">
					<i class="fa fa-search"></i>
				</button> -->
			</div>
		</div>
	</nav>
	<!-- End Navigation -->
</header>