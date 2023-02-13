<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>임시 메인페이지</title>
<style type="text/css">
body {
	justify-content: center;
}

div {
	margin: 0 auto;
}

ul li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.head {
	width: 1000px;
	text-align: right;
	line-height: 36px;
}

.mainmenu1 {
	height: 70px;
	width: 1000px;
	text-align: right;
	border-bottom: 1px solid #ccc;
}

.menu {
	width: 99%;
	border-bottom: 1px solid #ccc;
	margin-top: 20px;
}

.mainmenu2 {
	display: block;
	height: 70px;
	float: right;
	margin: 0 auto;
}

.mainmenu2>li {
	height: 70px;
	display: inline-block;
	position: relative;
	width: 90px;
}

.li {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 70px;
}

.mainmenu2>li:hover {
	background-color: #6680CC;
}

.sub2 span:hover {
	background-color: #6680CC;
}

.sub1 {
	opacity: 0%;
	width: 99%;
	height: 250px;
	background-color: white;
	z-index: 2;
	transition: 1s all;
	position: absolute;
}

.sub2 {
	width: 1000px;
	text-align: left;
	margin: 0 auto;
	padding-left: 10px;
}

.sub2 span {
	display: block;
}

.submenu {
	vertical-align: top;
	width: 15%;
	display: inline-block;
	border-right: 1px solid #ccc;
	padding: 5px;
	height: 95%;
	text-align: center;
}

.sublast {
	vertical-align: top;
	width: 15%;
	display: inline-block;
	padding: 5px;
	height: 95%;
}

.subtitle {
	border-bottom: 1px solid #ccc;
	height: 30px;
	font-weight: middle;
}

.dropmenu {
	opacity: 98%;
}

.slider_main {
	height: 500px;
	width: 100%;
	flex-wrap: wrap;
}

.slider_main_img>img {
	height: 500px;
}

.container {
	margin: 0 auto;
	width: 1000px;
	height: 100%
}

.boardn {
	width: 460px;
	height: 347px;
	background-color: yellow;
	float: left;
}

.quick {
	width: 460px;
	height: 347px;
	background-color: red;
	float: right;
}

#wrap {
	width: 100%;
	max-width: 1000px;
	margin: 0 auto;
}

.program {
	width: 270;
	height: 350px;
}
</style>


<!-- 채팅방 css시작 -->
<style type="text/css">
#center-text {
	display: flex;
	flex: 1;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
}

#chat-circle {
	position: fixed;
	bottom: 50px;
	right: 50px;
	background: #5A5EB9;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	color: white;
	padding: 28px;
	cursor: pointer;
	box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px
		rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}

.btn#my-btn {
	background: white;
	padding-top: 13px;
	padding-bottom: 12px;
	border-radius: 45px;
	padding-right: 40px;
	padding-left: 40px;
	color: #5865C3;
}

#chat-overlay {
	background: rgba(255, 255, 255, 0.1);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	display: none;
}

.chat-box {
	display: none;
	background: #efefef;
	position: fixed;
	right: 30px;
	bottom: 50px;
	width: 350px;
	max-width: 85vw;
	max-height: 100vh;
	border-radius: 5px;
	/*   box-shadow: 0px 5px 35px 9px #464a92; */
	box-shadow: 0px 5px 35px 9px #ccc;
}

.chat-box-toggle {
	float: right;
	margin-right: 15px;
	cursor: pointer;
}

.chat-box-header {
	background: #5A5EB9;
	height: 35px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	color: white;
	text-align: center;
	font-size: 20px;
	padding-top: 17px;
}

.chat-box-body {
	position: relative;
	height: 370px;
	height: auto;
	border: 1px solid #ccc;
	overflow: hidden;
}

.chat-box-body:after {
	content: "";
	background-image:
		url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTAgOCkiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+PGNpcmNsZSBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIgY3g9IjE3NiIgY3k9IjEyIiByPSI0Ii8+PHBhdGggZD0iTTIwLjUuNWwyMyAxMW0tMjkgODRsLTMuNzkgMTAuMzc3TTI3LjAzNyAxMzEuNGw1Ljg5OCAyLjIwMy0zLjQ2IDUuOTQ3IDYuMDcyIDIuMzkyLTMuOTMzIDUuNzU4bTEyOC43MzMgMzUuMzdsLjY5My05LjMxNiAxMC4yOTIuMDUyLjQxNi05LjIyMiA5LjI3NC4zMzJNLjUgNDguNXM2LjEzMSA2LjQxMyA2Ljg0NyAxNC44MDVjLjcxNSA4LjM5My0yLjUyIDE0LjgwNi0yLjUyIDE0LjgwNk0xMjQuNTU1IDkwcy03LjQ0NCAwLTEzLjY3IDYuMTkyYy02LjIyNyA2LjE5Mi00LjgzOCAxMi4wMTItNC44MzggMTIuMDEybTIuMjQgNjguNjI2cy00LjAyNi05LjAyNS0xOC4xNDUtOS4wMjUtMTguMTQ1IDUuNy0xOC4xNDUgNS43IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIi8+PHBhdGggZD0iTTg1LjcxNiAzNi4xNDZsNS4yNDMtOS41MjFoMTEuMDkzbDUuNDE2IDkuNTIxLTUuNDEgOS4xODVIOTAuOTUzbC01LjIzNy05LjE4NXptNjMuOTA5IDE1LjQ3OWgxMC43NXYxMC43NWgtMTAuNzV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIvPjxjaXJjbGUgZmlsbD0iIzAwMCIgY3g9IjcxLjUiIGN5PSI3LjUiIHI9IjEuNSIvPjxjaXJjbGUgZmlsbD0iIzAwMCIgY3g9IjE3MC41IiBjeT0iOTUuNSIgcj0iMS41Ii8+PGNpcmNsZSBmaWxsPSIjMDAwIiBjeD0iODEuNSIgY3k9IjEzNC41IiByPSIxLjUiLz48Y2lyY2xlIGZpbGw9IiMwMDAiIGN4PSIxMy41IiBjeT0iMjMuNSIgcj0iMS41Ii8+PHBhdGggZmlsbD0iIzAwMCIgZD0iTTkzIDcxaDN2M2gtM3ptMzMgODRoM3YzaC0zem0tODUgMThoM3YzaC0zeiIvPjxwYXRoIGQ9Ik0zOS4zODQgNTEuMTIybDUuNzU4LTQuNDU0IDYuNDUzIDQuMjA1LTIuMjk0IDcuMzYzaC03Ljc5bC0yLjEyNy03LjExNHpNMTMwLjE5NSA0LjAzbDEzLjgzIDUuMDYyLTEwLjA5IDcuMDQ4LTMuNzQtMTIuMTF6bS04MyA5NWwxNC44MyA1LjQyOS0xMC44MiA3LjU1Ny00LjAxLTEyLjk4N3pNNS4yMTMgMTYxLjQ5NWwxMS4zMjggMjAuODk3TDIuMjY1IDE4MGwyLjk0OC0xOC41MDV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIvPjxwYXRoIGQ9Ik0xNDkuMDUgMTI3LjQ2OHMtLjUxIDIuMTgzLjk5NSAzLjM2NmMxLjU2IDEuMjI2IDguNjQyLTEuODk1IDMuOTY3LTcuNzg1LTIuMzY3LTIuNDc3LTYuNS0zLjIyNi05LjMzIDAtNS4yMDggNS45MzYgMCAxNy41MSAxMS42MSAxMy43MyAxMi40NTgtNi4yNTcgNS42MzMtMjEuNjU2LTUuMDczLTIyLjY1NC02LjYwMi0uNjA2LTE0LjA0MyAxLjc1Ni0xNi4xNTcgMTAuMjY4LTEuNzE4IDYuOTIgMS41ODQgMTcuMzg3IDEyLjQ1IDIwLjQ3NiAxMC44NjYgMy4wOSAxOS4zMzEtNC4zMSAxOS4zMzEtNC4zMSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEuMjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPjwvZz48L3N2Zz4=');
	opacity: 0.1;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: 100%;
	position: absolute;
	z-index: -1;
}

#chat-input {
	background: #f4f7f9;
	width: 100%;
	position: relative;
	height: 47px;
	padding-top: 10px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 15px;
	border: none;
	resize: none;
	outline: none;
	border: 1px solid #ccc;
	color: #888;
	border-top: none;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	overflow: hidden;
}

.chat-input>form {
	margin-bottom: 0;
}

#chat-input::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	color: #ccc;
}

#chat-input::-moz-placeholder { /* Firefox 19+ */
	color: #ccc;
}

#chat-input:-ms-input-placeholder { /* IE 10+ */
	color: #ccc;
}

#chat-input:-moz-placeholder { /* Firefox 18- */
	color: #ccc;
}

.chat-submit {
	position: absolute;
	bottom: 3px;
	right: 10px;
	background: transparent;
	box-shadow: none;
	border: none;
	border-radius: 50%;
	color: #5A5EB9;
	width: 35px;
	height: 35px;
}

.chat-logs {
	padding: 15px;
	height: 370px;
	overflow-y: scroll;
}

.chat-logs::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

.chat-logs::-webkit-scrollbar {
	width: 5px;
	background-color: #F5F5F5;
}

.chat-logs::-webkit-scrollbar-thumb {
	background-color: #5A5EB9;
}

@media only screen and (max-width: 500px) {
	.chat-logs {
		height: 40vh;
	}
}

.chat-msg.user>.msg-avatar img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	float: left;
	width: 15%;
}

.chat-msg.self>.msg-avatar img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	float: right;
	width: 15%;
}

.cm-msg-text {
	background: white;
	padding: 10px 15px 10px 15px;
	color: #666;
	max-width: 75%;
	float: left;
	margin-left: 10px;
	position: relative;
	margin-bottom: 20px;
	border-radius: 30px;
}

.chat-msg {
	clear: both;
}

.chat-msg.self>.cm-msg-text {
	float: right;
	margin-right: 10px;
	background: #5A5EB9;
	color: white;
}

.cm-msg-button>ul>li {
	list-style: none;
	float: left;
	width: 50%;
}

.cm-msg-button {
	clear: both;
	margin-bottom: 70px;
}
</style>

<!-- 채팅방 css끝 -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		$('.slider_main').bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
		});
	});

	$(document).ready(function() {
		$('.mainmenu2').on("click", function() {
			$('.sub1').addClass('dropmenu');
		});
	});
	$(document).ready(function() {
		$('.sub2').hover(function() {

		}, function() {
			$('.sub1').removeClass('dropmenu');
		});
	});
</script>

<link rel="stylesheet" href="css/jquery.bxslider.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script>
	$(function() {
		$('.slider').bxSlider({
			auto : true,
			moveSlides : 1, //한번움직일때 한장씩
			minSlides : 1, //반응형일때 대응한다.
			maxSlides : 4, //pc크기
			slideWidth : 230,
			slideMargin : 20,
		});
	});
</script>

</head>

<body>
	<div style="width: 99%; margin-top: 20px;">
		<div class="head">
			<a href="/sae_member/login">로그인</a> | <a
				href="/sae_member/agree_register">회원가입</a> &nbsp;
		</div>
	</div>

	<div class="menu">

		<div class="mainmenu1">
			<div style="display: inline-block; float: left; height: 70px;">
				<img src="<spring:url value='/resources/img/logo.png'/>"
					style="height: 40px;">
			</div>

			<div style="height: 70px; padding-right: 56px;">
				<ul class="mainmenu2">
					<li><div class="li">관람안내</div></li>
					<li><div class="li">관람예약</div></li>
					<li><div class="li">구매</div></li>
					<li><div class="li">참여마당</div></li>
					<li><div class="li">경복궁안내</div></li>
					<li><div class="li">마이페이지</div></li>
				</ul>
			</div>
		</div>

		<div class="sub1">
			<div class="sub2">
				<div class="submenu">
					<span class="subtitle">관람안내</span><br> <span><a
						href="#">관람규칙</a></span><br> <span><a href="/sae_map/map">오시는길</a></span><br>
					<span><a href="#">편의시설</a></span><br> <span><a href="#">관람시간/요금</a></span>
				</div>
				<div class="submenu">
					<span class="subtitle">관람예약</span><br> 
				<span><a href="/sae_program/program">프로그램 등록</a></span><br>
					<span><a
						href="/sae_program/programlist?type=1">온라인프로그램</a></span><br> <span><a href="/sae_program/programlist?type=2">어린이프로그램</a></span><br>
					<span><a href="/sae_program/programlist?type=3">단체프로그램</a></span><br>
				</div>
				<div class="submenu">
					<span class="subtitle">구매하기</span><br> <span><a
						href="#">입장권</a></span><br> 
						<span><a href="/sae_product/productmain">상품</a></span><br>
						<span><a
						href="/sae_goodsboard/list?pno=1">굿즈</a></span><br> <span><a
						href="/sae_hanbokboard/list?pno=1">한복대여</a></span><br> <span><a
						href="#">관람시간/요금</a></span>
				</div>
				<div class="submenu">
					<span class="subtitle">참여마당</span><br> 
					<span><a href="#">1:1채팅</a></span><br> 
					<span><a href="/sae_faq/faqList">FAQ</a></span><br>
					<span><a href="/sae_boardn/nlist">공지사항</a></span><br>
				</div>
				<div class="submenu">
					<span class="subtitle">경복궁안내</span><br> <span><a
						href="#">사계</a></span><br> <span><a href="#">역사</a></span><br>
				</div>
				<div class="sublast">
					<span class="subtitle">마이페이지</span><br> <span><a
						href="#">내정보</a></span><br> <span><a href="#">찜목록</a></span><br>
					<span><a href="#">구매내역</a></span><br> <span><a href="#">쿠폰</a></span>
				</div>
			</div>
		</div>
	</div>

	<div style="justify-content: center; display: flex; flex-wrap: wrap;">
		<div class="slider_main">
			<div class="slider_main_img">
				<img src="<spring:url value='/resources/img/main_slider1.jpg'/>">
			</div>
			<div class="slider_main_img">
				<img src="<spring:url value='/resources/img/main_slider2.jpg'/>">
			</div>
			<div class="slider_main_img">
				<img src="<spring:url value='/resources/img/main_slider3.jpg'/>">
			</div>
			<div class="slider_main_img">
				<img src="<spring:url value='/resources/img/main_slider4.jpg'/>">
			</div>
		</div>
	</div>
	<div class="container">
		<div class="contents" style="margin-top: 20px; height: 400px;">
			<div class="boardn">공지사항</div>
			<div class="quick">바로가기버튼</div>
		</div>

		<div id="wrap">
			<section class="section1">
				<ul class="slider">
					<li class="program" style="background-color: black;"><a
						href="#">프로그램</a></li>
					<li class="program" style="background-color: blue;"><a
						href="#">프로그램</a></li>
					<li class="program" style="background-color: orange;"><a
						href="#">프로그램</a></li>
					<li class="program" style="background-color: purple;"><a
						href="#">프로그램</a></li>
					<li class="program" style="background-color: pink;"><a
						href="#">프로그램</a></li>
				</ul>
			</section>
		</div>
		<div>굿즈??? 한복???? 온라인 상영관도 있지~~</div>

		<div id="chat-circle" class="btn btn-raised">
			<div id="chat-overlay"></div>
			<i class="material-icons">&nbsp;채팅하기</i>
		</div>

		<!-- 채팅 방 -->
		<div class="chat-box">
			<div class="chat-box-header">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채팅하기 <span class="chat-box-toggle"><i
					class="material-icons">close</i></span>
			</div>
			<div class="chat-box-body">
				<div class="chat-box-overlay"></div>
				<div class="chat-logs"></div>
				<!--chat-log -->
			</div>
			<div class="chat-input">
				<form>
					<input type="text" id="chat-input" placeholder="Send a message..." />
					<button type="submit" class="chat-submit" id="chat-submit">
						<i class="material-icons">send</i>
					</button>
				</form>
			</div>
		</div>
		
		<script type="text/javascript">
			
			var wsUri = "ws://localhost:8080/chat-ws";

				websocket = new WebSocket(wsUri);
				websocket.onopen = function(msg) {
					onOpen(msg);
				};
				websocket.onclose = function(evt) {
					onClose(evt)
				};
				websocket.onmessage = function(evt) {
					onMessage(evt)
				};
				websocket.onerror = function(evt) {
					onError(evt)
				};
			

			function onOpen(msg) {
				writeToScreen("연결완료");
				
			}

			function onClose(evt) {
				writeToScreen("연결해제");
			}
			function onError(evt) {
				writeToScreen(evt);
			}

			function doSend(message) {
				writeToScreen(message);
				websocket.send(message);
			}

			function writeToScreen(message) {
				console.log(message);
			}

			var INDEX = 0;

			document.querySelector("#chat-submit").addEventListener('click',
					function(e) {
						e.preventDefault();
						var msg = $("#chat-input").val();
						if (msg.trim() == '') {
							return false;
						}
						generate_message(msg, 'self');
						
						doSend(msg);
						
						var buttons = [ {
							name : 'Existing User',
							value : 'existing'
						}, {
							name : 'New User',
							value : 'new'
						} ];

					});

			function onMessage(evt) {
				writeToScreen(evt.data);
				generate_message(evt.data, 'user');
			}

			function generate_message(msg, type) {
				INDEX++;
				var str = "";
				str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
				str += "          <span class=\"msg-avatar\">";
				str += "            <img src=\"\/resources\/img\/chat1.jpg\">";
				str += "          <\/span>";
				str += "          <div class=\"cm-msg-text\">";
				str += msg;
				str += "          <\/div>";
				str += "        <\/div>";
				$(".chat-logs").append(str);
				$("#cm-msg-" + INDEX).hide().fadeIn(300);
				if (type == 'self') {
					$("#chat-input").val('');
				}
				$(".chat-logs").stop().animate({
					scrollTop : $(".chat-logs")[0].scrollHeight
				}, 1000);
			}

			function generate_button_message(msg, buttons) {
				/* Buttons should be object array 
				  [
				    {
				      name: 'Existing User',
				      value: 'existing'
				    },
				    {
				      name: 'New User',
				      value: 'new'
				    }
				  ]
				 */
				INDEX++;
				var btn_obj = buttons
						.map(
								function(button) {
									return "              <li class=\"button\"><a href=\"javascript:;\" class=\"btn btn-primary chat-btn\" chat-value=\""+button.value+"\">"
											+ button.name + "<\/a><\/li>";
								}).join('');
				var str = "";
				str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg user\">";
				str += "          <span class=\"msg-avatar\">";
				str += "            <img src=\"\/resources\/img\/chat2.jpg\">";
				str += "          <\/span>";
				str += "          <div class=\"cm-msg-text\">";
				str += msg;
				str += "          <\/div>";
				str += "          <div class=\"cm-msg-button\">";
				str += "            <ul>";
				str += btn_obj;
				str += "            <\/ul>";
				str += "          <\/div>";
				str += "        <\/div>";
				$(".chat-logs").append(str);
				$("#cm-msg-" + INDEX).hide().fadeIn(300);
				$(".chat-logs").stop().animate({
					scrollTop : $(".chat-logs")[0].scrollHeight
				}, 1000);
				$("#chat-input").attr("disabled", true);
			}

			$(document).delegate(".chat-btn", "click", function() {
				var value = $(this).attr("chat-value");
				var name = $(this).html();
				$("#chat-input").attr("disabled", false);
				generate_message(name, 'self');
			});

			$("#chat-circle").click(function() {
				$("#chat-circle").toggle('scale');
				$(".chat-box").toggle('scale');
			});

			$(".chat-box-toggle").click(function() {
				$("#chat-circle").toggle('scale');
				$(".chat-box").toggle('scale');
			});
		</script>
		<!-- 채팅 방 -->



	</div>
	<footer>아니면 풋터먼저 고고</footer>
</body>
</html>