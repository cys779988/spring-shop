<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<c:choose>
<c:when test="${member.authority == 1 || member.authority == 3}">
<body>
<%@include file="../header.jsp"%>
<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>관리자-레시피</h2>
						</div>
					</div>
				</div>
			<hr />
			<%@include file="nav.jsp"%>
			<div class="col-lg-12 col-sm-12">
				<div class="container">
					<section id="container">
						<form name="readForm" role="form" method="post">
							<input type="hidden" id="recipeNum" name="recipeNum"
								value="${recipe.recipeNum}" /> <input type="hidden" id="page"
								name="page" value="${scri.page}"> <input type="hidden"
								id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
							<input type="hidden" id="searchType" name="searchType"
								value="${scri.searchType}"> <input type="hidden"
								id="keyword" name="keyword" value="${scri.keyword}">
						</form>

						<form role="form" method="post" autocomplete="off">

							<div class="row">
								<div class="col-xl-7 col-lg-7 col-md-8">
									<div id="carousel-example-1"
										class="single-product-slider carousel slide"
										data-ride="carousel">
										<div class="carousel-inner" role="listbox">
											<img class="d-block w-100" src="${pageContext.request.contextPath }/${recipe.recipeThumbImg}"
												class="thumbImg" />
										</div>
									</div>
								</div>

								<div class="single-product-details">
									<input type="hidden" name="n" value="${recipe.recipeNum}" />
									<h2>${recipe.recipeCateCode}-${recipe.recipeName}</h2>

									<h5>
										<fmt:formatNumber value="${recipe.recipePrice}"
											pattern="###,###,###" />
										원
									</h5>
									 <p class="available-stock">stock : <span> ${recipe.recipeStock}개 
									 </span>
									 <div class="form-group" style="border: 1px solid;">
									 식재료
									 <c:if test="${recipe.ingName1 != null}">
									 <br> ${recipe.ingName1}  :  ${recipe.ingWeight1} g/ml
									 </c:if>
									 <c:if test="${recipe.ingName2 != null}">
									 <br> ${recipe.ingName2}  :  ${recipe.ingWeight2} g/ml
									 </c:if>
									 <c:if test="${recipe.ingName3 != null}">
									 <br> ${recipe.ingName3}  :  ${recipe.ingWeight3} g/ml
									 </c:if>
									 <c:if test="${recipe.ingName4 != null}">
									 <br> ${recipe.ingName4}  :  ${recipe.ingWeight4} g/ml
									 </c:if>
									 <c:if test="${recipe.ingName5 != null}">
									 <br> ${recipe.ingName5}  :  ${recipe.ingWeight5} g/ml
									 </c:if>
									 <c:if test="${recipe.ingName6 != null}">
									 <br> ${recipe.ingName6}  :  ${recipe.ingWeight6} g/ml
									 </c:if>
									 <c:if test="${recipe.ingName7 != null}">
									 <br> ${recipe.ingName7}  :  ${recipe.ingWeight7} g/ml
									 </c:if>
									 <c:if test="${recipe.ingName8 != null}">
									 <br> ${recipe.ingName8}  :  ${recipe.ingWeight8} g/ml
									 </c:if>
									 <c:if test="${recipe.ingName9 != null}">
									 <br> ${recipe.ingName9}  :  ${recipe.ingWeight9} g/ml
									 </c:if>
									</div>

							</div>

							<div class="col-xl-12">
								<h4>
									<br>Description
								</h4>
								<p><c:out value="${recipe.recipeDes}" escapeXml="false"/></p>
							</div>
</div>

				<div class="submit-button text-center" style="margint-top: 100px">
					<button type="button" id="modify_Btn" class="btn hvr-hover">수정</button>
					<button type="button" id="delete_Btn" class="btn hvr-hover">삭제</button>
				</div>


				</form>
				</section>
			</div>
		</div>
	</div>
		<%@include file="../footer.jsp"%>
<script>
$(document).ready(function() {
	var formObj = $("form[role='form']");

	$("#modify_Btn").click(function() {
		formObj.attr("action", "<c:url value='/recipe/recipeModify.do'/>");
		formObj.attr("method", "get")
		formObj.submit();
	});

	$("#delete_Btn").click(function() {

		var con = confirm("정말로 삭제하시겠습니까?");

		if (con) {
			formObj.attr("action", "<c:url value='/recipe/delete.do'/>");
			formObj.submit();
		}
	});
})
</script>
</body>
</c:when>
<c:otherwise>
out.println("<script>alert('접근권한이 없습니다.');history.back();</script>");
</c:otherwise>
</c:choose>
</html>