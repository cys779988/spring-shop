<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
							<h2>관리자-식재료</h2>
						</div>
					</div>
				</div>
			<hr />
				<%@include file="nav.jsp"%>
			<section id="container">
				<form role="form" method="get">
					<div class="table-main table-responsive">
						<table class="table">
						<thead>
							<tr>
								<th>상품이미지</th>
								<th>식재료명</th>
								<th>카테고리</th>
								<th>가격</th>
								<th>수량</th>
								<th>등록일</th>
							</tr>
						</thead>

						<c:forEach items="${ingList}" var="ingList">
							<tr>
								<td><img src="${pageContext.request.contextPath }/${ingList.ingThumbImg}" style="width:100px;"></td>
								<td><a
									href="${pageContext.request.contextPath }/ingredient/admin_ing_view.do?n=${ingList.ingNum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
											value="${ingList.ingName}" /></a></td>
								<td>
									<!-- ${list.cateCode} --> ${ingList.ingCateCode}
								</td>
								<td><c:out value="${ingList.ingPrice}" /></td>
								<td><c:out value="${ingList.ingStock}" /></td>
								<td><fmt:formatDate value="${ingList.regDate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>

					</table>
					</div>
					<div class="col-md-offset-3">
						<ul class="paging">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="admin_ing_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a href="admin_ing_list.do${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="admin_ing_list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
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
									<button id="searchBtn" type="button" class="btn btn-default">검색</button>
								</span>
							</div>
						</div>


					</div>
					
				</form>
			</section>
		</div>


	<%@include file="../footer.jsp"%>
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "admin_ing_list.do" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
</body>
</c:when>
<c:otherwise>
out.println("<script>alert('접근권한이 없습니다.');history.back();</script>");
</c:otherwise>
</c:choose>
</html>