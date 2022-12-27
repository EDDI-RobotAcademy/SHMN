<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<style type="text/css">
body{justify-content: center;}
div{margin: 0 auto;}
ul li{list-style:none;}
a{ text-decoration: none; color:inherit;}

.head {width:85%; text-align: right; line-height: 36px; }
.menu {width: 100%; border-bottom:1px solid #ccc;margin-top: 20px;}

.mainmenu1{height:70px; width:85%; text-align: right;border-bottom: 1px solid #ccc;}
.mainmenu2{
	display:block;
	height:70px;
	margin: 0 auto;
	}
	
.mainmenu2>li {
	height: 70px;
	display:inline-block;
	position: relative;
	width:90px;
	}


.li {display:flex; justify-content: center; align-items: center; height: 70px;}

.mainmenu2>li:hover {background-color: #6680CC;}
.sub2 span:hover {background-color: #6680CC; }

.sub1{
	opacity:0%;
	width: 100%;
	height:250px;
	background-color: white;
	z-index: 2;
	transition: 1s all;
	position:absolute;
}

.sub2{
	width:85%;
	text-align: center; 
	padding-left: 10px;
	display:flex;
	}
.sub2 span{display:block;}

.submenu {
	vertical-align: top;
	width: 16%;
	border-right: 1px solid #ccc;
	padding: 5px;
	height: 95%;
	margin:0;
}

.sublast {
	vertical-align: top;
	width: 16%;
	display:inline-block; 
	padding: 5px;
	height: 95%;
	margin:0;
}

.subtitle{
	border-bottom: 1px solid #ccc;
	height:30px;
	font-weight: middle;
	}

.dropmenu {opacity:98%;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.mainmenu2').on("click",function(){
		$('.sub1').addClass('dropmenu');
	});
});
	$(document).ready(function() {
	$('.sub2').hover(function(){
		
	},function(){
		$('.sub1').removeClass('dropmenu');
	});
});
</script>
</head>
<body>
<div style="width: 100%; margin-top: 20px;">
<div class="head">
	<a href="/sae_member/login">로그인</a> |
	<a href="/sae_member/register">회원가입</a> &nbsp;
</div>
</div>

<div class="menu">

	<div class="mainmenu1">
	<div style="display: inline-block; float: left; height: 70px;">
			<img src="<spring:url value='/resources/img/logo.png'/>"style="height:40px;">
	</div>
	
	<div style="margin-right: 56px;width: fit-content;">
	<ul class="mainmenu2">
		<li><div class="li">관람안내</div></li>
		<li><div class="li">예약하기</div></li>
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
			<span class="subtitle">관람안내</span><br>
			<span><a href="#">관람규칙</a></span><br>
			<span><a href="#">오시는길</a></span><br>
			<span><a href="#">편의시설</a></span><br>
			<span><a href="#">관람시간/요금</a></span>
		</div>
		<div class="submenu">
			<span class="subtitle">예약하기</span><br>
			<span><a href="#">관람/해설 예약</a></span><br>
			<span><a href="#">체험하기 예약</a></span><br>
			<span><a href="#">전시 예약</a></span><br>
		</div>
		<div class="submenu">
			<span class="subtitle">구매하기</span><br>
			<span><a href="#">입장권</a></span><br>
			<span><a href="#">굿즈</a></span><br>
			<span><a href="#">한복대여</a></span><br>
			<span><a href="#">관람시간/요금</a></span>
		</div>
		<div class="submenu">
			<span class="subtitle">참여마당</span><br>
			<span><a href="#">1:1채팅</a></span><br>
			<span><a href="#">FAQ</a></span><br>
			<span><a href="#">공지사항</a></span><br>
		</div>
		<div class="submenu">
			<span class="subtitle">경복궁안내</span><br>
			<span><a href="#">사계</a></span><br>
			<span><a href="#">역사</a></span><br>
		</div>
		<div class="sublast">
			<span class="subtitle">마이페이지</span><br>
			<span><a href="#">내정보</a></span><br>
			<span><a href="#">찜목록</a></span><br>
			<span><a href="#">구매내역</a></span><br>
			<span><a href="#">쿠폰</a></span>
		</div>
	</div>
	</div>
</div>

</body>
</html>