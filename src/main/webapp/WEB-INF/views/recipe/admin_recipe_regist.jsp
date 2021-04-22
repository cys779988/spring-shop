<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<c:choose>
<c:when test="${member.authority == 1 || member.authority == 3}">
<style>
input[type="text"]{
margin-left : 30px;
margin-right : 15px;
}
</style>
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
			<div class="contact-box-main">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="contact-form-right">
								<form name="registForm" enctype="multipart/form-data">
									<div class="form-group">
										<label>카테고리</label>
										<select class="category1" name="recipeCateCode"style="margin-left:30px; height:30px;">
											<option value="밑반찬">밑반찬</option>
											<option value="국/탕">국/탕</option>
											<option value="찌개">찌개</option>
											<option value="해물류">해물류</option>
											<option value="면">면</option>
											<option value="양식">양식</option>
											<option value="샐러드">샐러드</option>
											<option value="간식">간식</option>
											<option value="볶음">볶음</option>
										</select>
									</div>

									<div class="form-group">
										<label for="recipeName">레시피명</label> <input type="text"
											id="recipeName" name="recipeName"
											style="margin-left: 30px; width: 500px;" />
									</div>
									<div class="form-group">
										<label for="recipeStock">레시피수량</label> <input type="number"
											id="recipeStock" name="recipeStock"
											style="margin-left: 15px; width: 500px;" />
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
										<input type='hidden' name='ingName1'/>
										<input type='hidden' name='ingName2'/>
										<input type='hidden' name='ingName3'/>
										<input type='hidden' name='ingName4'/>
										<input type='hidden' name='ingName5'/>
										<input type='hidden' name='ingName6'/>
										<input type='hidden' name='ingName7'/>
										<input type='hidden' name='ingName8'/>
										<input type='hidden' name='ingName9'/>
										<input type='hidden' name='ingWeight1'/>
										<input type='hidden' name='ingWeight2'/>
										<input type='hidden' name='ingWeight3'/>
										<input type='hidden' name='ingWeight4'/>
										<input type='hidden' name='ingWeight5'/>
										<input type='hidden' name='ingWeight6'/>
										<input type='hidden' name='ingWeight7'/>
										<input type='hidden' name='ingWeight8'/>
										<input type='hidden' name='ingWeight9'/>
										<input type='hidden' name='ingPrice1'/>
										<input type='hidden' name='ingPrice2'/>
										<input type='hidden' name='ingPrice3'/>
										<input type='hidden' name='ingPrice4'/>
										<input type='hidden' name='ingPrice5'/>
										<input type='hidden' name='ingPrice6'/>
										<input type='hidden' name='ingPrice7'/>
										<input type='hidden' name='ingPrice8'/>
										<input type='hidden' name='ingPrice9'/>
									</div>
									
									<div class="form-group">
										<label for="recipePrice">레시피가격</label>
										<input type="number" id="recipePrice" name="recipePrice" value="0" style="margin-left: 15px; width: 500px;" readonly="readonly"/>
									</div>
									
									<div class="form-group">
										<label for="recipeDes">상품소개</label>
										<br/>
										<textarea id="recipeDes" id="recipeDes" name="recipeDes"
											style="height: 500px; width: 100%"></textarea>
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
										<script>
											$("#recipeImg")
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
										<button type="button" onclick="registBtn()" class="btn hvr-hover" >저장</button>
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
				<%@include file="../footer.jsp"%>
<script>
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
		var item = [{name : "",
				 weight : ""
				}];
		var length = document.getElementsByName('ingName').length;
		for(var i=1; i<length+1; i++){
			document.getElementsByName(eval("'ingName" + i + "'"))[0].value = document.getElementsByName('ingName')[i-1].value;
			document.getElementsByName(eval("'ingWeight" + i + "'"))[0].value = document.getElementsByName('ingWeight')[i-1].value;
			document.getElementsByName(eval("'ingPrice" + i + "'"))[0].value = document.getElementsByName('ingPrice')[i-1].value;
		}
		/* for(var i=0; i<length; i++){
			item.push({
					name : document.getElementsByName('ingName')[i].value,
					weight : document.getElementsByName('ingWeight')[i].value
					});
		} */
		
		/* for(var i=0; i<item.length; i++){
			document.getElementsByName(eval("'ingName" + i + "'"))[0].value = item[i].name;
			document.getElementsByName(eval("'ingWeight" + i + "'"))[0].value = item[i].weight;
		} */
		document.registForm.action = "<c:url value='/recipe/recipeRegist.do'/>"
		document.registForm.method = "post";
		document.registForm.submit();
	}
	
	function cancelBtn(tag) {
		var recipePrice = parseInt(document.getElementById('recipePrice').value);
		recipePrice -= parseInt(tag.parentNode.childNodes[3].value);
		document.getElementById('recipePrice').value = recipePrice;
		//document.getElementById('itemCnt').value--;
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