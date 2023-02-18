<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#couponbtn").on("click",function() {
		
		var form1000 = $("form[name='1000']");
		var form5000 = $("form[name='5000']");
		var form10000 = $("form[name='10000']");
		var coupon = $('#coupon').val();
		var price1 = $('.1').val();
		var price2 = $('.2').val();
		var price3 = $('.3').val();
			
		
		if(coupon == "shmn1000"){	
			
			
			if(price1 == 1000 || price2 == 1000 || price3 == 1000){
				alert("이미 등록된 쿠폰입니다");
				return false;
			}
			
			alert("1000원 쿠폰이 등록되었습니다!");
			form1000.attr("action", "/sae_coupon/couponregister");
			form1000.attr("method", "post");
			form1000.submit();
		} else if(coupon == "shmn5000"){
			
			if(price1 == 5000 || price2 == 5000 || price3 == 5000){
				alert("이미 등록된 쿠폰입니다");
				return false;
			}
			
			alert("5000원 쿠폰이 등록되었습니다!");
			form5000.attr("action", "/sae_coupon/couponregister");
			form5000.attr("method", "post");
			form5000.submit();
		}else if(coupon == "shmn10000"){
			
			if(price1 == 10000 || price2 == 10000 || price3 == 10000){
				alert("이미 등록된 쿠폰입니다");
				return false;
			}
			
			alert("10000원 쿠폰이 등록되었습니다!");
			form10000.attr("action", "/sae_coupon/couponregister");
			form10000.attr("method", "post");
			form10000.submit();
		} else {
			alert("잘못입력하셨습니다 다시 입력해주세요");
			return false;
		}
		
	})
	
})
</script>
<meta charset="UTF-8">
<title>쿠폰등록</title>
</head>
<body>
	
	<div>
		<button><a href="/">메인페이지로</a></button>
	</div>
	
	<form name="1000">
		<input type="hidden" id="coupon_id" name="coupon_id" value="${member.userId}"/>
		<input type="hidden" id="coupon_name" name="coupon_name" value="1000원 할인 쿠폰"/>
		<input type="hidden" id="coupon_price" name="coupon_price" value="1000"/>
	</form>
	
	<form name="5000">
		<input type="hidden" id="coupon_id" name="coupon_id" value="${member.userId }"/>
		<input type="hidden" id="coupon_name" name="coupon_name" value="5000원 할인 쿠폰"/>
		<input type="hidden" id="coupon_price" name="coupon_price" value="5000"/>
	</form>
	
	<form name="10000">
		<input type="hidden" id="coupon_id" name="coupon_id" value="${member.userId }"/>
		<input type="hidden" id="coupon_name" name="coupon_name" value="10000원 할인 쿠폰"/>
		<input type="hidden" id="coupon_price" name="coupon_price" value="10000"/>
	</form>
	
	<h1>${member.userId }님의 쿠폰목록</h1>
	<div class="container">
	<table class="table table-hover">
	<c:forEach items="${couponlist }" var="couponlist">
		<c:set var="i" value="${i+1 }"/>
		<tr>
			<td><img style="width:100px; height:50px;" src="/resources/img/${couponlist.coupon_price}discount.png">
			<td><input type="text" id="coupon_name" value="${couponlist.coupon_name}" readonly="readonly" /></td>
			<td><input type="text" class="${i }" value="${couponlist.coupon_price}" readonly="readonly" /></td>
			<c:choose>
				<c:when test="${empty couponlist.coupon_content}">
					<td><c:out value="사용가능" /></td>
				</c:when>
				<c:otherwise>
					<td><c:out value="${couponlist.coupon_content}" /></td>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
	</table>
	
	<div>
		<label>쿠폰번호</label>
		<input type="text" id="coupon">
		<button id="couponbtn">등록</button>
	</div>
	<div>
		
	</div>
	</div>
</body>
</html>