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
	//돌아가기 버튼을 눌렀을 때
	$("#back").on("click", function(){
		location.href = "/sae_member/findPass";
	});
});
</script>
</head>
<body>
<h1>해당 아이디는 존재하지 않는 아이디 입니다.</h1>
<button id="back" name="back">돌아가기</button>
</body>
</html>