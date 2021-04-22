<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

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

section.ingReplyList {
	padding: 30px 0;
}

section.ingReplyList ol {
	padding: 0;
	margin: 0;
}

section.ingReplyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.ingReplyList div.userInfo .userId {
	font-size: 24px;
	font-weight: bold;
}

section.ingReplyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.ingReplyList div.replyContent {
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
    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 40px;
        border: 1px solid #888;
        width: 66%; /* Could be more or less, depending on screen size */    
        text-align:center;
        font-size:14px;
    }
    .modal-content table{margin:0 auto;}
    .modal-content th{font-weight:900;}
</style>
</head>



<body>
	<%@include file="../header.jsp"%>
	<div class="container">
		<div class="all-title-box">
			<div class="row">
				<div class="col-lg-6">
					<div class="col-lg-10 col-sm-10">
						<h2>식재료판매페이지</h2>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<form name="readForm" role="form" method="post">
			<input type="hidden" name="n" value="${ingredient.ingNum}" /> <input
				type="hidden" id="page" name="page" value="${scri.page}"> <input
				type="hidden" id="perPageNum" name="perPageNum"
				value="${scri.perPageNum}"> <input type="hidden"
				id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword"
				value="${scri.keyword}">
		</form>



		<form role="form" method="post">
			<input type="hidden" name="ingNum" value="${sellIngView.ingNum}" id="ingNum" />
		</form>
		<div class="row">
			<div class="col-xl-7 col-lg-7 col-md-8">
				<div id="carousel-example-1"
					class="single-product-slider carousel slide" data-ride="carousel">
					<div class="carousel-inner" role="listbox">
						<img class="d-block w-75"
							src="${pageContext.request.contextPath }/${sellIngView.ingImg}"
							class="thumbImg" />
					</div>
				</div>
			</div>

			<div class="single-product-details">
				<input type="hidden" name="n" value="${ingredient.ingNum}" />
				<h2>${sellIngView.ingCateCode}-${sellIngView.ingName}</h2>

				<h5>
					<fmt:formatNumber value="${sellIngView.ingPrice}"
						pattern="###,###,###" />
					원
				</h5>
				<p class="available-stock"></p>
				stock : <span> ${sellIngView.ingStock}개 <br>weight :
					${sellIngView.ingWeight}g/ml
				</span>
				<c:if test="${sellIngView.ingStock >0}">
					<p class="cartStock"></p>
					<span>구입 수량</span>
					<button type="button" class="plus btn hvr-hover">+</button>
					<input type="number" class="numBox" min="1"
						max="${sellIngView.ingStock}" value="1" style="text-align: center"
						readonly="readonly" />
					<button type="button" class="minus btn hvr-hover">-</button>
					<div style="margin-top: 10px;">
						<button type="button" class="addCart_btn btn hvr-hover">카트에
							담기</button>
						<button type="button" class="btn hvr-hover"
							onclick="javascript:location.href='javascript:history.back()'">목록페이지</button>
					</div>
				</c:if>
				<c:if test="${sellIngView.ingStock == 0}">
					<p>상품 수량이 부족합니다.</p>
				</c:if>
			</div>

		</div>
		<div class="col-xl-12">
			<h4>
				<br>Description
			</h4>
			<p>${sellIngView.ingDes}</p>
		</div>
		<div id="reply" class="col-xl-12">

			<c:if test="${member == null }">
				<p>
					후기를 남기시려면 <a href="/member/loginForm">로그인</a>해주세요
				</p>
			</c:if>

			<c:if test="${member != null}">
				<section class="replyForm">
					<form role="form" method="post" autocomplete="off">

						<input type="hidden" name="ingNum" value="${sellIngView.ingNum}">

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


		<section class="ingReplyList">
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
	</div>
	<div id="myModal" class="modal">
	
	  <!-- Modal content -->
	  <div class="modal-content">
	    <div>
	    <section class="replyList">
			<div class="input_area">
					<input type="hidden" id="rno" value="">
					<textarea rows="5" cols="100" maxlength="200" id="replyContent" class="repCon"> </textarea>
			</div>
		</section>
			<button type="button" class="modal_modify_btn btn hvr-hover" data-repNum="">저장</button>
			<button type="button" class="modal_cancel btn hvr-hover" data-repNum="">취소</button>
	    </div>
	  </div>
	</div>
	<%@include file="../footer.jsp"%>

<script>
$(document).ready(function() {
	replyList();
});

$(".plus").click(function(){
	   var num = $(".numBox").val();
	   var plusNum = Number(num) + 1;
	   
	   if(plusNum >= ${sellIngView.ingStock}) {
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
	  
$(".addCart_btn").click(function(){
	  var ingNum = $("#ingNum").val();
	  var cartStock = $(".numBox").val();
	  var data = {
	    ingNum : ingNum,
	    cartStock : cartStock
	    };
	  
	  $.ajax({
	   url : "<c:url value='/cart/addCart.do'/>",
	   type : "post",
	   data : data,
	   success : function(result){
	    
	    if(result == 1) {
	     alert("카트 담기 성공");
	     location.reload();
	    } else {
	     alert("회원만 사용할 수 있습니다.")
	    }
	   },
	   error : function(){
	    alert("카트 담기 실패");
	   }
	  });
	 });
	 

var formObj = $("form[role='form']");

$("#modify_Btn").click(function() {
   formObj.attr("action", "<c:url value='/ingredient/ingModify.do'/>");
   formObj.attr("method", "get")
   formObj.submit();
});

$("#delete_Btn").click(function() {

   formObj.attr("action", "<c:url value='/ingredient/sell_ing_list.do'/>");
   formObj.submit();

});

	$("#reply_btn").click(function(){
		 var ingNum = $("#ingNum").val();
		 var repCon = $("#repCon").val();
		 
		 var data = {
		   ingNum : ingNum,
		   repCon : repCon
		   };
		 
		 $.ajax({
			   url : "<c:url value='/ingredient/ing_reply_write.do'/>",
			   type : "post",
			   data : data,
			   success : function(){
			    replyList();
			    $("#repCon").val("");
			   }
		 });
	 });
	 
$(document).on("click", ".modify", function(){
      $(".modal").fadeIn(200); 
     
     var repNum = $(this).attr("data-repNum");
     var repCon = $(this).parent().parent().children(".replyContent").text();
     
     $(".repCon").val(repCon);
     $(".modal_modify_btn").attr("data-repNum", repNum);
     
    });
 

$(document).on("click", ".delete", function(){
	  var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
	  
	  if(deleteConfirm){
	  var data = {repNum : $(this).attr("data-repNum")};
	   
	  $.ajax({
	   url : "<c:url value='/ingredient/deleteIngReply.do'/>",
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
 var ingNum = '${sellIngView.ingNum}';
 $.getJSON("${pageContext.request.contextPath}/ingredient/ing_reply_List.do" + "?n=" + ingNum,
		 function(data){
			var str = "";
			
			$(data).each(function(){
			 var repDate = new Date(this.repDate);
			 repDate = repDate.toLocaleDateString("ko-US")
			 
			 str += "<li data-repNum='" + this.repNum + "'>"
			   + "<div class='userInfo'>"
			   + "<span class='userId'>" + this.userId + "</span>"
			   + "<span class='date'>" + repDate + "</span>"
			   + "<c:if test='${member != null}'>"
			   + "<button type='button' class='modify btn hvr-hover' data-repNum='" + this.repNum + "'>수정</button>"
			   + "<button type='button' class='delete btn hvr-hover' data-repNum='" + this.repNum + "'>삭제</button>"
			   + "</c:if>"
			   + "</div>"
			   + "<div class='replyContent'>" + this.repCon + "</div>"
			   
			   + "</li>";           
			});
			
			$("section.ingReplyList ol").html(str);
		});
}

$(".modal_modify_btn").click(function(){
    var modifyConfirm = confirm("정말로 수정하시겠습니까?");
    
    if(modifyConfirm) {
     var data = {
        repNum : $(this).attr("data-repNum"),
        repCon : $(".repCon").val()
       };
     
     $.ajax({
      url : "<c:url value='/ingredient/modifyIngReply.do'/>",
      type : "post",
      data : data,
      success : function(result){
       
       if(result == 1) {
        replyList();
        $(".modal").fadeOut(200);
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
    $(".modal").fadeOut(200); 
   
});
</script>
</body>
</html>