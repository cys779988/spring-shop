<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
.date {
	color: #999;
	display: inline-block;
	margin-left: auto;
}
</style>
<body>
	<%@include file="../header.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>게시판]</h2>
						</div>
					</div>
				</div>
			<hr />
		<div class="col-lg-12 col-sm-12">
			<%@include file="nav.jsp"%>
				<section id="container">
					<form name="updateForm" role="form" method="post" enctype="multipart/form-data"
						action="/board/update">
						<input type="hidden" name="bno" value="${update.bno}"
							readonly="readonly" />
						<div class="form-group">
							<label for="title" class="col-sm-2 control-label">제목</label> <input
								type="text" id="title" name="title" class=" chk form-control"
								value="${update.title}" title="제목을 입력하세요" />
						</div>
						<div class="form-group">
							<label for="content" class="col-sm-2 control-label">내용</label>
							<textarea id="content" name="content" class="form-control"style="height: 500px;"><c:out value="${update.content}" /></textarea>
						</div>
							<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
							<script type="text/javascript">
								$(function() {
									var editor = CKEDITOR
											.replace(
													'content',
													{
														height : '600px',
														filebrowserUploadUrl : "<c:url value='/board/ckUpload.do'/>",
														filebrowserImageUploadUrl : "<c:url value='/board/ckUpload.do'/>"
													});
								});
							</script>
							<div class="form-group">
					<input type="file" id="bImg" name="file" />
					<div class="select_img">
						<img src="${pageContext.request.contextPath}/${update.bImg}" /> <input type="hidden"
							name="boardImg" value="${update.bImg}" /> <input
							type="hidden" name="ingThumbImg"
							value="${update.bThumbImg}" />
					</div>
					<script>
						$("#bImg").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
						</div>
						<div class="form-group">
							<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
							<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" />
						</div>
						<div class="submit-button text-center">
							<button type="submit" class="update_btn btn hvr-hover">저장</button>
							<button type="submit" class="cancel_btn btn hvr-hover">취소</button>
						</div>
					</form>
				</section>
			</div>
		</div>
	<%@include file="../footer.jsp"%>
<script type="text/javascript">
	$(document).ready(
			function() {
				var formObj = $("form[name='updateForm']");

				$(".cancel_btn").on(
						"click",
						function() {
							event.preventDefault();
							location.href = "<c:url value='/board/readView.do?bno=${update.bno}"
									+ "&page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}"
									+ "&keyword=${scri.keyword}'/>";
						})

				$(".update_btn").on("click", function() {
					if (fn_valiChk()) {
						return false;
					}
					formObj.attr("action", "<c:url value='/board/update.do'/>");
					formObj.attr("method", "post");
					formObj.submit();
				})
			})

	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
</body>
</html>