<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
</head>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#year").on("change", function(){
			var month = $("#month").val();
			if(month<10)
		{
				month = "0" + month;
		}
			var day = $("#day").val();
			if(day<10)
		{
				day = "0" + day;
		}
			var Birth = $("#year").val()+month+day;
			$("#userBirth").val(Birth);
			var year = $("#year").val();// 2015를 선택
			var now = new Date(); //현재 날짜 및 시간 2022
			var cur_year = now.getFullYear(); //연도 //현재나이 8살 now - year + 1
			if(cur_year - year + 1 < 6)
			{
				$("#type").text("미취학 회원입니다.");
			}
			else if(cur_year - year + 1 < 14)
			{
				$("#type").text("어린이 회원입니다.");
			}
			else if(cur_year - year + 1 < 25)
			{
				$("#type").text("청소년 회원입니다.");
			}
			else if(cur_year - year + 1 < 65)
			{
				$("#type").text("성인 회원입니다.");
			}
			else
			{
				$("#type").text("노인 회원입니다.")		
			}
		})
		$("#month").on("change", function(){
			var month = $("#month").val();
			if(month<10)
		{
				month = "0" + month;
		}
			var day = $("#day").val();
			if(day<10)
		{
				day = "0" + day;
		}
			var Birth2 = $("#year").val()+month+day;
			$("#userBirth").val(Birth2);
		})
		$("#day").on("change", function(){
			var month = $("#month").val();
			if(month<10)
		{
				month = "0" + month;
		}
			var day = $("#day").val();
			if(day<10)
		{
				day = "0" + day;
		}
			var Birth3 = $("#year").val()+month+day;
			$("#userBirth").val(Birth3);
		})
		$("#userId").on("keyup", function(){
			var xhr = new XMLHttpRequest();
			
			xhr.open("GET", "http://localhost:8080/over?userId="+$("#userId").val(), true);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					$("#over1").text(xhr.responseText);
					
					var over1 = xhr.responseText;
					if(over1 == "사용할 수 있는 ID입니다."){
						$("#over1").attr("style", "color:#3333FF");
					}else{
						$("#over1").attr("style", "color:#FF0099");
					}
				}
			}
		})
		$("#userPass").on("keyup", function(){
			if($("#userPass").val() == $("#userPass2").val()){
				$("#warning").text("비밀번호가 일치합니다.");
				$("#warning").attr("style", "color:#3333FF");
			}else{
				$("#warning").attr("style", "color:#FF0099");
				$("#warning").text("비밀번호가 일치하지 않습니다.");
			}
		})
		$("#userPass2").on("keyup", function(){
			if($("#userPass").val() == $("#userPass2").val()){
				$("#warning").text("비밀번호가 일치합니다.");
				$("#warning").attr("style", "color:#3333FF");
			}else{
				$("#warning").attr("style", "color:#FF0099");
				$("#warning").text("비밀번호가 일치하지 않습니다.");
			}
		})
		$("#submit").on("click", function() {
			if ($("#userId").val() == "") {
				alert("아이디를 입력해 주세요.");
				$("#userId").focus();
				return false;
			}
			if ($("#userPass").val() == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#userPass").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("성명을 입력해 주세요");
				$("#userName").focus();
				return false;
			}
			if ($("#userBirth").val() == "") {
				alert("생년월일을 입력해 주세요");
				$("#userBirth").focus();
				return false;
			}
			if ($("#userTel").val() == "") {
				alert("휴대전화 번호를 입력해 주세요");
				$("#userTel").focus();
				return false;
			}
			if ($("#userMail").val() == "") {
				alert("이메일을 입력해 주세요");
				$("#userMail").focus();
				return false;
			}
			if ($("#userAddress").val() == "") {
				alert("주소를 입력해 주세요");
				$("#userAddress").focus();
				return false;
			}
		});
		
		var nansu;
		var smsnansu=false;
		$("#send-one").on("click", function(){
			var xhr = new XMLHttpRequest();
		
			xhr.open("GET", "http://localhost:8080/send-one?userTel="+$("#userTel").val(), true);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					nansu = xhr.responseText;
					alert("인증번호가 전송되었습니다.");
				}
			}
			
		});
		$("#send-two").on("click", function(){
			var sms = $("#checksms").val();
			
			if(sms == nansu){
				alert("인증이 완료되었습니다.");
				smsnansu=true;
			}else{
				alert("인증에 실패했습니다.")
				smsnansu=false;
			}
		});
		$("#aaa").submit(function(){
			
			if(smsnansu == true){
		
			}else{
				alert("인증번호를 확인해주세요.");
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
		<form action="/sae_member/register" method="post">
		
			<div class="formdiv">
				<label  for="userId">아이디</label>
				<input	 type="text" id="userId" name="userId" />
				<span id="over1">&nbsp;&nbsp;&nbsp;</span>
			</div>
			<hr>
			<div class="formdiv">
				<div style="width:40%;display:flex;">
				<label  for="userPass">비밀번호</label> 
				<input type="password" id="userPass" name="userPass" />
				</div>
				<div style="width:60%;display:flex;">
				<label  for="userPass2">비밀번호 확인</label>
			    <input	type="password" id="userPass2" name="userPass2" />
				<div id="warning" name="warning" style="padding-top: 10px;"></div>
			    </div>
			</div>
			<hr>
			<div class="formdiv">
				<label for="userBirth"> 생년월일</label>
				
				 <select
					id="year" name="year">
					<% for (int i = 1900; i< 2023; i++)
					{
					%>
					<option value="<%=i %>"><%=i %>년</option>
					<%
					}
					%>
				</select> &nbsp;
					 <select
					id="month" name="month">
					<% for (int i = 1; i< 13; i++)
					{
					%>
					<option value="<%=i %>"><%=i %>월</option>
					<%
					}
					%>
				</select> &nbsp;
					 <select
					id="day" name="day">
					<% for (int i = 1; i< 32; i++)
					{
					%>
					<option value="<%=i %>"><%=i %>일</option>
					<%
					}
					%>
				</select> &nbsp;&nbsp;
				<input  type="text" id="userBirth" name="userBirth" readonly/>
				<div id="type" name="type">&nbsp;&nbsp;&nbsp;</div>
			</div>
			
			
			<hr>
			<div class="formdiv">
				<label class="control-label" for="userName"> 성명</label>
				<input type="text" id="userName" name="userName" />
			
			</div>
			<hr>
			<div class="title">연락처</div>
			<hr>
			<div class="formdiv">
				<label for="userAddress">주소</label>
				<input type="text" id="userAddress"	name="userAddress" />
			</div>
			<hr>
			<div class="formdiv">
				<div style="width:50%;display:flex;">
				<label  for="userTel"> 전화번호</label> 
				<input type="tel"  id="userTel" name="userTel" 
				 placeholder="01012345678형식을 맞춰주세요" />
				&nbsp;&nbsp;
				<button id="send-one" type="button">인증번호 받기</button>
				</div>
				<div style="width:50%;display:50%;">
				<input id="checksms" type="text" placeholder="인증번호를 입력해주세요">
				&nbsp;&nbsp;
				<button id="send-two" type="button">인증확인</button>
				</div>			
			</div>
			<hr>
			<div class="formdiv">
				<label  for="userMail"> 메일</label> 
				<input type="email" id="userMail" name="userMail" placeholder="email@address" />
			</div>
			<hr>
			
			<div style="text-align: center;">
				<button  type="button" style=" height: 45px; padding: 12px 18px;background-color: white;">취소</button>
				<button  type="submit" id="submit" style=" height: 45px; padding: 12px 18px; background-color: black;color:white;">회원가입</button>
			</div>
			
		</form>
	</section>
	</div>
</div>
</body>
</html>