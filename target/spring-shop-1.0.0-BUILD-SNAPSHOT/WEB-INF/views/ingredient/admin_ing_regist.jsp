<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<script src="/ckeditor/ckeditor.js"></script>
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
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="contact-form-right">
									<form action="<c:url value='/ingredient/ingRegister.do'/>" method="post" enctype="multipart/form-data">

										<div class="form-group" style="display: inline-block;">
											<label>카테고리</label> <select class="category1"
												name="ingCateCode"style="height:30px;">
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
											<label for="gdsName">상품명</label> <input type="text"
												id="ingName" name="ingName"
												style="width: 350px;" />
										</div>

										<div class="form-group">
											<label for="gdsPrice">상품가격</label> <input type="number"
												id="ingPrice" name="ingPrice"
												style="width: 500px;" />
										</div>

										<div class="form-group">
											<label for="gdsStock">상품수량</label> <input type="number"
												id="ingStock" name="ingStock"
												style="width: 500px;" />
										</div>

										<div class="form-group">
											<label for="gdsStock">상품중량</label> <input type="number"
												id="ingWeight" name="ingWeight"
												style="width: 500px;" />
										</div>
										<div class="form-group">
											<label for="ingDes">상품소개</label>
											<br/>
											<textarea id="ingDes" id="ingDes" name="ingDes"
												style="height: 500px; width: 100%"></textarea>
											<script>
												var ckeditor_config = {
													resize_enaleb : false,
													enterMode : CKEDITOR.ENTER_BR,
													shiftEnterMode : CKEDITOR.ENTER_P,
													filebrowserUploadUrl : "${pageContext.request.contextPath}/ingredient/ckUpload.do"
												};

												CKEDITOR.replace("ingDes", ckeditor_config);
											</script>
										</div>
										<div class="form-group">
											<input type="file" id="ingImg" name="file" />
											<script>
												$("#ingImg")
														.change(
																function() {
																	if (this.files
																			&& this.files[0]) {
																		var reader = new FileReader;
																		reader.onload = function(
																				data) {
																			$(
																					".select_img img")
																					.attr(
																							"src",
																							data.target.result)
																					.width(
																							500);
																		}
																		reader
																				.readAsDataURL(this.files[0]);
																	}
																});
											</script>
											<%-- 	<%=request.getRealPath("/")%> --%>
										<div class="submit-button text-center">
											<button class = "btn hvr-hover" type="submit" >등록</button>
											<button type="button" onclick="history.go(-1);" class="replyCancelBtn btn hvr-hover">취소</button>
										</div>
										</div>

									</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			var regExp = /[^0-9]/gi;

			$("#ingPrice").keyup(function() {
				numCheck($(this));
			});
			$("#ingStock").keyup(function() {
				numCheck($(this));
			});

			function numCheck(selector) {
				var tempVal = selector.val();
				selector.val(tempVal.replace(regExp, ""));
			}
		</script>
		<%@include file="../footer.jsp"%>
</body>
</c:when>
<c:otherwise>
out.println("<script>alert('접근권한이 없습니다.');history.back();</script>");
</c:otherwise>
</c:choose>
</html>