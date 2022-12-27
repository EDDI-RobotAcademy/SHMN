<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
<style type="text/css">
body{justify-content: center; margin: 0 auto;width:100%;}
.user-wrap {
	background-image: url(/resources/img/login_bnr.jpeg);
	height: 300px;
    background-size: cover;
    background-position: 50% 50%;
	}

.login_text{
	position: absolute;
	top: 35%;
	left:50%;
	width:100%;
	transform: translate(-50%,-50%);
	font-size: 48px;
	text-align: center;
	color:white;
}
.agree{
    border: 2px solid #ebebeb;
    color: #505050;
    width: 200px;
    height: 35px;
    text-align: center;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-position-x: 50%;
    background-position-y: 25px;
    padding-top: 100px;
    background-size: 56px;
}
.agree1{
 	border: 2px solid black;
    width: 200px;
    height: 35px;
    text-align: center;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-position-x: 50%;
    background-position-y: 25px;
    padding-top: 100px;
    background-size: 56px;
}
.agree2{
	color: #808080;
    font-size: 15px;
    margin-top: 10px;
    display: block;
    text-align: center;
}

</style>
</head>
<body>

<%@include file='../include/nav.jsp' %>

<div class="user-wrap">
<div class="login_text"><p>회원가입</p></div>
</div>

<div style="padding:60px 0; height: 100%;">

	<!--아이콘박스 -->
	<div style="display: flex; width: 720px;">
		<div>
		<div class="agree" style="background-image: url(/resources/img/join1g.png);"><strong>약관동의</strong></div>
		<span class="agree2">STEP.2</span>
		</div>
		
		<div>
		<div class="agree" style="background-image: url(/resources/img/join2g.png);"><strong>정보입력</strong></div>
		<span class="agree2">STEP.3</span>
		</div>
	
		<div>
		<div class="agree1" style="background-image: url(/resources/img/join3b.png);"><strong>가입완료</strong></div>
		<span class="agree2">STEP.4</span>
		</div>
	</div>

<div style="width:85%; margin-top: 50px;">
	<div style="    
	border: 1px solid #ebebeb;
    border-left: 3px solid black;
    padding: 25px;
    line-height: 26px;">
	. 회원님의 비밀번호는 아무도 알 수 없는 암호화 코드로 저장되므로 안심하셔도 좋습니다.<br>
	. 아이디, 비밀번호 분실시에는 회원가입시 입력하신 이메일 주소를 이용하여 찾을 수 있습니다.<br>
	. 회원 탈퇴는 언제든지 가능하며 일정기간이 지난 후, 회원님의 정보는 삭제하고 있습니다.
	</div>
	
	<div style="border: 2px solid black; display:flex; text-align: center; margin-top: 50px;">
		<div style="width:50%; padding:20px 18px; border-right: 1px solid #ebebeb;">아이디</div>
		<div style="width:50%; padding:20px 18px; ">이메일</div>
	</div>

	<div style="border-bottom: 1px solid #ebebeb; display:flex; text-align: center;">
		<div style="width:50%; padding:20px 18px; border-right: 1px solid #ebebeb;">${register.userId}</div>
		<div style="width:50%; padding:20px 18px;">${register.userMail}</div>
	</div>
	<div style="text-align: center; margin-top: 20px;">
		<a href="/"><button  style=" height: 45px; padding: 12px 18px; background-color: black;color:white;">확인</button></a>
	</div>

</div>

</div>
</body>
</html>