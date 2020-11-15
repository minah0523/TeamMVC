<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/teststyle.css">
<link rel="stylesheet" type="text/css" href="css/smoothproducts.css">

</head>
<body>
	<!-- Jquery V.3.3.1 -->

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/smoothproducts.min.js"></script>
	<script type="text/javascript">
	
		$(function() {

			$(".otherInfoBody").hide();
			$(".otherInfoHandle").click(function() {
				$(".otherInfoBody").slideToggle();
			});
			$(".closeBtn").click(function() {
				$("body").css("overflow", "visible");
				$(".loginBox").slideUp();
			});
			$(".productViewBtn").click(function(e) {
				e.preventDefault();
				$("body").css("overflow", "hidden");
				$(".productViewBox").slideDown();
			});
			$(".productViewBox-closeBtn").click(function() {
				$("body").css("overflow", "visible");
				$(".productViewBox").slideUp();
			});
			$(".sp-wrap").smoothproducts();
		});
	</script>

	<jsp:include page="/WEB-INF/header.jsp" />

<div class ="product-detail">
	<div class="container">
		<div class="product-detail-left">
		<div  class="sp-wrap">
		<c:forEach var="pdvo" items="${ productList }" varStatus="status">
			 
			<c:if test="${ status.index == 0 }">
				
					<!--  <li data-target="#ProductDetail_info"></li>-->

				<div class="ProductDetail_left" >
					
					<img src="<%= ctxPath%>/images/${ pdvo.pdimage1 }"
						style="width: 500px; height: 500px; float: left; max-width: inherit;" >
						
					<img src="<%= ctxPath%>/images/${ pdvo.pdimage2 }"
						style="width: 100px; height: 100px; float: left; max-width: inherit;" >
				</div>
			</c:if>
		</c:forEach>
		</div>
		</div>
	</div>
</div>



	<!-- Product Detail Page Start -->
	<div class="product-detail">
		<div class="container">
			<div class="product-detail-left">
				<div class="sp-wrap">
					<a href="/images/1_1.jpg"> <img src="/images/1_2.jpg" alt=""></a>
				</div>
			</div>


			<div class="product-detail-right">
				<h3>
					wappen_zip_up_hoodie <br> <small>Code : ABC0001</small>
				</h3>
				<h5>
					<b>가격 : </b> &#8361; 54,321
				</h5>
				<h5>
					<b>브랜드: </b> Mark Gonzales
				</h5>
				<h5>
					<b>색상 : </b> BLACK
				</h5>
				<h5>
					<b>배송비 : </b> 무료
				</h5>
				<h5>
					<b>사이즈 : </b> S/M/L/XL
				</h5>
				<h5>
					<b>구매가능여부 : </b> 가능
				</h5>
				<a href="#" class="addtocart"><i class="fas fa-heart"></i> 장바구니</a>
				<a href="#" class="writereview"><i class="fas fa-pen"></i> 리뷰작성</a>
				<br> <a href="#" class="buynow"><i class="fas fa-shopping-cart"></i> 구매하기</a>
			</div>

			<div class="product-detail-feature">
				<h3>상품상세정보</h3>
				<p>브랜드 : Mark Gonzales</p>
				<p>사이즈 : FREE</p>
				<p>색상 : Black, Gray</p>
				<p>남녀공용</p>
				<a href="/images/53_1.jpg"> 
				<img src="/images/53_2.jpg" alt=""></a>
			</div>

		</div>
	</div>
	<!-- Product Detail Page End -->


	<!-- Product View Box / Quick Product View Start -->
	<div class="productViewBox">
		<h3>wappen_zip_up_hoodie</h3>
		<div class="productViewBox-closeBtn">
			<i class="fas fa-times"></i>
		</div>
		<div class="productViewBoxImg">
			<img src="images/5.jpg">
		</div>
		<div class="productViewBoxDetail">
			<h5>
				<b>제품코드 : </b> GA000006488
			</h5>
			<h5>
				<b>가격 : </b> <i class="fas fa-dollar-sign"></i> 598
			</h5>
			<h5>
				<b>브랜드 : </b> Mark Gonzales
			</h5>
			<h5>
				<b>배송비 : </b> Free
			</h5>
			<h5>
				<b>구매가능여부 : </b> 가능
			</h5>
			<a href="#" class="addtocart"><i class="fas fa-heart"></i> 장바구니</a> 
			<a href="#" class="writereview"><i class="fas fa-pen"></i> 리뷰작성</a> 
			<a href="#" class="buynow"><i class="fas fa-shopping-cart"></i>
				결제하기</a>
		</div>
	</div>
	<!-- Product View Box / Quick Product View End -->

	<!-- Page Center Bar -->
	<div class="pagecenterbar">
		<div class="container">
			<h3>Page Center Bar</h3>
			<div class="pagecenterbarInner">
				<a href="#">상품구매</a> <a href="#">리뷰</a> <a href="#">좋아요</a>
			</div>
		</div>
	</div>
	<!-- Page Center Bar -->

	<!-- Other Information start -->
	<div class="otherInfo">
		<div class="container">
			<h3 class="otherInfoHandle">상세 정보 더보기</h3>
			<div class="otherInfoBody">
				<p>상세정보글1</p>
				<p>상세정보글2</p>
				<p>상세정보글3</p>
			</div>
		</div>
	</div>
	<!-- Other Information end -->

</body>
</html>


<jsp:include page="/WEB-INF/footer.jsp" />