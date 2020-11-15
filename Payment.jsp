<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String ctxPath = request.getContextPath();
//			/MyMVC
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/style_dh.css">

<style>
	ul {
		padding: 0;
	}
	
	li{
		list-style-type: none;
	}
	
	#orderform > div.data > ul > li {
		margin: 0 auto;
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function() {
		//--------------------------------- 상품수량버튼 ---------------------------------//
		var datalength = $("div.data").length; 
		
		$("i.up").click(function() {
			
			var index = $("i.up").index(this);
			
			var $productpoint = $("input.productpoint").eq(index);
			const p_priceVal = $("input.p_price").eq(index).val();
			var amount = $("input:text[name=amountInput]").eq(index).val();
			
			amount = Number(amount) + 1;
			
			var finalPoint =  Number(p_priceVal)* 0.01 * amount;
			var finalPrice = Number( p_priceVal ) * amount; 
			
			$("input.productpoint").eq(index).val(finalPoint);
			$("input:text[name=amountInput]").eq(index).val(amount);
			$("input.totalprice").eq(index).val(finalPrice);
			
		<%--	
			var amountInput = $(this).parent().prev().val();
			var firstproductPoint = $(this).parent().parent().parent().next().find("input.productPoint").val();
			
			amountInput = parseInt(amountInput) + 1;
			
			var productPoint =(amountInput * parseInt(firstproductPoint)); 
			
			$(this).parent().prev().val(amountInput);
			$(this).parent().parent().parent().next().find("input.productPoint").val(productPoint);
		--%>	
		});
		
		$("i.down").click(function () {
			
			var index = $("i.down").index(this);
			
			var $productpoint = $("input.productpoint").eq(index);
			var p_priceVal = $("input.p_price").eq(index).val();
			var amount = $("input:text[name=amountInput]").eq(index).val();
			
			amount = Number(amount) - 1;
			
			if(amount < 0 ){
				alert("수량을 0이하로 입력하실수 없습니다. ");
				return false;
			}
			
			var finalPoint =  Number(p_priceVal)* 0.01 * amount;
			var finalPrice = Number( p_priceVal ) * amount;
			
			$("input.productpoint").eq(index).val(finalPoint);
			$("input:text[name=amountInput]").eq(index).val(amount);
			$("input.totalprice").eq(index).val(finalPrice);
			
		});
		//--------------------------------- 상품수량버튼  끝 ---------------------------------//
		
		//--------------------------------- 상품 전체 체크박스  ---------------------------------//
		$("input:checkbox[id=buyAllCheck]").click(function(){
        	var chk = $(this).is(":checked");//.attr('checked');
        	if(chk) {
        		$("input:checkbox[name=buy]").prop('checked', true);
        	}
        	else {
        		$("input:checkbox[name=buy]").prop('checked', false);
        	}
    	});
		
		
		$("input:checkbox[name=buy]").click(function() {
			var flag = false;
			// 개별 체크박스에서 해제를 하거나 모두 선택할경우 전체 체크박스의 변화
			$("input:checkbox[name=buy]").each(function() {
				var checkboxBoolean = $(this).prop("checked");
				
				if(!checkboxBoolean){
					flag = true;  // flag 상태를 바꾼다.
	                return false; // each를  break 한다.
				}
			});
			
			if(!flag) {
                // name 이 person인 모든 체크박스를 하나하나씩 체크유무를 검사를 마쳤을때
                // 모든 체크박스가 체크가 되어진 상태이라면 
                $("input:checkbox[id=buyAllCheck]").prop("checked", true);
                // "전체선택/전체해제 체크박스"에 체크를 해둔다.
             }
			else {
				$("input:checkbox[id=buyAllCheck]").prop("checked", false);
			}
		});
		
		
		//--------------------------------- 상품 전체 체크박스  끝 ---------------------------------//
		
		//--------------------------------- 추천상품(owl-carousel) ---------------------------------//
		var owl = $('.owl-carousel');
			
	    owl.owlCarousel({
	        items:3,                 // 한번에 보여줄 아이템 수
	        loop:true,               // 반복여부
	        margin:30,               // 오른쪽 간격
	        nav   : true,
	        navText:["<div class='nav-btn prev-slide'></div>","<div class='nav-btn next-slide'></div>"],
	        autoplay:true,           // 자동재생 여부
	        autoplayTimeout:1800,    // 재생간격
	        autoplayHoverPause:true  // 마우스오버시 멈출지 여부
	    });
		 $(".prev-slide").html('<i class="fa fa-chevron-left"></i>');
		 $(".next-slide").html('<i class="fa fa-chevron-right"></i>');
	    
		//--------------------------------- 추천상품(owl-carousel) 끝 ---------------------------------//
		
		//--------------------------------- 상품 개별삭제 ---------------------------------//
		$("button.deleteOne").click(function(evnet) {
			$(this).parent().parent().parent().remove();
		});
		//--------------------------------- 상품 개별삭제 끝---------------------------------//
		
		
		//--------------------------------- 다중 선택상품 삭제 ---------------------------------//
		$("button#selectDelete").click(function() {
			$("input:checkbox[name=buy]").each(function() {
				
				var checkboxBoolean = $(this).prop("checked");
				
				if(checkboxBoolean){
					$(this).parent().parent().parent().remove();
				}
			});
		});
		//--------------------------------- 다중 선택상품 삭제 끝 ---------------------------------//
		
		//--------------------------------- 장바구니 비우기 버튼---------------------------------//
		$("button#allDelete").click(function(){
			$("#orderform > div.data").remove();
			
		});	
		//--------------------------------- 장바구니 비우기 버튼 끝---------------------------------//
		
		//--------------------------------- 주소 불러오기 ---------------------------------//
		$("input:radio[id=load_address]").click(function() {
			$("input:text[id=name]").val("${sessionScope.loginuser.name}");
			$("input:text[id=postcode]").val("${sessionScope.loginuser.name}");
			$("input:text[id=address]").val("${sessionScope.loginuser.name}");
			$("input:text[id=mobile]").val("${sessionScope.loginuser.name}");
			$("input:text[id=deliveryMessage]").val("${sessionScope.loginuser.name}");
		//--------------------------------- 주소 불러오기 끝 ---------------------------------//
		
		//--------------------------------- 상품총액, 상품총수량 출력 ---------------------------------//
		
		var totalprice = 0;
		var totalamount = 0;
		
		for(var i=0; i<datalength; i++) {
			var iprice = $("input:text[name=amountInput]").eq(i).val();
			var iamount = $("input.totalprice").eq(i).val();
			
			totalprice += iprice;
			totalamount += iamount
		}
		
		$("input#totalamount").val(totalprice);
		$("input#totalprice").val(totalamount);
		
		//--------------------------------- 상품총액, 상품총수량 출력 끝---------------------------------//
		});
		
		
	});
	
	function goHome() {
		location.href="<%=ctxPath%>/TeamHomePage.neige";
	}
	
	function goback() {
		location.href="javascript:history.back()";
	}

</script>

</head>
<body>



<div id="PaymentContainer">
		<%-- 로그인된 유저가 아닌 일반사용자가 장바구니를 클릭할 경우 --%>
		<%-- <c:if test="${not empty sessionScope.loginuser}"> --%>
			<div id="userInfo" class="widthController">
				<div>
					<a id="userName">${sessionScope.loginuser.userid}</a>님의 충전금 잔액 : [${sessionScope.loginuser.coin}]원 남아 있으십니다.
				</div>
				<div>
					<a id="userName">${sessionScope.loginuser.userid}</a>님의 포인트 : [${sessionScope.loginuser.point}] 포인트 남아 있으십니다.
				</div>
			</div>
		<%-- </c:if> --%>
	
	<form name="orderform" id="orderform" class="orderform">
	<!-- 해당폼에서 나온 제품수량, 주문가격, 제품코드를 주문상세 DB에 insert시킨다. -->
		<!-- "장바구니 헤더" -->
		<div class="head">
			<!-- 상품 전체선택 체크박스 -->
			<div class="check col-md-1">
				<input type="checkbox" id="buyAllCheck" name="buyAllCheck">
			</div>
			<div class="col-md-1">이미지</div>
			<div class="col-md-5">상품정보</div>
			<div class="col-md-1">판매가</div>
			<div class="col-md-1">수량</div>
			<div class="col-md-1">적립금</div>
			<div class="col-md-1">합계</div>
			<div class="col-md-1" >삭제</div>
		</div>
		<!-- "장바구니 상품 목록" -->
		<%-- <c:if test="${not empty orderList}">  --%>
		<!-- 장바구니 DB 테이블에서 내가 선택한 상품 LIST DTO를 받아온다. 없을경우 하단의 메세지를 출력 -->
		
		<c:forEach var="pvo" items="${cartList}" varStatus="status">
		<!-- 장바구니 DB의 내가 저장한 상품의 수 만큼 상품 row를 추가한다. -->
			<div class="data">
				<ul>
					<!-- 상품 개별 선택 체크박스 -->
					<li class="col-md-1 notimg">
						<input type="checkbox" name="buy">
					</li>
					
					<!-- 장바구니 테이블에서 상품번호를 받기 -> 상품 테이블에 접근하여 상품의 이미지이름, 가격, 상세정보를 받아온다. -->
					<li class="col-md-1">
						<img src="<%=ctxPath%>/images/${pvo.pdimage1}" width="100px;" heigth="200px;">
					</li>
					
					<li class="col-md-5 notimg">
						<span>${pvo.pdcontent}</span>
					</li>
					<!-- 상품가격 -->
					<li class="col-md-1 notimg">
						<input type="text" style="width: 100px;" name="p_price" id="p_price1" class="p_price" value="${pvo.price}" readonly="readonly">
					</li>
					<li class="col-md-1 notimg">
						<!-- "장바구니 수량 변경" -->
						<div class="updown" style="display: inline">
							<input type="text" class="amountCtrl" name="amountInput" size="2" maxlength="4" value="1"> 
							<span><i class='fas fa-angle-up up' style='font-size: 24px; cursor: pointer;'></i></span> 
							<span><i class='fas fa-angle-down down' style='font-size: 24px; cursor: pointer;'></i></span>
						</div>
					</li>
					
					<!-- 적립금 -->
					<li class="col-md-1 notimg">
						<input style="width: 100px" type="number" class="productpoint" value="${pvo.point}" readonly="readonly" />&nbsp;P
					</li>
					
					<!-- 상품 총 가격 = 상품 수량*가격 -->
					<li class="col-md-1 notimg">
						<input style="width: 100px" name="totalprice" type="number" class="totalprice" value="${pvo.price}" readonly="readonly" />&nbsp;원
					</li>
					
					<!-- 상품 개별 삭제버튼 -->
					<li class="col-md-1 notimg">
						<button type="button" class="btn btn-primary deleteOne" >삭제</button>
					</li>
					
					<!-- 상품번호를 받아와 .java로 전송시켜줄 변수를 만든다.
						  상품번호로 상품DB에서 상품VO를 가져와 해당 form에 적용 
					 -->
					 <li>
						<input type="hidden" name="pdno">
					</li>
				</ul>
			</div>
		</c:forEach>
		
			<!-- "선택된 상품들 삭제 버튼" -->
			<div class="widthController headBtn" align="right">
				<button type="button" class="btn btn-primary" id="selectDelete">선택상품삭제</button>
				&nbsp;|&nbsp;
			<!-- "장바구니 전체 상품 삭제 버튼" -->
				<button type="button" class="btn btn-primary" id="allDelete">장바구니비우기</button>
			</div>
		</form>
		
			<!-- "장바구니 전체 합계 정보" -->
			<div class="widthController" id="sum_p_num" align="right">상품갯수: <input type="number" readonly="readonly" id="totalamount" /> 개</div>
			<div class="widthController" id="sum_p_price" align="right">합계금액: <input type="number" id="totalprice" readonly="readonly" /> 원</div>
			
			<!-- 배송 정보 -->
			<table class="widthController" id="addressInfoTbl">
				<tbody>
					<tr>
						<th colspan="2" id="th">::: 배송정보 :::</th>
					</tr>
				<tbody>
					<tr>
						<td style="width: 20%; font-weight: bold;" class="td_title">
							<h2>배송지 선택</h2>
						</td>
						<td style="width: 80%; text-align: left;">
							<input type="radio" name="loadOrWrite" id="load_address" class="requiredInfo" value="1"/>주문자 정보와 동일&nbsp; 
							<input type="radio" name="loadOrWrite" id="Write_address" class="requiredInfo" value="2"/>새로운 배송지 작성
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;" class="td_title">받는분 성명</td>
						<td style="width: 80%; text-align: left;">
							<input type="text" name="name" id="name" /> <span class="error">성명은 필수입력 사항입니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;" class="td_title">우편번호</td>
						<td style="width: 80%; text-align: left;">
							<input type="text" id="postcode" name="postcode" size="6" maxlength="5" />&nbsp;&nbsp;
							<%-- 우편번호 찾기 --%>
							<img id="zipcodeSearch" src="<%=ctxPath%>/images/b_zipcode.gif" style="vertical-align: middle;" /> 
							<span class="error">우편번호 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;" class="td_title">주소</td>
						<td style="width: 80%; text-align: left;">
							<input type="text" id="address" name="address" size="60" placeholder="주소" style="margin-bottom: 10px;" /><br /> <input type="text" id="detailAddress" name="detailAddress" size="60" placeholder="상세주소" /><br /> <span class="error">주소를 입력하세요</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;" class="td_title">연락처</td>
						<td style="width: 80%; text-align: left;">
							<input type="text" id="mobile" name="mobile" size="20" maxlength="11" />
							<span class="error">휴대폰 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;" class="td_title">배송메시지</td>
						<td style="width: 80%; text-align: left;">
							<textarea rows="5" cols="50" id="deliveryMessage" style="margin: 0px; width: 1089px; height: 182px;"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			
			<form name="totalForm">
			<!-- 해당 폼에서 총 주문금액, 포인트사용금액, 총 결제금액을 VO객체를 만들어 주문테이블에 insert한다 -->
			<!-- 총 주문금액 / 총 할인 금액/ 총 결제금액 -->
			<table class="widthController" id="totalTbl">
				<thead>
					<tr>
						<td>총 주문 금액</td>
						<td>포인트 사용 금액</td>
						<td>총 결제 금액</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>51500원</td>
						<td>4300원</td>
						<td>47200원</td>
					</tr>
				</tbody>
			</table>
	
	
			<!-- 상품 주문 -->
			<div class="widthController" align="right" style="display: inline-block;">
				<button type="button" class="btn btn-primary orderBtn" id="orderBtn">선택한 상품 주문</button>
				<button type="button" class="btn btn-primary orderBtn" id="allOrderBtn">전체 상품 주문</button>
			</div>
			
			<!-- 추천상품 -->
			<div id="RecommendItem">
				<h3>Recommend Item</h3>
			</div>
			<div id="myCarousel" class="carousel slide widthController" data-ride="carousel">
				<div class="owl-carousel owl-theme owl-loaded ">
					<div class="owl-stage-outer">
						<div class="owl-stage">
							<c:forEach var="imgvo" items="${imgList}" varStatus="status">
								<div class="owl-item">
									<img src="<%=ctxPath%>/images/${imgvo.imgfilename}" style="width: 100%;">
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- Greatest Offer News End -->
			</div>
		<%-- </c:if> --%>
	</form>
	<!-- 장바구니 테이블이 비어있을 경우 -->
	<c:if test="${empty orderList}">
		<div style="border: 1px solid #E2E2E2; height:300px; margin-top: 0px; margin-bottom: 100px; display: table; vertical-align: middle; " class="widthController" id="nothingChoice">
			<h3 style="opacity: 0.5; display: table-cell; vertical-align: middle;" >선택하신 상품이 존재하지 않습니다.</h3>
		</div>
		
		<div style="display: inline;">
			<span>
				<button type="button" id="homeBtn" class="btn btn-warning" style="font-size: 15pt; margin-right: 15px;" onclick="goHome()">쇼핑몰 홈</button>
			</span>
			<span>
				<button type="button" id="homeBtn" class="btn btn-warning" style="font-size: 15pt;" onclick="goback()">이전 페이지로 돌아가기</button>
			</span>
		</div>
		
		<div id="RecommendItem">
				<h3>Recommend Item</h3>
			</div>
			<div id="myCarousel" class="carousel slide widthController" data-ride="carousel">
				<div class="owl-carousel owl-theme owl-loaded ">
					<div class="owl-stage-outer">
						<div class="owl-stage">
							<c:forEach var="imgvo" items="${imgList}" varStatus="status">
								<div class="owl-item">
									<img src="<%=ctxPath%>/images/${imgvo.imgfilename}" style="width: 100%;">
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- Greatest Offer News End -->
			</div>
	</c:if>
 </div>

<jsp:include page="../footer.jsp" />