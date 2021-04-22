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
	<div id="page-wrapper">
		<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>관리자-광고</h2>
						</div>
					</div>
				</div>
			<hr />
			<%@include file="nav.jsp"%>
		</div>
		<div class="products-box">
		<div class="col-xs-12 col-sm-12">
			<div class="container">
			<form role="form" method="get">
				<div class="row">
				<div class="row special-list">
					<c:forEach items="${adList}" var="adList">
							<div class="products-single fix" style="margin-left:30px;">

								<div class="box-img-hover">

									<a href="<c:url value='/advertise/readView.do?adNum=${adList.adNum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'/>">
										<img src="${pageContext.request.contextPath }/${adList.adThumbImg }" class="img-fluid" alt="Image" style="width:200px;">
									</a>
								</div>
								<div class="why-text">
									<a href="<c:url value='/advertise/readView.do?adNum=${adList.adNum }&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'/>">${adList.adName }</a>

									<h5>${adList.regdate }</h5>
								</div>
							</div>
					</c:forEach>
					</div>
				</div>
				<div class="col-md-offset-3">
					<ul class="paging">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a class="now" href="list.do${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
				<div class="search row centerd" style="margin-top: 10px;">
					<div class="col-xs-3 col-sm-3">
						<select name="searchType" class="form-control">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="t"
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>광고명</option>
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
			</form>
			</div>
			</div>
		</div>

		<%@include file="../footer.jsp"%>
	</div>
<script>
	$(function() {
		$('#searchBtn').click(function() {
							self.location = "list.do"
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