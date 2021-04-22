<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
input[type="text"]{
margin-left : 30px;
margin-right : 15px;
}
</style>
<c:choose>
<c:when test="${member.authority == 1 || member.authority == 3}">
<body>
<%@include file="../header.jsp"%>
<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>관리자-레시피</h2>
						</div>
					</div>
				</div>
			<hr />
				<%@include file="nav.jsp"%>
			<section id="container">
			<div class="col-lg-12 col-sm-12">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="recipeNum" name="recipeNum"
					value="${recipe.recipeNum}" /> <input type="hidden" id="page"
					name="page" value="${scri.page}"> <input type="hidden"
					id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword}">
			</form>

			<form name="modifyForm" role="form" method="post" autocomplete="off"
				enctype="multipart/form-data">

				<input type="hidden" name="recipeNum" value="${recipe.recipeNum}" />

				<div class="form-group">
					<label>카테고리</label>
										<select class="category1" name="recipeCateCode"style="margin-left:30px; height:30px;">
											<option value="밑반찬" ${recipe.recipeCateCode eq '밑반찬' ? 'selected' : ''}>밑반찬</option>
											<option value="국/탕" ${recipe.recipeCateCode eq '국/탕' ? 'selected' : ''}>국/탕</option>
											<option value="찌개" ${recipe.recipeCateCode eq '찌개' ? 'selected' : ''}>찌개</option>
											<option value="해물류" ${recipe.recipeCateCode eq '해물류' ? 'selected' : ''}>해물류</option>
											<option value="면" ${recipe.recipeCateCode eq '면' ? 'selected' : ''}>면</option>
											<option value="양식" ${recipe.recipeCateCode eq '영식' ? 'selected' : ''}>양식</option>
											<option value="샐러드" ${recipe.recipeCateCode eq '샐러드' ? 'selected' : ''}>샐러드</option>
											<option value="간식" ${recipe.recipeCateCode eq '간식' ? 'selected' : ''}>간식</option>
											<option value="볶음" ${recipe.recipeCateCode eq '볶음' ? 'selected' : ''}>볶음</option>
										</select>
									</div>

									<div class="form-group">
										<label for="recipeName">레시피명</label> <input type="text"
											id="recipeName" name="recipeName" value="${recipe.recipeName}" style="margin-left: 30px; width: 500px;" />
									</div>
									<div class="form-group">
										<label for="recipeStock">레시피수량</label> <input type="number"
											id="recipeStock" name="recipeStock" value="${recipe.recipeStock}" style="margin-left: 15px; width: 500px;" />
									</div>
									<div class="form-group" style="display: inline-block;">
									<label for="item">식재료목록</label> 
										<select class="category2" name="itemCateCode" style="margin-left:15px; height:30px;">
											<c:forEach var="result" items="${item}">
												<option value="${result.ingNum}">${result.ingName }</option>
											</c:forEach>
										</select>
										<button class = "btn hvr-hover" type="button" onclick="itemAddBtn()" >추가</button>
									</div>
									<div id="itemList">
										<input type='hidden' name='ingName1' value='${recipe.ingName1}'/>
										<input type='hidden' name='ingName2' value='${recipe.ingName2}'/>
										<input type='hidden' name='ingName3' value='${recipe.ingName3}'/>
										<input type='hidden' name='ingName4' value='${recipe.ingName4}'/>
										<input type='hidden' name='ingName5' value='${recipe.ingName5}'/>
										<input type='hidden' name='ingName6' value='${recipe.ingName6}'/>
										<input type='hidden' name='ingName7' value='${recipe.ingName7}'/>
										<input type='hidden' name='ingName8' value='${recipe.ingName8}'/>
										<input type='hidden' name='ingName9' value='${recipe.ingName9}'/>
										<input type='hidden' name='ingWeight1' value='${recipe.ingWeight1}'/>
										<input type='hidden' name='ingWeight2' value='${recipe.ingWeight2}'/>
										<input type='hidden' name='ingWeight3' value='${recipe.ingWeight3}'/>
										<input type='hidden' name='ingWeight4' value='${recipe.ingWeight4}'/>
										<input type='hidden' name='ingWeight5' value='${recipe.ingWeight5}'/>
										<input type='hidden' name='ingWeight6' value='${recipe.ingWeight6}'/>
										<input type='hidden' name='ingWeight7' value='${recipe.ingWeight7}'/>
										<input type='hidden' name='ingWeight8' value='${recipe.ingWeight8}'/>
										<input type='hidden' name='ingWeight9' value='${recipe.ingWeight9}'/>
										<input type='hidden' name='ingPrice1' value='${recipe.ingPrice1}'/>
										<input type='hidden' name='ingPrice2' value='${recipe.ingPrice2}'/>
										<input type='hidden' name='ingPrice3' value='${recipe.ingPrice3}'/>
										<input type='hidden' name='ingPrice4' value='${recipe.ingPrice4}'/>
										<input type='hidden' name='ingPrice5' value='${recipe.ingPrice5}'/>
										<input type='hidden' name='ingPrice6' value='${recipe.ingPrice6}'/>
										<input type='hidden' name='ingPrice7' value='${recipe.ingPrice7}'/>
										<input type='hidden' name='ingPrice8' value='${recipe.ingPrice8}'/>
										<input type='hidden' name='ingPrice9' value='${recipe.ingPrice9}'/>
									</div>
									<c:if test="${recipe.ingName1 != null and recipe.ingName1 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName1}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice1}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight1}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<c:if test="${recipe.ingName2 != null and recipe.ingName2 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName2}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice2}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight2}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<c:if test="${recipe.ingName3 != null and recipe.ingName3 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName3}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice3}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight3}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<c:if test="${recipe.ingName4 != null and recipe.ingName4 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName4}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice4}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight4}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<c:if test="${recipe.ingName5 != null and recipe.ingName5 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName5}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice5}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight5}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<c:if test="${recipe.ingName6 != null and recipe.ingName6 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName6}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice6}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight6}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<c:if test="${recipe.ingName7 != null and recipe.ingName7 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName7}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice7}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight7}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<c:if test="${recipe.ingName8 != null and recipe.ingName8 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName8}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice8}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight8}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<c:if test="${recipe.ingName9 != null and recipe.ingName9 != '' }">
										<div class='form-group'>
											식재료명 <input type='text' name='ingName' value='${recipe.ingName9}' readOnly="readonly"/>
											식재료가격 <input type='text' name='ingPrice' value='${recipe.ingPrice9}' readOnly="readonly"/>
											식재료무게 <input type='text' name='ingWeight' value='${recipe.ingWeight9}' readOnly="readonly"/>
											<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>
										</div>
									</c:if>
									<div class="form-group">
										<label for="recipePrice">레시피가격</label>
										<input type="number" id="recipePrice" name="recipePrice" value="${recipe.recipePrice}" style="margin-left: 15px; width: 500px;" readonly="readonly" />
									</div>
									
									<div class="form-group">
										<label for="recipeDes">상품소개</label>
										<br/>
										<textarea id="recipeDes" id="recipeDes" name="recipeDes"
											style="height: 500px; width: 100%">${recipe.recipeDes}</textarea>
										<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
										<script type="text/javascript">
											$(function() {
												var editor = CKEDITOR
														.replace(
																'recipeDes',
																{
																	height : '600px',
																	filebrowserUploadUrl : "<c:url value='/recipe/ckUpload.do'/>",
																	filebrowserImageUploadUrl : "<c:url value='/recipe/ckUpload.do'/>"
																});
											});
										</script>
									</div>
				<div class="form-group">
					<input type="file" id="recipeImg" name="file" />
					<div class="select_img">
						<img src="${pageContext.request.contextPath }/${recipe.recipeImg}" /> <input type="hidden"
							name="recipeImg" value="${recipe.recipeImg}" /> <input
							type="hidden" name="recipeThumbImg"
							value="${recipe.recipeThumbImg}" />
					</div>
					<script>
						$("#recipeImg").change(
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
				<div class="submit-button text-center" style="margin-top:100px;">
					<button type="button" onclick="registBtn()" class="btn hvr-hover" >저장</button>
					<button type="button" onclick="history.go(-1);" class="replyCancelBtn btn hvr-hover">취소</button>
				</div>
				</div>

			</form>
			</div>
			</section>
		</div>
		<%@include file="../footer.jsp"%>
<script>

	var regExp = /[^0-9]/gi;

	$("#recipePrice").keyup(function(){ numCheck($(this)); });
	$("#recipeStock").keyup(function(){ numCheck($(this)); });

	function numCheck(selector) {
		var tempVal = selector.val();
		selector.val(tempVal.replace(regExp, ""));
	}
	
	function itemAddBtn(){
		if(document.getElementsByName('ingName').length>8){
			alert('추가할 수 있는 식재료를 초과하였습니다.');
			return false;
		}
		$.ajax({
			type	: "post",
			url		: "<c:url value='/recipe/checkItemInfo.do'/>",
			dataType	: "json",
			data	: {
				n : document.getElementsByName('itemCateCode')[0].value
			},
			success : function(data){
				var str= "<div class='form-group'>";
				/* str			+= "식재료명 <input type='text' name='ingName" + document.getElementById('itemCnt').value +"' value='" + data.ingName + "' readOnly='true'/>"
							+ "식재료가격 <input type='text' name='ingPrice" + document.getElementById('itemCnt').value + "' value='" + data.ingPrice + "' readOnly='true'/>"
							+ "식재료무게 <input type='text' name='ingWeight" + document.getElementById('itemCnt').value + "' value='" + data.ingWeight + "' readOnly='true'/>"
							+ "<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button>"; */
				str			+= "식재료명 <input type='text' name='ingName' value='" + data.ingName + "' readOnly='true'/>"
							+ "식재료가격 <input type='text' name='ingPrice' value='" + data.ingPrice + "' readOnly='true'/>"
							+ "식재료무게 <input type='text' name='ingWeight' value='" + data.ingWeight + "' readOnly='true'/>"
							+ "<button type='button' onclick='cancelBtn(this)' class='btn hvr-hover'>삭제</button></div>";
					$('#itemList').append(str);
					//document.getElementById('itemCnt').value++;
					var recipePrice = parseInt(document.getElementById('recipePrice').value);
					recipePrice += parseInt(data.ingPrice);
					document.getElementById('recipePrice').value = recipePrice;
			}
		})
	}
	function registBtn(){
		var length = document.getElementsByName('ingName').length;
		for(var i=1; i<length+1; i++){
			document.getElementsByName(eval("'ingName" + i + "'"))[0].value = document.getElementsByName('ingName')[i-1].value;
			document.getElementsByName(eval("'ingWeight" + i + "'"))[0].value = document.getElementsByName('ingWeight')[i-1].value;
		}
		/* var item = [{name : "",
				 weight : ""
				}];
		for(var i=0; i<length; i++){
			item.push({
					name : document.getElementsByName('ingName')[i].value,
					weight : document.getElementsByName('ingWeight')[i].value
					});
		}
		
		for(var i=0; i<item.length; i++){
			document.getElementsByName(eval("'ingName" + i + "'"))[0].value = item[i].name;
			document.getElementsByName(eval("'ingWeight" + i + "'"))[0].value = item[i].weight;
		} */
		document.modifyForm.action = "<c:url value='/recipe/modify.do'/>"
		document.modifyForm.method = "post";
		document.modifyForm.submit();
	}
	
	function cancelBtn(tag) {
		var recipePrice = parseInt(document.getElementById('recipePrice').value);
		recipePrice -= parseInt(tag.parentNode.childNodes[3].value);
		document.getElementById('recipePrice').value = recipePrice;
		tag.parentNode.remove();
	}
</script>
</body>
</c:when>
<c:otherwise>
out.println("<script>alert('접근권한이 없습니다.');history.back();</script>");
</c:otherwise>
</c:choose>
</html>