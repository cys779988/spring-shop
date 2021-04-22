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
						<div class="col-lg-10 col-sm-10">
							<h2>관리자-식재료</h2>
						</div>
					</div>
				</div>
			</div>
			<hr />
				<%@include file="nav.jsp"%>
			<div class="col-lg-12 col-sm-12">
			<div class="container">
					<form name="readForm" role="form" method="post">
						<input type="hidden" id="ingredient_id" name="ingNum" value="${ingredient.ingNum}" />
						<input type="hidden" id="page" name="page" value="${scri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
                    	<input type="hidden" name="n" value="${ingredient.ingNum}" />
					</form>

				<div class="row">
                <div class="col-xl-7 col-lg-7 col-md-8">
                    <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <img class="d-block w-100"  src="${pageContext.request.contextPath }/${ingredient.ingThumbImg}" class="thumbImg" />
                        </div>
                    </div>
                </div>

                    <div class="single-product-details">
                        <h2>${ingredient.ingCateCode}-${ingredient.ingName}</h2>
                        <h5><fmt:formatNumber value="${ingredient.ingPrice}" pattern="###,###,###" />원</h5>
                        <p class="available-stock">stock : <span> ${ingredient.ingStock}개 <br>weight : ${ingredient.ingWeight}g/ml</span><p>
                    </div>
                </div>
               <div class="col-xl-12">
                <h4><br>Description</h4>
						<p><c:out value="${ingredient.ingDes}" escapeXml="false"/></p>
				</div>
						<div class="submit-button text-center" style="margin-top:100px">
							<button type="button" id="modify_Btn" class="btn hvr-hover">수정</button>
							<button type="button" id="delete_Btn" class="btn hvr-hover">삭제</button>
						</div>
                </div>


			</div>
			</div>
		<%@include file="../footer.jsp"%>
<script>
	var formObj = $("form[role='form']");

	$("#modify_Btn").click(
			function() {
				formObj.attr("action", "<c:url value='/ingredient/ingModify.do'/>");
				formObj.attr("method", "post")
				formObj.submit();
			});

	$("#delete_Btn").click(
			function() {

				var con = confirm("정말로 삭제하시겠습니까?");

				if (con) {
					formObj.attr("action", "<c:url value='/ingredient/delete.do'/>");
					formObj.submit();
				}
			});
</script>
</body>
</c:when>
<c:otherwise>
out.println("<script>alert('접근권한이 없습니다.');history.back();</script>");
</c:otherwise>
</c:choose>
</html>