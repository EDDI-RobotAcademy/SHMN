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
s">
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
	$("#getpass").on("click", function(){
		location.href = "/sae_member/sendmail?userMail=" + $("#findPWMAIL").val() + "&&userId=" +$("#findPWID").val();
	})
});
</script>
</head>
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
				We will help you find the password using smtp method<br>
				Would you like to receive a temporary password to that email?
				</p>
			</div>
		<div style="width: 1100px; height: 450px; background-color: #f8f8f8; padding: 60px 0; text-align: center; line-height: center;">

<h1>smtp 방식으로 비밀번호 찾는 것을 도와드리겠습니다.</h1>
<div>아이디 :&nbsp;<input id="findPWID" name="findPWID" type="text" value="${FINDPW2.userId}"></div>
<div>성 함&nbsp;&nbsp; :&nbsp;<input id="findPWNAME" name="findPWNAME" type="text" value="${FINDPW2.userName}"></div>
<div>이메일 :&nbsp;<input id="findPWMAIL" name="findPWMAIL" type="text" value="${FINDPW2.userMail}"></div>
<br>
<div>해당 이메일로 임시 비밀번호를 발급받으시겠습니까?</div>
<div>
<button id="getpass" type="button" style="background-color: black; color: white;">발급받기</button>
</div>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>