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
						<div class="col-lg-7 col-sm-7">
							<h2>식재료판매페이지</h2>
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
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sell_ing_list.do'">All</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=채소'">채소</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=과일'">과일</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=육류'">육류</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=해산물'">해산물</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=유제품'">유제품</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=견과류'">견과류</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=소스'">소스</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=조미료'">조미료</button>
											<button
												onClick="location.href='${pageContext.request.contextPath }/ingredient/sellIngCateList.do?c=기타'">기타</button>
										</div>
									</div>
								</div>
							</div>

							<div class="row special-list">
								<c:forEach items="${sellIngList}" var="sellIngList">
									<div class="col-lg-3 col-md-6 special-grid fruits">
										<div class="products-single fix">

											<div class="box-img-hover">

												<a href="${pageContext.request.contextPath }/ingredient/sellIngView.do?n=${sellIngList.ingNum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
												<img src="${pageContext.request.contextPath }/${sellIngList.ingThumbImg }" class="img-fluid"
													alt="등록된 이미지가 없습니다." style="width:200px;"></a>

											</div>
											<div class="why-text">
												<h4><a href="${pageContext.request.contextPath }/ingredient/sellIngView.do?n=${sellIngList.ingNum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
												<c:out value="${sellIngList.ingName}" /></a></h4>
												<h5>${sellIngList.ingPrice }원</h5>
											</div>
										</div>
									</div>
								</c:forEach>



							</div>
							<div class="col-md-offset-3">
						<ul class="paging ">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="sell_ing_list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a href="sell_ing_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="sell_ing_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
							<div class="search row">
						<div class="col-xs-3 col-sm-3">
							<select name="searchType" class="form-control">
								<option value="n"
									<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>식재료명</option>
							</select>
						</div>

						<div class="col-xs-9 col-sm-9">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput"
									value="${scri.keyword}" class="form-control" /> <span
									class="input-group-btn">
									<button id="searchBtn" type="button" class="btn hvr-hover">검색</button>
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
									self.location = "sell_ing_list.do"
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