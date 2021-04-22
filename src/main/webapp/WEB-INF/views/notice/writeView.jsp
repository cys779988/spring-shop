<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<%@include file="../header.jsp"%>
	<div id="page-wrapper">
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>공지사항</h2>
						</div>
					</div>
				</div>
			<hr />
			<div class="col-lg-12 col-sm-12">
				<section id="container">
					<form role="form" method="post" name="writeForm"
						enctype="multipart/form-data">
						<c:if test="${msg==null }">
							<%@include file="nav.jsp"%>
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">제목</label><input
									type="text" id="title" class="chk form-control" name="title" />
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-3 control-label">내용</label>
								<textarea id="content" class="chk form-control" name="content"
									style="height: 500px;"></textarea>
							</div>
							<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
							<script type="text/javascript">
								$(function() {
									var editor = CKEDITOR
											.replace(
													'content',
													{
														height : '600px',
														filebrowserUploadUrl : "<c:url value='/notice/ckUpload.do'/>",
														filebrowserImageUploadUrl : "<c:url value='/notice/ckUpload.do'/>"
													});
								});
							</script>
					<div class="inputArea">
						<input type="file" id="nImg" name="file" />
							<input type="hidden" name="nThumbImg"/>
						<div class="select_img">
							<img src="" />
						</div>

						
						<%-- <%=request.getRealPath("/") %> --%>
					</div>
							<input type="hidden" id="writer" name="writer" value="${member }">
							<div class="submit-button text-center">
								<button class="write_btn btn hvr-hover" type="submit">글작성</button>
								<button type="button" onclick="history.go(-1);" class="btn hvr-hover">취소</button>
							</div>
						</c:if>
						<c:if test="${msg==false }">
							<div class="submit-button text-center">
								<h2>로그인 후 공지사항 작성이 가능합니다.</h2><br>
								<button class="login_btn btn hvr-hover">로그인</button>
							</div>
						</c:if>
					</form>
				</section>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
<script>
$(document).ready(function() {
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function() {
			/* 	if (fn_valiChk()) {
					return false;
				} */
				formObj.attr("action", "<c:url value='/notice/write.do'/>");
				formObj.attr("method", "post");
				formObj.submit();
			});
			/* $(".cancel_btn")
					.on(
							"click",
							function() {
								location.href = "/notice/list?page=${scri.page}"
										+ "&perPageNum=${scri.perPageNum}"
										+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
								formObj.attr("method", "get");
							}); */
			$(".login_btn").on("click", function() {
				formObj.attr("action", "<c:url value='/member/loginForm.do'/>");
				formObj.attr("method", "post");
				formObj.submit();
			});

		})
$("#nImg").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img img").attr("src",data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		}
});
</script>
</body>
</html>