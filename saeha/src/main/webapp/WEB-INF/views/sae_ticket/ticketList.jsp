<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>입장권</title>
</head>

<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;관람안내<br><Br>
				</h1>

	<img src="/resources/img/tkback.jpg">
	</div>
	<div style="display: flex; ">
		<div style="width: 70%;border-top: 1px solid gray; ">
			<table style="width: 90%;">
				<tr style="border-bottom: 0.5px solid #ccc; height: 180px; padding: 55px 0;">
				<td style="width: 230px;font-size: 24px;">관람시간</td>
				<td style="font-size: 16px;">
				- 동절기(11월~2월)에는 마지막 회차 시간이 16:00에서 15:30으로 앞당겨 운영되오니 방문에 유의하시길
				바랍니다.
				</td>
				</tr>
				<tr style="border-bottom: 0.5px solid #ccc;padding: 55px 0;height: 230px;">
				<td style="width: 230px;font-size: 24px;">휴관일 및 휴실일</td>
				<td style="font-size: 16px;">
				- 매주 화요일은 휴궁일(休宮日)입니다.<br> ※ 휴궁일이 공휴일(대체공휴일 포함)과 겹칠 경우 개방하며, 이
				경우 개방한 공휴일 다음의 첫 번째 비공휴일을 휴궁일로 합니다.
				</td>
				</tr>
				<tr>
				<td style="width: 230px;font-size: 24px; padding: 55px 0;">입장권 구매</td>
				<td style="font-size: 16px;padding: 55px 0;">
				- 예약 및 취소기간 : 관람희망일 7일전 10:00 ~ 관람희망일 1일전 23:00 까지<br>
				<p class="gbg_hypen" style="color: blue; font-weight: bold;">- 단체
				예약은 경복궁 문화재 안내실로 별도 문의 바랍니다.<br>
				<span style="color: #7a7a7a;">* 문의처 : 경복궁 문화재안내실 02-3700-3904</span></p>
				<a href="/sae_ticket/tkMyBook">예약 확인 바로가기 > </a>
				<div>
				<br><br>
				<section id="container" style="display: flex;">
<div style="width:25%;">
			&nbsp;&nbsp;<input type="date" id="calendar">
</div>
<div style="width:70%;">
			<iframe id="ticket" src="/sae_ticket/ticketBook?day=2" width="80%" height="50%"> </iframe>
</div>
		</section>
		</div>
				</td>
				
				</tr>
			</table>
		</div>
		<div style="width: 15%;border-top: 1px solid gray;"><br><br>
		관람 시 유의사항<br><br>
		. 마스크 착용은 방역지침을 준수해주시기 바랍니다.<br><br>
		. 궁 내의 모든 공간은 금연구역입니다.<br><br>
		. 음식물 반입과 안내견 이외의 애완동물(또는 반려동물)의 출입은 금지되어 있습니다.<br><br>
		. 궁 내부에서는 정숙해 주시고 뛰어다니는 행위는 삼가시길 바랍니다.<br><br>
		. 문화재에 손상을 입힐 수 있는 행위는 절대 삼가 주십시오.<br><br>
		</div>
		<div style="width: 10%;">
		</div>
	</div>

			<c:if test="${member.userId == 'admin' }">
				<button>
					<a href="/sae_ticket/tkWriteView"> 티켓 등록</a>
				</button>
			</c:if>
	</div>
	
	<script>
		//예약페이지로
		$("#calendar").change(function() {
			var date = $('#calendar').val();
			$("#ticket").attr("src", "/sae_ticket/ticketBook?day=" + date)

		})
	</script>

</div>
<footer class="footer">
<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
</footer>
</body>
</html>