<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<script>
$(document).ready(function(){
	//홈버튼
	$("#gohome").on("click", function(){
		location.href = "/sae_member/login"
	});
});
</script>
</head>
<body>
<%@include file='../include/nav.jsp' %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">

			<div class="section-heading">
				<h1>
					Success<br>
					<em>Sending</em>
				</h1>
				<p>
					Your email has been sent.
				</p>
			</div>
		<div style="width: 1100px; height: 450px; background-color: #f8f8f8; padding: 60px 0; text-align: center; line-height: center;">

<h1>메일이 전송되었습니다.</h1>
<button id="gohome" name="gohome" type="button" style="background-color: black; color: white;">홈으로</button>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>