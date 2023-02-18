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


<title>입장권</title>
</head>

<body>
	<div class="container">
		<header>
			<h1>입장권</h1>
		</header>
		<hr />

		<div>
			<p>
				- 매주 화요일은 휴궁일(休宮日)입니다.<br> ※ 휴궁일이 공휴일(대체공휴일 포함)과 겹칠 경우 개방하며, 이
				경우 개방한 공휴일 다음의 첫 번째 비공휴일을 휴궁일로 합니다.
			</p>
			<p>- 동절기(11월~2월)에는 마지막 회차 시간이 16:00에서 15:30으로 앞당겨 운영되오니 방문에 유의하시길
				바랍니다.</p>
			<p>- 예약 및 취소기간 : 관람희망일 7일전 10:00 ~ 관람희망일 1일전 23:00 까지</p>
			<p class="gbg_hypen" style="color: blue; font-weight: bold;">- 단체
				예약은 경복궁 문화재 안내실로 별도 문의 바랍니다.</p>
			&nbsp;
			<p>* 문의처 : 경복궁 문화재안내실 02-3700-3904</p>
			<br />
			<br />


			<c:if test="${member.userId == 'admin' }">
				<button>
					<a href="/sae_ticket/tkWriteView"> 티켓 등록</a>
				</button>
			</c:if><br />
			<button>
				<a href="/sae_ticket/tkMyBook"> 예약 확인</a>
			</button>
			<br />
			<br />
			<br />
			<!-- 검색 -->
			<div class="search row"></div>


		</div>

		<section id="container">

			<input type="date" id="calendar"> &nbsp;&nbsp;&nbsp;

			<iframe id="ticket" src="/sae_ticket/ticketBook?day=2" width="80%" height="50%"> </iframe>


			<hr />


		</section>
	</div>
	<script>
		//예약페이지로
		$("#calendar").change(function() {
			var date = $('#calendar').val();
			$("#ticket").attr("src", "/sae_ticket/ticketBook?day=" + date)

		})
	</script>


</body>
</html>