<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<c:choose>
<c:when test="${member.authority == 1 || member.authority == 3}">
<style>
label {
margin-left: 15px;
margin-right: 15px;
}
</style>
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
			<div class="contact-box-main">
			<div class="container">
			<div class="col-lg-12 col-sm-12">
			<div class="contact-form-right">
			<form name="readForm" role="form" method="post">
				<input type="hidden" name="ingNum" value="${ingredient.ingNum}" />
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			</form>

			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
				<input type="hidden" name="ingNum" value="${ingredient.ingNum}" />
				<div class="form-group" style="display: inline-block;">
					<label>카테고리</label>
					<select class="category1" name="ingCateCode" style="height:30px;">
						<option value="채소">채소</option>
						<option value="과일">과일</option>
						<option value="육류">육류</option>
						<option value="해산물">해산물</option>
						<option value="조미료">조미료</option>
						<option value="소스">소스</option>
						<option value="견과류">견과류</option>
						<option value="유제품">유제품</option>
						<option value="기타">기타</option>

					</select>
					<label for="ingName">상품명</label> <input type="text" id="ingName"
						name="ingName" value="${ingredient.ingName}" style="width: 350px;"/>
				</div>
				<div class="form-group">
					<label for="ingPrice">상품가격</label> <input type="text" id="ingPrice"
						name="ingPrice" value="${ingredient.ingPrice}" style="width: 500px;"/>
				</div>
				<div class="form-group">
					<label for="ingStock">상품수량</label> <input type="text" id="ingStock"
						name="ingStock" value="${ingredient.ingStock}" style="width: 500px;"/>
				</div>
				<div class="form-group">
					<label for="ingWeight">상품중량</label> <input type="text"
						id="ingWeight" name="ingWeight" value="${ingredient.ingWeight}" style="width: 500px;"/>
				</div>
				<div class="form-group">
					<label for="ingDes">상품소개</label>
					<textarea id="ingDes" name="ingDes" style="height: 500px; width: 100%;">${ingredient.ingDes}</textarea>
				</div>
						<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
						<script type="text/javascript">
							$(function() {
								var editor = CKEDITOR
										.replace(
												'ingDes',
												{
													height : '600px',
													filebrowserUploadUrl : "<c:url value='/ingredient/ckUpload.do'/>",
													filebrowserImageUploadUrl : "<c:url value='/ingredient/ckUpload.do'/>"
												});
							});
						</script>
				<div class="form-group">
					<input type="file" id="ingImg" name="file" />
					<div class="select_img">
						<img src="${pageContext.request.contextPath}/${ingredient.ingImg}" /> <input type="hidden"
							name="ingImg" value="${ingredient.ingImg}" /> <input
							type="hidden" name="ingThumbImg"
							value="${ingredient.ingThumbImg}" />
					</div>
					<%-- <%=request.getRealPath("/")%> --%>
				<div class="submit-button text-center" style="margin-top:100px;">
					<button type="button" id="update_Btn" class="btn hvr-hover">저장</button>
					<button type="button" id="back_Btn" class="btn hvr-hover">취소</button>
				</div>
				</div>

			</form>
			</div>
			</div>
			</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
<script>
$("#ingImg").change(function() {
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

var regExp = /[^0-9]/gi;

$("#ingPrice").keyup(function(){ numCheck($(this)); });
$("#ingStock").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
	var tempVal = selector.val();
	selector.val(tempVal.replace(regExp, ""));
}

$(document).ready(function() {
						var formObj = $("form[role='form']");

						$("#update_Btn").click(function() {
							formObj.attr("action", "<c:url value='/ingredient/modify.do'/>");
							formObj.attr("method", "post")
							formObj.submit();
						});
						$("#back_Btn").click(function() {
							location.href = "<c:url value='/ingredient/admin_ing_view.do?n=${ingredient.ingNum}'/>";
						});
})

</script>
</body>
</c:when>
<c:otherwise>
out.println("<script>alert('접근권한이 없습니다.');history.back();</script>");
</c:otherwise>
</c:choose>
</html>