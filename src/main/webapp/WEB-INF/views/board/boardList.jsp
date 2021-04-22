<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>

<body>
	<%@include file="../header.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>게시판</h2>
						</div>
					</div>
				</div>
			<hr />
			<%@include file="nav.jsp"%>
			<form role="form" method="get">
				<div class="col-xs-10 col-sm-12">
					<div class="table-main table-responsive">
						<table class="table">
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td><a
									href="<c:url value='/board/readView.do?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'/>"><c:out
											value="${list.title}" /></a></td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}"
										pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${list.hit}" /></td>
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
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"
								<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w"
								<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc"
								<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
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

					<script>
						$(function() {
							$('#searchBtn').click(function() {
												self.location = "list"
														+ '${pageMaker.makeQuery(1)}'
														+ "&searchType="
														+ $("select option:selected").val()
														+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
											});
						});
					</script>
				</div>

			</form>
		</div>


		<%@include file="../footer.jsp"%>
</body>

</html>
