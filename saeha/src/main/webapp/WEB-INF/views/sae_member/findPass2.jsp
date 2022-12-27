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
<script>
$(document).ready(function(){
	$("#getpass").on("click", function(){
		location.href = "/sae_member/sendmail?userMail=" + $("#findPWMAIL").val() + "&&userId=" +$("#findPWID").val();
	})
});
</script>
</head>
<body>
<h1>smtp 방식으로 비밀번호 찾는 것을 도와드리겠습니다.</h1>
<div>아이디 :&nbsp;<input id="findPWID" name="findPWID" type="text" value="${FINDPW2.userId}"></div>
<div>성 함&nbsp;&nbsp; :&nbsp;<input id="findPWNAME" name="findPWNAME" type="text" value="${FINDPW2.userName}"></div>
<div>이메일 :&nbsp;<input id="findPWMAIL" name="findPWMAIL" type="text" value="${FINDPW2.userMail}"></div>
<br>
<div>해당 이메일로 임시 비밀번호를 발급받으시겠습니까?</div>
<div><button id="getpass" type="button">발급받기</button></div>
</body>
</html>