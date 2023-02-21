<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>

<link rel="stylesheet" href="/resources/css/templatemo-style.css">
<style type="text/css">
body {
	justify-content: center;
	margin: 0 auto;
	width: 100%;
}

.user-wrap {
	background-image: url(/resources/img/login_bnr.jpeg);
	height: 300px;
	background-size: cover;
	background-position: 50% 50%;
}

.login_text {
	position: absolute;
	top: 35%;
	left: 50%;
	width: 100%;
	transform: translate(-50%, -50%);
	font-size: 48px;
	text-align: center;
	color: white;
}
</style>
</head>
<script>
$(document).ready(function(){
	//다음버튼 눌릴때 기능
	$("#next").on("click", function(){
		if($("#id").val() == ""){
		alert("아이디를 입력해주세요");
		}else{
		location.href = "findPass2?userId=" + $("#id").val();
		}
	});
	//돌아가기 버튼을 눌렀을 때
	$("#back").on("click", function(){
		location.href = "/sae_member/login";
	});
});
</script>
<body>
<%@include file='../include/nav.jsp' %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">

			<div class="section-heading">
				<h1>
					Find<br>
					<em>Password</em>
				</h1>
				<p>
					Please enter the ID of the password you want to find.
				</p>
			</div>
		<div style="width: 1100px; height: 450px; background-color: #f8f8f8; padding: 60px 0; text-align: center; line-height: center;">
			
<h1>비밀번호를 찾고자하는 아이디를 입력해주세요.</h1>
<div>
<input id="id" type="text">
<button id="next" name="next" style="background-color: black; color: white; ">입력</button>
<button id="back" name="back" style="background-color: #B70000; color:white; border-color:#b70000">X</button>
</div>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>