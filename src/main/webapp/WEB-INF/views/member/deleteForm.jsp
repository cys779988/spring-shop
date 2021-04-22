<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body>
	<%@include file="../header.jsp" %>
	<div id="page-wrapper">
	<%@include file="../sidebar.jsp" %>
	<div class="contact-box-main">

		<div class="container">

			<div class="row">
				<div class="container" style="width: 50%">
					<div class="contact-form-right">
						<h2>회원탈퇴</h2>
						<section id="loginFormArea">
							<form action="<c:url value='/member/memberDelete.do'/>" method="post" id="delForm">
								<div class="row">
									<div class="col-md-12">
										이름
										<div class="form-group">
											<input type="text" class="form-control" id="userName" name="userName"
												value="${member.userName }" readonly>
											<div class="help-block with-errors"></div>
										</div>
									</div>
									<div class="col-md-12">
										아이디
										<div class="form-group">
											<input type="text" class="form-control" id="userId" name="userId"
												value="${member.userId }" readonly />
											<div class="help-block with-errors"></div>
										</div>
									</div>

									<div class="col-md-12">
										비밀번호
										<div class="form-group">
											<input type="password" class="form-control" id="userPasswd"
												name="userPasswd" placeholder="password">
											<div class="help-block with-errors"></div>
										</div>
									</div>

								</div>
							</form>


  						<div class="submit-button text-center">
							<button type="submit" class="btn hvr-hover" id="submit">회원탈퇴</button>
							<button type="submit" class="btn hvr-hover" onclick="cancel();" id="cancel">취소</button>
						</div>

						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
			<%@include file="../footer.jsp" %>
</div>
<script>
	function cancel() {
		location.href = "${pageContext.request.contextPath}/cart/orderList.do";
	}

	$(document).ready(function() {

		$("#submit").on("click", function() {
			if ($("#userPasswd").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPasswd").focus();
				return false;
			}
			$.ajax({
				url : "<c:url value='/member/passChk.do'/>",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success : function(data) {
					if (data == 0) {
						alert("패스워드가 틀렸습니다.");
						return;
					} else {
						if (confirm("회원탈퇴하시겠습니까?")) {
							$("#delForm").submit();
						}

					}
				}
			})

		});

	})
</script>
</body>

</html>