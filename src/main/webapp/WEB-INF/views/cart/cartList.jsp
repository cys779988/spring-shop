<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.thumb{
	height : 200px;
	width : 200px;
}
section#content ul li img {
	width: 250px;
	height: 250px;
}

section#content ul li::after {
	content: "";
	display: block;
	clear: both;
}

section#content div.thumb {
	float: left;
	width: 250px;
}

section#content div.ingInfo {
	float: right;
	width: calc(100% - 270px);
}

section#content div.ingInfo {
	line-height: 2;
}

section#content div.ingInfo span {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 10px;
}

.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}

.checkBox {
	float: left;
	width: 50px;
}

.checkBox input {
	width: 16px;
	height: 16px;
}

.listResult {
	padding: 20px;
	background: #eee;
}

.listResult .sum {
	float: left;
	width: 45%;
	font-size: 22px;
}

.listResult .orderOpen {
	float: right;
	width: 45%;
	text-align: right;
}

.listResult::after {
	content: "";
	display: block;
	clear: both;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
	display: none;
}

.orderInfo .inputArea {
	margin: 10px 0;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

#userAddr2, #userAddr3 {
	width: 250px;
}

.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	background: #fff;
	margin-right: 20px;
}
</style>
</head>

<body>
	<%@include file="../header.jsp"%>
	<%@include file="../sidebar.jsp"%>
	<div class="container">
		<div class="all-title-box">
			<div class="row">
				<div class="col-lg-6">
					<h2>장바구니</h2>
				</div>
			</div>
		</div>
		<hr />
		<section id="content">
			<ul>
				<li>
					<div class="allCheck">
						<input type="checkbox" name="allCheck" id="allCheck" /><label
							for="allCheck">모두 선택</label>
					</div>
					<div class="submit-button text-right">
						<div class="delBtn">
							<button type="button" class="selectDelete_btn btn hvr-hover">선택삭제</button>
						</div>
					</div>

				</li>
			<c:choose>
				<c:when test="${fn:length(cartList) == 0}">
				<div class="border" style="text-align: center">
					<h3 style="margin-top: 30px; margin-bottom: 30px;">장바구니에 물품이 없습니다.</h3>
				</div>
				</c:when>
				<c:otherwise>
				<c:set var="sum" value="0" />
					<c:forEach items="${cartList}" var="cartList">
						<div class="border">
							<div class="checkBox">
								<input type="checkbox" name="chBox" class="chBox"
									data-cartNum="${cartList.cartNum}" />
							</div>
							<div class="row">
								<div class="thumb">
										<c:choose>
										<c:when test="${cartList.ingThumbImg eq null }">
											<img src="${pageContext.request.contextPath }/${cartList.recipeThumbImg}" style="width: 180px;" />
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath }/${cartList.ingThumbImg}" style="width: 180px;" />
										</c:otherwise>
										</c:choose>
									
								</div>
								<div class="ingInfo" style="margin-left: 20px;">
									<p>
										<span>상품명</span>
										<c:choose>
										<c:when test="${cartList.ingName ==null }">
										  ${cartList.recipeName}
										</c:when>
										<c:otherwise>
										  ${cartList.ingName}
										</c:otherwise>
										</c:choose>
										<br />
										<span>개당 가격</span>
										<c:choose>
										<c:when test="${cartList.ingPrice ==null }">
										 <fmt:formatNumber pattern="###,###,###" value="${cartList.recipePrice}" />원
										</c:when>
										<c:otherwise>
										  <fmt:formatNumber pattern="###,###,###" value="${cartList.ingPrice}" />원
										</c:otherwise>
										</c:choose>
										<br />
										<span>구입 수량</span>
										 ${cartList.cartStock} 개
										<br /> 
										<span>최종 가격</span>
										<c:choose>
										<c:when test="${cartList.ingPrice ==null }">
											<fmt:formatNumber pattern="###,###,###" value="${cartList.recipePrice * cartList.cartStock}" />원
										</c:when>
										<c:otherwise>
											<fmt:formatNumber pattern="###,###,###" value="${cartList.ingPrice * cartList.cartStock}" />원
										</c:otherwise>
										</c:choose>
									</p>
									<div class="submit-button text-right">
										<div class="delete">
											<button type="button"
												class="btn hvr-hover" onclick="deleteBtn()"
												data-cartNum="${cartList.cartNum}">삭제</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<c:set var="sum" value="${sum + (cartList.ingPrice * cartList.cartStock)}" />
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			</ul>
			<div class="listResult">
				<div class="sum">
					총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" /> 원
				</div>
				<div class="orderOpen">
					<button type="button" class="orderOpen_btn btn hvr-hover">주문 정보 입력</button>
				</div>
			</div>

			<div class="orderInfo">
				<form name="orderForm" role="form" method="post" autocomplete="off">

					<input type="hidden" name="amount" value="${sum}" />

					<div class="inputArea">
						<label for="">수령인</label> <input type="text" name="orderRec"
							id="orderRec" required="required" />
					</div>

					<div class="inputArea">
						<label for="orderPhone">수령인 연락처</label> <input type="number"
							name="orderPhone" id="orderPhone" required="required" />
					</div>

					<div class="inputArea">
						<label for="addr1">우편번호</label> <input type="number" id="zip"
							name="zip" placeholder="우편번호"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>
					<div class="inputArea">
						<label for="addr1">1차 주소</label> <input type="text" id="addr1"
							name="addr1" placeholder="주소"><br>
					</div>
					<div class="inputArea">
						<label for="addr1">2차 주소</label> <input type="text" id="addr2"
							name="addr2" placeholder="상세주소">
					</div>

					<div class="submit-button text-center">
						<button type="button" onclick="order()" class="btn hvr-hover">주문</button>

						<button type="button" class="cancel_btn btn hvr-hover">취소</button>
						<script>
							
						</script>
					</div>

				</form>
			</div>
		</section>
	</div>
	<%@include file="../footer.jsp"%>
<script>
	$(".chBox").click(function() {
		$("#allCheck").prop("checked", false);
	});
	$("#allCheck").click(function() {
		var chk = $("#allCheck").prop("checked");
		if (chk) {
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}
	});
	$(".selectDelete_btn").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?");

		if (confirm_val) {
			var checkArr = new Array();

			$("input[class='chBox']:checked").each(function() {
				checkArr.push($(this).attr("data-cartNum"));
			});

			$.ajax({
				url : "<c:url value='/cart/deleteCart.do'/>",
				type : "post",
				data : {
					chbox : checkArr
				},
				success : function(result) {
					if (result == 1) {
						location.href = "<c:url value='/cart/cartList.do'/>";
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	});
	function order(){
		document.orderForm.action = "<c:url value='/cart/order.do'/>"
		document.orderForm.method = "post";
		document.orderForm.submit();
	}
	function deleteBtn(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");

		var checkArr = new Array();
		$("input[name='chBox']:checked").each(
				function(){
				checkArr.push($(this).attr("data-cartNum"));
				});
		if(checkArr ==''){
			alert('해당항목을 선택해주세요.');
			return false;
		}
		if (confirm_val) {
			$.ajax({
				url : "<c:url value='/cart/deleteCart.do'/>",
				type : "post",
				data : {
					chbox : checkArr
				},
				success : function(result) {
					if (result == 1) {
						location.reload();
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	}
	$(".orderOpen_btn").click(function() {
		$(".orderInfo").slideDown();
		$(".orderOpen_bnt").slideUp();
	});

	$(".cancel_btn").click(function() {
		$(".orderInfo").slideUp();
		$(".orderOpen_bnt").slideDown();
	});

	/* $(".order_btn").click(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp95333439'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;

		    			alert(msg);
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;

		        alert(msg);
		    }
	}); */

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
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
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
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
</script>
</body>

</html>