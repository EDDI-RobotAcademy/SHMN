<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
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
    background-image: url(/resources/img/join1.png);
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
hr{background:#ebebeb;
    height:1.5px;
    border:0;}
.title{ margin-top: 60px;font-size: 20px;}
.formdiv{padding: 11px 0; display: flex;}

.formdiv label::before{
	content: "v ";
    line-height: 26px;
    color: #366ac1;
    font-size: 16px;
}
label{
/* 	border: 1px solid black; */
	height: 30px;
	width: 140px;
	}

</style>   
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//취소
	$(".cencle").on("click", function(){
		location.href = "/sae_member/login";
	});
	
	$(".delete").on("click", function(){
		
		var result = confirm("정말 탈퇴하시겠습니까?");
		if(result){
			alert("이용해주셔서 감사합니다. 더 좋은 서비스로 찾아뵙겠습니다.");
		location.href = "/sae_member/memberDelete?userId=" + $("#userId").val();
		}else{
			alert("앞으로 더 좋은 서비스로 보답하겠습니다.");
		}
	});
	
	$("#submit").on("click", function(){
		if($("#userPass").val()==""){
			alert("비밀번호를 입력해 주세요");
			$("#userPass").focus();
			return false;
		}
		
		if($("#userBirth").val()==""){
			alert("생년월일을 입력해 주세요");
			$("#userBirth").focus();
			return false;
		}
		if($("#userTel").val()==""){
			alert("전화번호를 입력해 주세요");
			$("#userTel").focus();
			return false;
		}
		if($("#userMail").val()==""){
			alert("메일을 입력해 주세요");
			$("#userMail").focus();
			return false;
		}
		if($("#userAddress").val()==""){
			alert("주소를 입력해 주세요");
			$("#userAddress").focus();
			return false;
		}
	});
});
</script>
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
		<span class="agree2">STEP.1</span>
		</div>
		
		<div>
		<div class="agree1" style="background-image: url(/resources/img/join2b.png);"><strong>정보입력</strong></div>
		<span class="agree2">STEP.2</span>
		</div>
	
		<div>
		<div class="agree" style="background-image: url(/resources/img/join3g.png);"><strong>가입완료</strong></div>
		<span class="agree2">STEP.3</span>
		</div>
	</div>
	<!--회원가입 -->
	<div style="width:85%;">
		<div class="title">개인정보</div>
		<hr>
		<section id="container">
		<form action="/sae_member/memberUpdate" method="post">
		
		<div class="formdiv">
			<label for="userId">아이디</label>
			<input  type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly">
		</div>
		<hr>
		<div class="formdiv">
			<label  for="userPass">패스워드</label>
			<input  type="password" id="userPass" name="userPass" value="${member.userPass}"/>
		</div>
		<hr>
		<div class="formdiv">
			<label for="userName">성명</label>
			<input  type="text" id="userName" name="userName" value="${member.userName}" readonly="readonly"/>
		</div>
		<hr>
		<div class="formdiv">
			<label for="userBirth">생년월일</label>
			<input  type="text" id="userBirth" name="userBirth" value="${member.userBirth}" readonly="readonly"/>
		</div>
		<hr>
		<div class="formdiv">
			<label  for="userTel">전화번호</label>
			<input  type="text" id="userTel" name="userTel" value="${member.userTel}" />
		</div>
		<hr>
		<div class="formdiv">
			<label  for="userMail">메일</label>
			<input  type="text" id="userMail" name="userMail" value="${member.userMail}" />
		</div>
		<hr>
		<div class="formdiv">
			<label  for="userAddress">주소</label>
			<input  type="text" id="userAddress" name="userAddress" value="${member.userAddress}" />
		</div>
		<hr>
		<div style="text-align: center;">
			<button  type="button" id="delete" name="delete"
			style=" height: 45px; padding: 12px 18px; background-color: grey;color:white;">회원 탈퇴</button>
			<button  type="submit" id="submit" 
			style=" height: 45px; padding: 12px 18px; background-color: black;color:white;">회원정보수정</button>
		</div>
	</form>
	</section>
</div>
</div>
</body>
</html>