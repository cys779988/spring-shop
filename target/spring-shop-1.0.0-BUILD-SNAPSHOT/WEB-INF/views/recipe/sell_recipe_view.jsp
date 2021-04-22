<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.recipeReplyList {
	padding: 30px 0;
}

section.recipeReplyList ol {
	padding: 0;
	margin: 0;
}

section.recipeReplyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.recipeReplyList div.userInfo .userId {
	font-size: 24px;
	font-weight: bold;
}

section.recipeReplyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.recipeReplyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}

div.replyModal {
	position: relative;
	z-index: 1;
	display: none;
}

div.modalBackground {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

div.modalContent {
	position: fixed;
	top: 20%;
	left: calc(50% - 250px);
	width: 500px;
	height: 250px;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

div.modalContent textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;
	height: 200px;
}

div.modalContent button.modal_cancel {
	margin-left: 20px;
}
</style>

<body>
	<%@include file="../header.jsp"%>
	<div class="container">
		<div class="all-title-box">
			<div class="row">
				<div class="col-lg-6">
					<div class="col-lg-7 col-sm-7">
						<h2>레시피판매페이지</h2>
					</div>
				</div>
			</div>
		</div>
	
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
				<input type="hidden" name="recipeNum" value="${sellRecipeView.recipeNum}" id="recipeNum" />
			</form>

			<div class="row">
				<div class="col-xl-7 col-lg-7 col-md-8">
					<div id="carousel-example-1"
						class="single-product-slider carousel slide" data-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<img class="d-block w-75" src="${pageContext.request.contextPath }/${sellRecipeView.recipeImg}"
								class="thumbImg" />
						</div>
					</div>
				</div>

				<div class="single-product-details">
					<input type="hidden" name="n" value="${sellRecipeView.recipeNum}" />
					<h2>${sellRecipeView.recipeCateCode}- ${sellRecipeView.recipeName}</h2>

					<h5>
						<fmt:formatNumber value="${sellRecipeView.recipePrice}"
							pattern="###,###,###" />
						원
					</h5>
					<div class="form-group" style="border: 1px solid;">
						 식재료
						 <c:if test="${sellRecipeView.ingName1 != null}">
						 <br> ${sellRecipeView.ingName1}  :  ${sellRecipeView.ingWeight1} g/ml
						 </c:if>
						 <c:if test="${sellRecipeView.ingName2 != null}">
						 <br> ${sellRecipeView.ingName2}  :  ${sellRecipeView.ingWeight2} g/ml
						 </c:if>
						 <c:if test="${sellRecipeView.ingName3 != null}">
						 <br> ${sellRecipeView.ingName3}  :  ${sellRecipeView.ingWeight3} g/ml
						 </c:if>
						 <c:if test="${sellRecipeView.ingName4 != null}">
						 <br> ${sellRecipeView.ingName4}  :  ${sellRecipeView.ingWeight4} g/ml
						 </c:if>
						 <c:if test="${sellRecipeView.ingName5 != null}">
						 <br> ${sellRecipeView.ingName5}  :  ${sellRecipeView.ingWeight5} g/ml
						 </c:if>
						 <c:if test="${sellRecipeView.ingName6 != null}">
						 <br> ${sellRecipeView.ingName6}  :  ${sellRecipeView.ingWeight6} g/ml
						 </c:if>
						 <c:if test="${sellRecipeView.ingName7 != null}">
						 <br> ${sellRecipeView.ingName7}  :  ${sellRecipeView.ingWeight7} g/ml
						 </c:if>
						 <c:if test="${sellRecipeView.ingName8 != null}">
						 <br> ${sellRecipeView.ingName8}  :  ${sellRecipeView.ingWeight8} g/ml
						 </c:if>
						 <c:if test="${sellRecipeView.ingName9 != null}">
						 <br> ${sellRecipeView.ingName9}  :  ${sellRecipeView.ingWeight9} g/ml
						 </c:if>
						</div>
						<c:if test="${sellRecipeView.recipeStock >0}">
							<p class="cartStock"></p>
							<span>구입 수량</span>
							<button type="button" class="plus btn hvr-hover">+</button>
							<input type="number" class="numBox" min="1"
								max="${sellRecipeView.recipeStock}" value="1" style="text-align: center"
								readonly="readonly" />
							<button type="button" class="minus btn hvr-hover">-</button>
							<div style="margin-top: 10px;">
								<button type="button" class="addCart_btn btn hvr-hover">카트에 담기</button>
								<button type="button" class="btn hvr-hover" onclick="javascript:location.href='javascript:history.back()'">목록페이지</button>
							</div>
						</c:if>
						<c:if test="${sellRecipeView.recipeStock < 0}">
							<p>상품 수량이 부족합니다.</p>
						</c:if>
				</div>

			</div>
			<div class="col-xl-12">
				<h4>
					<br>Description
				</h4>
				<p>${sellRecipeView.recipeDes}</p>
			</div>

	<div id="reply" class="col-xl-12">
		<c:if test="${member == null }">
			<p>
				후기를 남기시려면 <a href="<c:url value='/member/loginForm.do'/>">로그인</a>해주세요
			</p>
		</c:if>

		<c:if test="${member != null}">
			<section class="replyForm">
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="recipeNum" value="${sellRecipeView.recipeNum}" id="recipeNum" >
					<div class="input_area">
						<textarea name="repCon" id="repCon" style="width: 100%"></textarea>
					</div>
					<div class="submit-button text-center">
						<button type="button" class="btn hvr-hover" id="reply_btn">후기 남기기</button>
					</div>
				</form>
			</section>
		</c:if>
	</div>


	<section class="recipeReplyList">
		<ol>
			<%-- <c:forEach items="${ingReplyList}" var="ingReplyList">

                     <li>
                        <div class="userInfo">
                           <span class="userId">${ingReplyList.userId}</span> <span
                              class="date"><fmt:formatDate
                                 value="${ingReplyList.repDate}" pattern="yyyy-MM-dd" /></span>
                        </div>
                        <div class="replyContent">${ingReplyList.repCon}</div>
                     </li>
                  </c:forEach> --%>
		</ol>
	</section>
	<hr />
		<div class="replyModal">
			<div class="modalContent">
				<div>
					<textarea class="modal_repCon" name="modal_repCon"></textarea>
				</div>
				<div>
					<button type="button" class="modal_modify_btn btn hvr-hover">수정</button>
					<button type="button" class="modal_cancel btn hvr-hover">취소</button>
				</div>
			</div>
			<div class="modalBackground"></div>
		</div>
	</div>


	<%@include file="../footer.jsp"%>
	
<script>
var formObj = $("form[role='form']");
$(document).ready(function() {
	replyList()
});

$(document).on("click", ".delete", function(){
	var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
	
	if(deleteConfirm){
		var data = {repNum : $(this).attr("data-repNum")};
		
		$.ajax({
			url : "<c:url value='/recipe/deleteRecipeReply.do'/>",
			type : "post",
			data : data,
			success : function(result){
			
			if(result == 1) {
			replyList();
			} else {
			alert("작성자 본인만 할 수 있습니다.");     
			}
			},
			error : function(){
			alert("로그인하셔야합니다.")
			}
		});
	}
});

function replyList(){
 var recipeNum = '${sellRecipeView.recipeNum}';
 $.getJSON("${pageContext.request.contextPath}/recipe/recipe_reply_List.do" + "?n=" + recipeNum, 
		 function(data){
			 var str = "";
			 
			 $(data).each(function(){
				  var repDate = new Date(this.repDate);
				  repDate = repDate.toLocaleDateString("ko-US")
				  
				  str += "<li data-repNum='" + this.repNum + "'>"
				    + "<div class='userInfo'>"
				    + "<span class='userId'>" + this.userId + "</span>"
				    + "<span class='date'>" + repDate + "</span>"
				    + "</div>"
				    + "<div class='replyContent'>" + this.repCon + "</div>"
				   
				    + "<c:if test='${member != null}'>"
				    
				    + "<div class='replyFooter'>"
				    + "<button type='button' class='modify btn hvr-hover' data-repNum='" + this.repNum + "'>수정</button>"
				    + "<button type='button' class='delete btn hvr-hover' data-repNum='" + this.repNum + "'>삭제</button>"
				    + "</div>"
				    
				    + "</c:if>"
				    
				    + "</li>";           
			 });
			$("section.recipeReplyList ol").html(str);
		});
}
	$(".plus").click(function(){
	 var num = $(".numBox").val();
	 var plusNum = Number(num) + 1;
	 
	 if(plusNum >= ${sellRecipeView.recipeStock}) {
	  $(".numBox").val(num);
	 } else {
	  $(".numBox").val(plusNum);          
	 }
	});

	$(".minus").click(function(){
	 var num = $(".numBox").val();
	 var minusNum = Number(num) - 1;
	 
	 if(minusNum <= 0) {
	  $(".numBox").val(num);
	 } else {
	  $(".numBox").val(minusNum);          
	 }
	});

  $("#modify_Btn").click(function() {
     formObj.attr("action", "<c:url value='/recipe/recipeModify.do'/>");
     formObj.attr("method", "get")
     formObj.submit();
  });

  $("#delete_Btn").click(function() {

     formObj.attr("action", "<c:url value='/recipe/sell_recipe_list.do'/>");
     formObj.submit();
  });

  $(".addCart_btn").click(function(){
  var recipeNum = $("#recipeNum").val();
  var cartStock = $(".numBox").val();
  var data = {
    recipeNum : recipeNum,
    cartStock : cartStock
    };
	  $.ajax({
		   url : "<c:url value='/cart/addCart.do'/>",
		   type : "post",
		   data : data,
		   success : function(result){
			    if(result == 1) {
			     alert("카트 담기 성공");
			     $(".numBox").val("1");
			    } else {
			     alert("회원만 사용할 수 있습니다.")
			     $(".numBox").val("1");
			    }
		   },
		   error : function(){
			    alert("카트 담기 실패");
		   }
	  });
 });
	$(document).on("click", ".modify", function(){
     /*  $(".replyModal").attr("style", "display:block;"); */
		$(".replyModal").fadeIn(200); 
		
		var repNum = $(this).attr("data-repNum");
		var repCon = $(this).parent().parent().children(".replyContent").text();
		
		$(".modal_repCon").val(repCon);
		$(".modal_modify_btn").attr("data-repNum", repNum);
	});
  
	$("#reply_btn").click(function(){
		 var recipeNum = $("#recipeNum").val();
		 var repCon = $("#repCon").val();
		 
		 var data = {
		   recipeNum : recipeNum,
		   repCon : repCon
		 };
		 
		 $.ajax({
			url : "<c:url value='/recipe/recipe_reply_write.do'/>",
			type : "post",
			data : data,
			success : function(){
			 replyList();
			 $("#repCon").val("");
			},
			error : function(xhr, status, error){
				alert('xhr : '+ xhr + ' status : ' + status + ' error : ' + error);
				console.log(xhr);
			}
		});
	});

	$(".modal_modify_btn").click(function(){
	    var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	    
	    if(modifyConfirm) {
	     var data = {
	        repNum : $(this).attr("data-repNum"),
	        repCon : $(".modal_repCon").val()
	       };  // ReplyVO 형태로 데이터 생성
	     
	     $.ajax({
	      url : "<c:url value='/recipe/modifyRecipeReply.do'/>",
	      type : "post",
	      data : data,
	      success : function(result){
	       
	       if(result == 1) {
	        replyList();
	        $(".replyModal").fadeOut(200);
	       } else {
	        alert("작성자 본인만 할 수 있습니다.");       
	       }
	      },
	      error : function(){
	       alert("로그인하셔야합니다.")
	      }
	     });
	    }
	    
	   });
	
	$(".modal_cancel").click(function(){
	   /* $(".replyModal").attr("style", "display:none;"); */
	    $(".replyModal").fadeOut(200); 
	   
});
</script>
</body>
</html>