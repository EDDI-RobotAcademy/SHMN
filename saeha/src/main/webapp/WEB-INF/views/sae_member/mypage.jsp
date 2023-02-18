<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
</head>
<body>

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#memberUpdateBtn").on("click", function() {
				location.href = "/sae_member/memberUpdateView";
			});

			$("#memberProgramBtn").on("click", function() {
				location.href = "/sae_member/mypageProgram";
			});

			$("#memberBuyBtn").on("click", function() {
				location.href = "/sae_member/mypageBuy";
			});
			
			$("#memberLikeBtn").on("click", function() {
				location.href = "/sae_member/mypageLike";
			});

			$("#memberCouponBtn").on("click", function() {
				location.href = "/sae_member/mypageCoupon";
			});
		});
	</script>
<script type="text/javascript">
	$(document).ready(function() {
		
			var year = $("#year").val(); 
			year = year/10000;
			var now = new Date(); //현재 날짜 및 시간 2022
			var cur_year = now.getFullYear(); //연도 //현재나이 8살 now - year + 1
			if(cur_year - year + 1 < 6)
			{
				$("#type").text("미취학 회원");
			}
			else if(cur_year - year + 1 < 14)
			{
				$("#type").text("어린이 회원");
			}
			else if(cur_year - year + 1 < 25)
			{
				$("#type").text("청소년 회원");
			}
			else if(cur_year - year + 1 < 65)
			{
				$("#type").text("성인 회원");
			}
			else
			{
				$("#type").text("노인 회원");	
			}
		});
</script>
<input  type="hidden" id="year" value="${member.userBirth}" />
	<h3>MY PAGE</h3>
	<div style="display: flex">
		<div style="width:50%"><img src="/resources/img/chat1.jpg"></img></div>
		<div style="width:50%">${member.userName}&nbsp;님<br><span id="type"></span></div>
	</div>
	<div style="display: flex">
		<div style="width:20%">
			<button id="memberUpdateBtn" type="button">회원정보수정</button>
		</div>
		<div style="width:20%">
			<button id="memberProgramBtn" type="button">프로그램 예약 목록</button>
		</div>
		<div style="width:20%">
			<button id="memberLikeBtn" type="button">찜 목록</button>
		</div>
		<div style="width:20%">
			<button id="memberBuyBtn" type="button">구매 내역</button>
		</div>
		<div style="width:20%">
			<button id="memberCouponBtn" type="button">쿠폰 목록</button>
		</div>
	</div>
</body>
</html>