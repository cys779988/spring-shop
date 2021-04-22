<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<style>
.box-img-hover{
	height : 200px;
	width : 200px;
}
</style>
<body>
	<%@include file="header.jsp"%>
	<!-- Start Products  -->
	<div class="container">
	
   <div id="slides-shop" class="cover-slides">
   	<div class="container">
   		<div class="row">
      	<ul class="slides-container">
         <c:forEach items="${adList}" var="adList" begin="0" end="2">
           <img src="${pageContext.request.contextPath}/${adList.adImg }" style="width:300px;">
         </c:forEach>
         </ul>
         <div class="slides-pagination">
            <a class="current"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a class=""><i class="fa fa-angle-left" aria-hidden="true"></i></a>
         </div>
         </div>
   </div>
   </div>
	<div class="products-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>과일 & 식재료</h1>
						<p></p>
					</div>
				</div>
			</div>

			<div class="row special-list">
				<c:forEach items="${sellIngList}" var="sellIngList" begin="0"
					end="3">
					<div class="col-lg-3 col-md-6 special-grid fruits">
						<div class="products-single fix">

							<div class="box-img-hover">
								<a href="${pageContext.request.contextPath}/ingredient/sellIngView.do?n=${sellIngList.ingNum }"><img
									src="${sellIngList.ingThumbImg }" class="img-fluid" alt="Image"
									style="width: 200px;"></a>

							</div>
							<div class="why-text">
								<a href="${pageContext.request.contextPath}/ingredient/sellIngView.do?n=${sellIngList.ingNum }">${sellIngList.ingName }</a>

								<h5>${sellIngList.ingPrice }원</h5>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</div>
	<!-- End Products  -->

	<!-- Start Products  -->
	<div class="products-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>레시피</h1>
						<p></p>
					</div>
				</div>
			</div>

			<div class="row special-list">
				<c:forEach items="${recipeList}" var="recipeList" begin="0"
					end="3">
					<div class="col-lg-3 col-md-6 special-grid fruits">
						<div class="products-single fix">

							<div class="box-img-hover">

								<a href="${pageContext.request.contextPath}/recipe/sellRecipeView.do?n=${recipeList.recipeNum }"><img
									src="${recipeList.recipeThumbImg }" class="img-fluid" alt="Image"
									style="width: 200px;"></a>

							</div>
							<div class="why-text">
								<a href="${pageContext.request.contextPath}/recipe/sellRecipeView.do?n=${recipeList.recipeNum }">${recipeList.recipeName }</a>

								<h5>${recipeList.recipePrice }원</h5>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</div>
	<!-- End Products  -->
</div>
<%@include file="footer.jsp"%>
</body>
</html>