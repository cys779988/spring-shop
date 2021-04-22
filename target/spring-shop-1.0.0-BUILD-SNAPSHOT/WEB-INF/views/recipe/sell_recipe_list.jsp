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
	<%@include file="../header.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
						<div class="col-lg-10 col-sm-10">
							<h2>레시피판매페이지</h2>
						</div>
					</div>
				</div>
			</div>
				<div class="container">
					<!-- Start Gallery  -->
					<section>
					<div class="products-box">
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<div class="special-menu text-center">
										<div class="button-group filter-button-group">
											<button class="active"
												onClick="location.href='${pageContext.request.contextPath }/recipe/sell_recipe_list.do'">All</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=밑반찬'">밑반찬</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=국/탕'">국/탕</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=찌개'">찌개</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=해물류'">해물류</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=면'">면</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=양식'">양식</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=샐러드'">샐러드</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=간식'">간식</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/recipe/sellRecipeCateList.do?c=볶음'">볶음</button>
										</div>
									</div>
								</div>
							</div>

							<div class="row special-list">
								<c:forEach items="${sellRecipeList}" var="sellRecipeList">
									<div class="col-lg-3 col-md-6 special-grid fruits">
										<div class="products-single fix">

											<div class="box-img-hover">
												<a href="${pageContext.request.contextPath }/recipe/sellRecipeView.do?n=${sellRecipeList.recipeNum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
												<img src="${pageContext.request.contextPath }/${sellRecipeList.recipeThumbImg }" class="img-fluid" style="width:200px;"></a>
											</div>
											<div class="why-text">
												<h4><a href="${pageContext.request.contextPath }/recipe/sellRecipeView.do?n=${sellRecipeList.recipeNum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
												<c:out value="${sellRecipeList.recipeName}" /></a></h4>
												<h5>${sellRecipeList.recipePrice }원</h5>
											</div>
										</div>
									</div>
								</c:forEach>



							</div>
							<div class="col-md-offset-3">
						<ul class="paging ">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="${pageContext.request.contextPath }/sell_recipe_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a href="sell_recipe_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="sell_recipe_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
							<div class="search row">
						<div class="col-xs-3 col-sm-3">
							<select name="searchType" class="form-control">
								<option value="n"
									<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>레시피명</option>
							</select>
						</div>

						<div class="col-xs-9 col-sm-9">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput"
									value="${scri.keyword}" class="form-control" /> <span
									class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button>
								</span>
							</div>
						</div>


					</div>
						</div>
					</div>
					</section>
				</div>
			</div>
		<%@include file="../footer.jsp"%>
<script>
$(document).ready(function() {
			$('#searchBtn').click(function() {
									self.location = "${pageContext.request.contextPath }/sell_recipe_list.do"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($('#keywordInput').val());
											});
						});
</script>
</body>

</html>