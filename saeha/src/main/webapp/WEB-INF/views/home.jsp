<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<title>임시 메인페이지</title>
<style type="text/css">
body{justify-content: center;}
div{margin: 0 auto;}
ul li{list-style:none;}
a{ text-decoration: none; color:inherit;}

.head {width:1000px; text-align: right; line-height: 36px; }
.mainmenu1{height:70px; width:1000px; text-align: right;border-bottom: 1px solid #ccc;}

.menu {width: 99%; border-bottom:1px solid #ccc;margin-top: 20px;}
.mainmenu2{
	display:block;
	height:70px;
	float: right;
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
	width: 99%; 
	height:250px;
	background-color: white;
	z-index: 2;
	transition: 1s all;
	position:absolute;
}

.sub2{
	width:1000px;  
	text-align: left; 
	margin: 0 auto; 
	padding-left: 10px;
	}
.sub2 span{display:block;}

.submenu {
	vertical-align: top;
	width: 15%;
	display:inline-block; 
	border-right: 1px solid #ccc;
	padding: 5px;
	height: 95%;
	text-align: center;
}

.sublast {
	vertical-align: top;
	width: 15%;
	display:inline-block; 
	padding: 5px;
	height: 95%;
}

.subtitle{
	border-bottom: 1px solid #ccc;
	height:30px;
	font-weight: middle;
	}

.dropmenu {opacity:98%;}


.slider_main{
 height: 500px;
 width: 100%;
 flex-wrap: wrap;
 }
 
 
.slider_main_img > img {height: 500px;}
.container{margin: 0 auto;width:1000px; height: 100%}

.boardn{width: 460px; height: 347px;background-color: yellow;float: left;}
.quick{width: 460px; height: 347px; background-color: red; float:right;}


#wrap{width:100%;max-width:1000px; margin:0 auto;}
.program{width: 270; height: 350px;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
 	$(document).ready(function() {
		$('.slider_main').bxSlider({
			 auto: true,
			 autoControls: true,
			 stopAutoOnClick: true,
			 pager: true,
		});
	});
 	
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

<link rel="stylesheet" href="css/jquery.bxslider.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script>
$(function(){
 $('.slider').bxSlider({
   auto:true,
   moveSlides:1, //한번움직일때 한장씩
   minSlides:1,  //반응형일때 대응한다.
   maxSlides:4, //pc크기
   slideWidth:230,
   slideMargin:20,
  });
});

</script>

</head>

<body>
<div style="width: 99%; margin-top: 20px;">
<div class="head">
	<a href="/sae_member/login">로그인</a> |
	<a href="/sae_member/agree_register">회원가입</a> &nbsp;
</div>
</div>

<div class="menu">

	<div class="mainmenu1">
	<div style="display: inline-block; float: left; height: 70px;">
			<img src="<spring:url value='/resources/img/logo.png'/>"style="height:40px;">
	</div>
	
	<div style="height: 70px;padding-right: 56px;">
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
			<span class="subtitle">관람안내</span><br>
			<span><a href="#">관람규칙</a></span><br>
			<span><a href="#">오시는길</a></span><br>
			<span><a href="#">편의시설</a></span><br>
			<span><a href="#">관람시간/요금</a></span>
		</div>
		<div class="submenu">
			<span class="subtitle">관람예약</span><br>
			<span><a href="#">온라인프로그램</a></span><br>
			<span><a href="#">어린이프로그램</a></span><br>
			<span><a href="#">단체프로그램</a></span><br>
		</div>
		<div class="submenu">
			<span class="subtitle">구매하기</span><br>
			<span><a href="#">입장권</a></span><br>
			<span><a href="/sae_goodsboard/list?pno=1">굿즈</a></span><br>
			<span><a href="/sae_hanbokboard/list?pno=1">한복대여</a></span><br>
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

<div style="justify-content: center; display: flex;flex-wrap: wrap;">
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
         <li class="program" style="background-color: black;"><a href="#">프로그램</a></li>
 	     <li class="program" style="background-color: blue;"><a href="#">프로그램</a></li>
 	     <li class="program" style="background-color: orange;"><a href="#">프로그램</a></li>
 	     <li class="program" style="background-color: purple;"><a href="#">프로그램</a></li>
 	     <li class="program" style="background-color: pink;"><a href="#">프로그램</a></li>
       </ul>
 	  </section>
    </div>
	<div>
	굿즈??? 한복????  온라인 상영관도 있지~~
	</div>
	
	
	
	
	

</div>	
<footer>아니면 풋터먼저 고고</footer>
</body>
</html>