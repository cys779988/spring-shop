<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
#container_box ul li {
	margin-bottom: 20px;
	border: 10px solid #eee;
}

.replyInfo {
	background: #eee;
	padding: 10px;
	font-size: 18px;
}

.replyInfo span {
	font-size: 20px;
	font-weight: bold;
	margin-right: 20px;
}

.replyContent {
	padding: 10px;
}

.replyControll {
	text-align: right;
	padding: 10px;
}

.replyControll button {
	border: 2px solid #999;
	background: #fff;
}
</style>
</head>

<body>
	<%@include file="../header.jsp"%>
	<div id="page-wrapper">
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
										<span>작성된 상품</span> <a
											href="/ingredient/sellIngView?n=${reply.ingNum}">바로가기</a>

									</p>
								</div>
								<div class="replyContent">${reply.repCon}</div>
								<div class="replyControll">
									<form role="form" method="post">
										<input type="hidden" name="repNum" value="${reply.repNum}" />
										<button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
									</form>
								</div>
							</li>

						</c:forEach>

					</ul>


				</div>
			</section>
		</div>
	</div>


	<%@include file="../footer.jsp"%>
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
</body>

</html>