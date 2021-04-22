<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body>
<%@include file="../header.jsp"%>
<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>식재료관리목록</h2>
						</div>
					</div>
				</div>
			<hr />
				<%@include file="nav.jsp"%>
			<section id="container">
				<div id="container_box">
					<ul>
						<c:forEach items="${reply}" var="reply">
							<li>
								<div class="replyInfo">
									<p>
										<span>작성자</span>${reply.userName} (${reply.userId})
									</p>
									<p>
										<span>작성된 상품</span> <a href="<c:url value='/ingredient/view.do?n=${reply.gdsNum}'/>">바로가기</a>
									</p>
								</div>
								<div class="replyContent">${reply.repCon}</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</section>
		</div>
	<%@include file="../footer.jsp"%>
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "list.do" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
</body>

</html>