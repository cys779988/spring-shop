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

	<!-- Start Cart  -->
		<div class="container">
		<div class="cart-box-main">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>마이페이지</h1>
						<p></p>
					</div>
					<div class="table-main table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>레시피이미지</th>
									<th>재료</th>
									<th>구매날짜</th>
									<th>수량</th>
									<th>가격</th>
									<th>배송상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="number">
										<p>1</p>
									</td>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/볶음밥.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> 볶음밥<br>밥100g 당근
											50g 버섯5g 식용유5m<br>설탕5g 간장5ml 양파10g <br>
											<p>4,000원</p>
									</a></td>
									<td class="price-pr">2020-12-11 <br> 12:25
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>1,400원</p>
									</td>
									<td class="remove-pr">
										<div style="background-color:">배송중</div>



									</td>
								</tr>
								<tr>
									<td class="number">
										<p>2</p>
									</td>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/김치찌개.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> 김치찌개<br>밥100g
											김치50g 파5g 버섯5g 설탕 5g<br>간장5ml 양파10g 돼지고기100g <br>
											<p>4,000원</p>
									</a></td>
									<td class="price-pr">2020-12-11 <br> 12:25
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>1,400원</p>
									</td>
									<td class="remove-pr">배송완료</td>
								</tr>
								<tr>
									<td class="number">
										<p>3</p>
									</td>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/김치찌개.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> 김치찌개<br>밥100g
											김치50g 파5g 버섯5g 설탕 5g<br>간장5ml 양파10g 돼지고기100g <br>
											<p>4,000원</p>
									</a></td>
									<td class="price-pr">2020-12-11 <br> 12:25
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>1,400원</p>
									</td>
									<td class="remove-pr">배송중</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../footer.jsp" %>
</div>

</body>

</html>