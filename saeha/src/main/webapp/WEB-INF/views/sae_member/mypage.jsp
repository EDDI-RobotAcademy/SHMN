<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<style type="text/css">
.my:hover {background-color: #F6F6F6;}
</style>

</head>

<body>
<%@include file='../include/nav.jsp' %>
<div class="page-content">
<div style="width:90%">
<div style="padding:60px 0; height: 100%;">


			<div class="section-heading" style="padding-left:20px">
				<h1>
					Member<br>
					<em>Infomation</em>
				</h1>
				<p>
					Praesent pellentesque efficitur magna, <br>sed pellentesque
					neque malesuada vitae.
				</p>
			</div>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#memberUpdateBtn").on("click", function() {
				location.href = "/sae_member/memberUpdateView";
			});

			$("#memberProgramBtn").on("click", function() {
				location.href = "/sae_book/booklist";
			});

			$("#memberBuyBtn").on("click", function() {
				location.href = "/sae_buy/buylist";
			});
			
			$("#memberLikeBtn").on("click", function() {
				location.href = "/sae_program/likelist";
			});

			$("#memberCouponBtn").on("click", function() {
				location.href = "/sae_coupon/couponregisterView";
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
<section style=""></section>
<input  type="hidden" id="year" value="${member.userBirth}" />
				<div style="width: 70%">
					<div
						style="padding: 60px 0; height: 100%; width: 150%; padding-left: 15%; padding-right: 20%;">
						<div style="width: 100%; margin-right: 300px;">
							<h3>MY PAGE</h3>
							<div style="display: flex; margin-bottom: 15px;">
								<div style="width: 50%">
									<img src="/resources/img/chat1.jpg"></img>
								</div>
								<div style="width: 50%;">
									<br>
									<font style="font-size: 21px; font-weight: 600;">${member.userName}&nbsp;님</font><br>
									<%-- 		<br><font style="font-size: 21px;font-weight: 600; line-height: 150px;">${member.userName}&nbsp;님</font><br> --%>
									<span style="height: 60px; padding-top: 5px; display: block;"
										id="type"></span>
								</div>
							</div>
							<div style="display: flex">
								<div class="my"
									style="width: 20%; height: 190px; text-align: center; align-items: center; display: grid; border: 2px solid;">
									<button
										style="background-color: white; border: none; font-size: 17px;"
										id="memberUpdateBtn" type="button">회원정보수정</button>
								</div>
								&nbsp;
								<div class="my"
									style="width: 20%; height: 190px; text-align: center; align-items: center; display: grid; border: 2px solid;">
									<button
										style="background-color: white; border: none; font-size: 17px;"
										id="memberProgramBtn" type="button">프로그램 예약 목록</button>
								</div>
								&nbsp;
								<div class="my"
									style="width: 20%; height: 190px; text-align: center; align-items: center; display: grid; border: 2px solid;">
									<button
										style="background-color: white; border: none; font-size: 17px;"
										id="memberLikeBtn" type="button">찜 목록</button>
								</div>
								&nbsp;
								<div class="my"
									style="width: 20%; height: 190px; text-align: center; align-items: center; display: grid; border: 2px solid;">
									<button
										style="background-color: white; border: none; font-size: 17px;"
										id="memberBuyBtn" type="button">구매 내역</button>
								</div>
								&nbsp;
								<div class="my"
									style="width: 20%; height: 190px; text-align: center; align-items: center; display: grid; border: 2px solid;">
									<button
										style="background-color: white; border: none; font-size: 17px;"
										id="memberCouponBtn" type="button">쿠폰 목록</button>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
	</div></div>
	<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>