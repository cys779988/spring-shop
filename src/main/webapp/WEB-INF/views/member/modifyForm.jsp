<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- Basic -->

<head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<c:choose>
<c:when test="${member != null}">
<body>
	<%@include file="../header.jsp"%>
	<div id="page-wrapper">
		<%@include file="../sidebar.jsp"%>
			<div class="contact-box-main">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-sm-12">
							<div class="contact-form-right">
								<h2>회원정보수정</h2>
								<p>회원정보 양식을 입력해주세요</p>

								<form action="${pageContext.request.contextPath}/member/modify.do" method="post">
									<div class="row">

										<div class="col-md-12">
											아이디
											<div class="form-group">
												<input type="text" class="form-control" id="userId"
													name="userId" value="${member.userId }" readonly>
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											이름
											<div class="form-group">
												<input type="text" class="form-control" id="userName"
													name="userName" value="${member.userName }" readonly>
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											비밀번호
											<div class="form-group">
												<input type="password" class="pw border" id="userPasswd"
													name="userPasswd" required data-error="비밀번호를 입력해주세요">
												<div class="help-block with-errors"></div>
												<span>8~15자리의 영문, 숫자, 특수문자의 입력이 가능합니다.</span>
											</div>
										</div>

										<div class="col-md-12">
											비밀번호확인
											<div class="form-group">
												<input type="password" class="pw border" id="passwd2" required
													data-error="비밀번호를 입력해주세요">
												<div class="help-block with-errors"></div>
												<span id="alert-success" style="display: none;">비밀번호가
													일치합니다.</span> <span id="alert-danger"
													style="display: none; color: #d92742; font-weight: bold;">비밀번호가
													일치하지 않습니다.</span>
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												휴대폰번호
												<div class="form-group">
													<input type="text" class="form-control" id="phoneNumber"
														name="phoneNumber" value="${member.phoneNumber }">
													<div class="help-block with-errors"></div>
												</div>
											</div>
										</div>

										<div class="col-md-12">
											비밀번호질문
											<div class="form-group">
												<select class="border" name="passwdQ" style="width: 400px; height: 35px;"
													value="${member.passwdQ }">

													<option value="none">선택</option>
													<option value="Q1">자신이 처음 살았던 동네는?</option>
													<option value="Q2">자신의 보물 1호는?</option>
													<option value="Q3">자신이 가장좋아하는 음식은?</option>
													<option value="Q4">자신이 가장좋아하는 운동은?</option>
													<option value="Q5">자신이 감명깊게 읽은 책은?</option>
												</select>
											</div>
										</div>

										<div class="col-md-12">
											비밀번호질문답변
											<div class="form-group">
												<input type="text" class="form-control" id="passwdA"
													name="passwdA" value="${member.passwdA }">
												<div class="help-block with-errors"></div>
											</div>
										</div>



										<div class="col-md-12">
											회원주소
											<div class="form-group">
											<input class="border" type="text" id="zip" name="zip"value="${member.zip }" placeholder="우편번호">
											<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											<input class="border" type="text" id="addr1" name="addr1" value="${member.addr1 }" style="width:249px;" maxlength="50" placeholder="주소"><br>
											<input class="border" type="text" id="addr2" name="addr2" value="${member.addr2 }" style="width:249px;" maxlength="50" placeholder="상세주소">
											</div>
										</div>
										<div class="col-md-12">
											생년월일
											<div class="form-group">
												<input type="text" class="form-control" id="birthday"
													name="birthday" value="${member.birthday }" required
													data-error="생년월일을 입력해주세요" placeholder="  ex) 19941211">

												<div class="help-block with-errors"></div>
											</div>
										</div>

										<div class="col-md-12">
											이메일
											<div class="form-group">
												<input class="border" type="email" id="email" name="email"
													value="${member.email }" required data-error="이메일을 입력해주세요"
													placeholder="  ex) shop@gmail.com">

												<div class="help-block with-errors"></div>
											</div>
											<div class="submit-button text-center">
												<button class="btn hvr-hover" id="submit" type="submit"
													style="margin-right: 10px">수정</button>
												<button class="btn hvr-hover" id="submit" type="submit"
													onclick="cancel();" style="margin-left: 10px">취소</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div id="msgSubmit" class="h3 text-center hidden"></div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>

		<%@include file="../footer.jsp"%>
	</div>

<script>
	$('.pw').focusout(function() {
		var pwd1 = $("#userPasswd").val();
		var pwd2 = $("#passwd2").val();

		if (pwd1 != '' && pwd2 == '') {
			null;
		} else if (pwd1 != '' || pwd2 != '') {
			if (pwd1 == pwd2) {
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
			} else {
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block');
				return false;
			}
		}
	});
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip').value = data.zonecode;
				document.getElementById("addr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr2").focus();
			}
		}).open();
	}

	function cancel() {
		location.href = "<c:url value='/cart/orderList.do'/>";
	}
</script>
</body>
</c:when>
<c:otherwise>
out.println("<script>alert('로그인 하신 후에 사용해주세요.');
location.herf='${pageContext.request.contextPath}/member/loginForm.do'</script>");
</c:otherwise>
</c:choose>
</html>