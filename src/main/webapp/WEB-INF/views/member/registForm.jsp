<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
<%@include file="../header.jsp" %>
	<div id="page-wrapper">
	<div class="contact-box-main">

		<div class="container">

			<div class="row">
				<div class="col-lg-8 col-sm-12">
					<div class="contact-form-right">
						<h2>회원가입</h2>
						<p>회원정보 양식을 입력해주세요</p>

						<form action="<c:url value='/member/insert.do'/>" method="post" onsubmit="return checkAll()" >
							<div class="row">

								<div class="col-md-12">
									아이디
									<div class="form-group">
										<input type="text" class="form-control" id="userId" maxlength="10"
											name="userId" required data-error="아이디를 입력해주세요">
										<input type="button" class="btn btn-default" style="width: 20%;"
											onclick="fn_idChk();" value="아이디중복확인">
											<span>4~12자의 영문 대소문자와 숫자로만 입력</span>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="col-md-12">
									이름
									<div class="form-group">
										<input type="text" class="form-control" id="userName" maxlength="10"
											name="userName" required data-error="이름을 입력해주세요">
										<div class="help-block with-errors"></div>
									</div>
								</div>

								<div class="col-md-12">
									비밀번호
									<div class="form-group">
										<input type="password" class="pw border" id="userPasswd" maxlength="12"
											name="userPasswd" required data-error="비밀번호를 입력해주세요">
										<div class="help-block with-errors"></div>
										<span>4~12자의 영문 대소문자와 숫자로만 입력</span>
									</div>
								</div>

								<div class="col-md-12">
									비밀번호확인
									<div class="form-group">
										<input type="password" class="pw border" id="passwd2" required data-error="비밀번호를 입력해주세요" maxlength="12">
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
											<input type="text" class="form-control" id="phoneNumber" maxlength="11" placeholder="ex) 01012341234"
												name="phoneNumber" required data-error="휴대폰번호를 입력해주세요">
											<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									비밀번호질문
									<div class="form-group">
										<select class="border" name="passwdQ" style="width: 400px; height: 35px;">
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
										<input type="text" class="form-control" id="passwdA" maxlength="12"
											name="passwdA" required data-error="질문답변을 입력해주세요">
										<div class="help-block with-errors"></div>
									</div>
								</div>



								<div class="col-md-12">
								회원주소<br>
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
										<input type="text" class="form-control" id="birthday" maxlength="8" placeholder="ex) 19990101"
											name="birthday" required data-error="생년월일을 입력해주세요">

										<div class="help-block with-errors"></div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										이메일
										<div class="form-group">
											<input class="border" type="email" id="email" name="email" required data-error="이메일을 입력해주세요"
											placeholder="  ex) aaa@gmail.com"  maxlength="12"/>

											<div class="help-block with-errors"></div>
										</div>
										<div class="submit-button text-center">
											<button class="btn hvr-hover" id="submit" type="submit"
												style="margin-right: 10px">회원가입</button>
											<button class="btn hvr-hover" id="submit" type="submit"
												onclick="cancel();" style="margin-left: 10px">취소</button>
											<div id="msgSubmit" class="h3 text-center hidden"></div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</div>


	<a id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
<script>
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
		location.href = "<c:url value='/member/loginForm.do'/>";
	}

	function fn_idChk() {
		
		if(!$("#userId").val().trim()){
			alert('아이디를 입력해주세요.');
			return false;
		}
		$.ajax({
			url : "<c:url value='/member/idChk.do'/>",
			type : "post",
			dataType : "json",
			data : {
				"userId" : $("#userId").val().trim()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	function checkAll() {
          var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
          var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
          // 이메일이 적합한지 검사할 정규식
 
          var id = document.getElementById("userId");
          var pw = document.getElementById("userPasswd");
        
        
 
          // ------------ 이메일 까지 -----------
 
          if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
              return false;
          }
 
          if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
              return false;
          }
 
          if(join.userPasswd.value != join.passwd2.value) {
              alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
              join.passwd2.value = "";
              join.passwd2.focus();
              return false;
          }
       
 
    }
 
	function check(re, what, message) {
		if(re.test(what.value)) {
            return true;
        }
        alert(message);
        what.value = "";
        what.focus();
        //return false;
    }
</script>
</body>

</html>