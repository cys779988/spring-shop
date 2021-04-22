<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<c:choose>
<c:when test="${member.authority == 1 || member.authority == 3}">
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
		<div class="col-lg-12 col-sm-12">
			<div class="contact-box-main">
				<div class="container">
					<div class="row">
				<form method="post" name="registForm" enctype="multipart/form-data" style="width: 100%">
						<label for="adName">광고명</label> <input type="text" id="adName" name="adName" style="width: 100%"/>
						<label for="adDes">광고소개</label>
						<br>
						<textarea rows="7" style="width: 100%" maxlength="500" id="adDes" name="adDes"></textarea>
						<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
						<script type="text/javascript">
							$(function() {
								var editor = CKEDITOR
										.replace(
												'adDes',
												{
													height : '600px',
													filebrowserUploadUrl : "<c:url value='/advertise/ckUpload.do'/>",
													filebrowserImageUploadUrl : "<c:url value='/advertise/ckUpload.do'/>"
												});
							});
						</script>
						<input type="file" id="adImg" name="file" />
						<div class="select_img">
							<img src="" />

						
						<%-- <%=request.getRealPath("/") %> --%>
					</div>
					<div class="submit-button text-center" style="margin-top:100px;">
						<button type="button" class="btn hvr-hover" onclick="registBtn()">등록</button>
						<button type="button" onclick="history.go(-1);" class="btn hvr-hover">취소</button>
					</div>
				</form>
			</div>
		</div>
		</div>
	</div>
	</div>
		<%@include file="../footer.jsp"%>
</div>
</c:when>
<c:otherwise>
out.println("<script>alert('접근권한이 없습니다.');history.back();</script>");
</c:otherwise>
</c:choose>
<script>
	function registBtn(){
		if(document.getElementById('adName').value.trim()==''){
			alert('내용을 입력해주세요.');
			return false;
		}else{
			document.registForm.action = "<c:url value='/advertise/regist.do'/>";
			document.registForm.submit();
		}
	}

	$("#adImg").change(function() {
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