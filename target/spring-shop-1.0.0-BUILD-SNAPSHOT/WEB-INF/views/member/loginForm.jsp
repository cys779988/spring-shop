<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<body>
	<%@include file="../header.jsp" %>
	<div id="page-wrapper">
      <div class="contact-box-main">

         <div class="container">

            <div class="row">
               <div class="container" style="width: 50%">
               <h2>로그인</h2>
                  <section id="loginFormArea">
                     <form name="loginForm" method="post">
                        <div class="row">
                           <div class="col-md-12">
                              아이디
                              <div class="form-group">
                                 <input type="text" class="form-control" id="userId" name="userId"
                                    placeholder="ID" style="width: 95%;"/>
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                           
                           <div class="col-md-12">
                              비밀번호
                              <div class="form-group">
                                 <input type="password" class="form-control" id="userPasswd"
                                    name="userPasswd" placeholder="Password" style="width: 95%;"/>
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                        </div>
	                    <div class="submit-button">
	                           <button class="login_btn btn hvr-hover" id="submit" type="submit" style="width: 91%">로그인</button>
	                    </div>
	                    <div class="submit-button" style="margin-top: 20px;">
	                     	<div style="display: inline-block; width: 30%;">
	                        	<button class="find_id_btn btn hvr-hover" type="submit" style="width: 100%">아이디찾기</button>
	                        </div>
	                        <div style="display: inline-block; width: 30%;">
	                        <button class="find_pw_btn btn hvr-hover" type="submit"
	                           style="margin-left: 10px; margin-right: 10px; width: 100%">비밀번호찾기</button>
	                        </div>
	                        <div style="display: inline-block; width: 30%;">
	                     	<button class="regist_btn btn hvr-hover" id="submit" type="submit"
	                              style="width: 100%">회원가입</button>
	                        </div>
	                    </div>
                        <c:if test="${msg == false }">
                           <p style="color:#f00;">로그인 실패</p>
                        </c:if>   
                     		</form>
                  		</section>
                     </div>
                  </div>
            </div>
         </div>
   </div>
<script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='loginForm']");
         
         $(".regist_btn").on("click", function(){
            formObj.attr("action", "<c:url value='/member/registForm.do'/>");
            formObj.attr("method", "get");
            formObj.submit();            
         });
     
         $(".login_btn").on("click", function(){
            formObj.attr("action", "<c:url value='/member/login.do'/>");
            formObj.attr("method", "post");
            formObj.submit();
         });
         
         $(".find_pw_btn").on("click", function(){
            formObj.attr("action", "<c:url value='/member/find_pw_form.do'/>");
            formObj.attr("method", "get");
            formObj.submit();            
         });
         $(".find_id_btn").on("click", function(){
            formObj.attr("action", "<c:url value='/member/find_id_form.do'/>");
            formObj.attr("method", "get");
            formObj.submit();            
         });
      })
</script>
<%@include file="../footer.jsp" %>
</body>
</html>