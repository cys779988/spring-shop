<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
section.replyForm {
	padding: 30px 0;
}

section.replyForm textarea {
	font-size: 15px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 100%;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.userInfo {
	
}

section.replyList div.userInfo .content {
	font-size: 24px;
	font-weight: bold;
}

.date {
	color: #999;
	display: inline-block;
	margin-left: auto;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
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
<body>
	<%@include file="../header.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
							<h2>공지사항</h2>
						</div>
					</div>
				</div>
			<hr />
			<div class="col-lg-12 col-sm-12">
				<%@include file="nav.jsp"%>
				<section id="container">
					<form name="readForm" role="form" method="post">
						<input type="hidden" id="nno" name="nno" value="${read.nno}" /> <input
							type="hidden" id="page" name="page" value="${scri.page}">
						<input type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}"> <input type="hidden"
							id="searchType" name="searchType" value="${scri.searchType}">
						<input type="hidden" id="keyword" name="keyword"
							value="${scri.keyword}">
					</form>
					<div class="form-group">
						<div class="col-lg-12 col-sm-12">
						<div class="row">
							<h2>${read.title}</h2>
							<div class="date"><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /></div>
						</div>
							<h4>작성자  -  ${read.writer}</h4>
						</div>
					</div>
					<div class="form-group" style="height: 500px; border: 1px solid;">
						<p> <c:out value="${read.content}" /> </p>
					</div>
					<div class="form-group">
							<img src="${pageContext.request.contextPath}/${read.nThumbImg}" class="thumbImg" />
						</div>
					<c:if test="${member.userId==read.writer}">
						<div class="submit-button text-center" style="margin-top:100px;">
							<button type="button" class="update_btn btn hvr-hover">수정</button>
							<button type="button" class="delete_btn  btn hvr-hover">삭제</button>
							<div class="clearfix"></div>
						</div>
					</c:if>

					<!-- 댓글 -->
					<div class="col-lg-12 col-sm-12" style="margin-top:100px;">
					<div id="reply">
						<input type="hidden" id="nno" name="nno" value="${read.nno}" /> <input
							type="hidden" id="page" name="page" value="${scri.page}">
						<input type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}"> <input type="hidden"
							id="searchType" name="searchType" value="${scri.searchType}">
						<input type="hidden" id="keyword" name="keyword"
							value="${scri.keyword}">

						<c:if test="${member == null }">
							<p>
								댓글을 남기시려면 <a href="/member/loginForm.do">로그인</a>해주세요
							</p>
						</c:if>

						<c:if test="${member != null}">
							<section class="replyForm">
								<form name="replyForm" method="post" class="form-horizontal"
									autocomplete="off">
									<input type="hidden" name="nno" value ="${read.nno }">
									<div class="input_area">
										<textarea rows="5" maxlength="200" name="content" id="content"></textarea>
									</div>
								<div class="submit-button text-center">
										<button type="button" class="replyWriteBtn btn hvr-hover">댓글작성</button>
									</div>

								</form>
							</section>
						</c:if>
						<section class="replyList">
							<ol>
								<c:forEach items="${replyList}" var="replyList">
									<div style = "border: 1px solid;">
										<div class="userInfo" >
											<span class="userId"style = "margin-left:10px;">${replyList.writer}</span> 
											<span class="date"><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></span>
											<button type="button" class="replyUpdateFormBtn btn hvr-hover" data-rno="${replyList.rno }">수정</button>
											<button type="button" class="replyDeleteBtn btn hvr-hover" data-rno="${replyList.rno }">삭제</button>
										</div>

										<div class="replyContent">${replyList.content}</div>
									</div>
								</c:forEach>
							</ol>
						</section>
					</div>
					</div>
				</section>
			</div>
			<hr />
		</div>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div>
    <section class="replyList">
		<div class="input_area">
				<input type="hidden" id="rno" value="">
				<textarea rows="5" cols="100" maxlength="200" id="replyContent" class="replyContent"> </textarea>
		</div>
	</section>
		<button type="button" class="replyUpdateBtn btn hvr-hover" data-rno="">저장</button>
		<button type="button" class="replyCancelBtn btn hvr-hover" data-rno="">취소</button>
    </div>
  </div>
</div>
		<%@include file="../footer.jsp"%>
<script>
$(document).ready(function() {
	var formObj = $("form[name='readForm']");
	// 수정 
	$(".update_btn").on("click", function() {
		formObj.attr("action", "<c:url value='/notice/updateView.do'/>");
		formObj.attr("method", "get");
		formObj.submit();
	})

	// 삭제
	$(".delete_btn").on("click", function() {

		var deleteYN = confirm("삭제하시겠습니까?");
		if (deleteYN == true) {

			formObj.attr("action", "<c:url value='/notice/delete.do'/>");
			formObj.attr("method", "post");
			formObj.submit();
		}
	})

	// 목록
	$(".list_btn").on("click",function() {
						location.href = "/notice/list.do?page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
					})

	$(".replyWriteBtn").on("click", function() {
		var formObj = $("form[name='replyForm']");
		formObj.attr("action", "<c:url value='/notice/replyWrite.do'/>");
		formObj.submit();
	});

	$(".replyUpdateFormBtn").on("click",function() {
		$.ajax({
			type : "POST",
			url : "<c:url value='/notice/replyUpdateForm.do'/>",
			dataType : "json",
			data : {
				"rno" : $(this).attr("data-rno"),
				"nno" : document.getElementsByName('nno')[0].value
			},
			success : function(data) {
				$("#myModal").show();
				document.getElementById('rno').value = data.rno;
				document.getElementById('replyContent').value = data.content;
			}
		})
	});
	
	$(".replyUpdateBtn").on("click",function() {
		if(document.getElementById('replyContent').value.trim == ""){
			alert('댓글을 입력해 주세요.');
			return false;
		}else{
			var confirm_val = confirm('수정하시겠습니까?');
			if (confirm_val) {
				$.ajax({
					type : "POST",
					url : "<c:url value='/notice/replyUpdate.do'/>",
					data : {
						"rno" : document.getElementById('rno').value,
						"content" : document.getElementById('replyContent').value
					},
					success : function(data) {
						location.reload();
					}
				})
			}
		}
	});
	
	$(".replyCancelBtn").on("click",function() {
		$("#myModal").hide();
	});
	
	//댓글 삭제 View
	$(".replyDeleteBtn").on("click",function() {
		var confirm_val = confirm('삭제하시겠습니까?');
		if (confirm_val) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/notice/replyDelete.do'/>",
				data : {
					"rno" : $(this).attr("data-rno"),
					"nno" : document.getElementsByName('nno')[0].value
				},
				dataType : "json",
				success : function(data) {
					alert('댓글이 삭제되었습니다.');
					location.reload();
				}
			})

		}
	});
})
</script>

</body>

</html>
