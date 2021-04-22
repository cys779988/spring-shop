<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<body>
	<%@include file="../header.jsp"%>
	<div id="page-wrapper">
		<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-6 col-sm-6">
							<h2>관리자-회원관리</h2>
						</div>
					</div>
				</div>
			</div>
			<hr/>
			<%@include file="nav.jsp"%>
			<form role="form" method="get">
				<div class="col-xs-12 col-sm-12">
					<div class="table-main table-responsive">
						<table class="table">
						<thead>
							<tr>
								<th>회원아이디</th>
								<th>회원이름</th>
								<th>가입일자</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="list">
							<tr>
								<td><a
									href="${pageContext.request.contextPath}/memberManage/readView.do?userId=${list.userId}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
										<c:out value="${list.userId}" />
								</a></td>
								<td><c:out value="${list.userName}" /></td>
								<td><fmt:formatDate value="${list.regDate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>

					</table>
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
								<a href="list.do${pageMaker.makeSearch(idx)}">${idx}</a>
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
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>이름</option>
							<option value="w"
								<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>아이디</option>
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

					<script>
						$(function() {
							$('#searchBtn')
									.click(
											function() {
												self.location = "list.do"
														+ '${pageMaker.makeQuery(1)}'
														+ "&searchType="
														+ $(
																"select option:selected")
																.val()
														+ "&keyword="
														+ encodeURIComponent($(
																'#keywordInput')
																.val());
											});
						});
					</script>
				</div>
			</form>
		</div>

		<%@include file="../footer.jsp"%>
	</div>
</body>
</html>
