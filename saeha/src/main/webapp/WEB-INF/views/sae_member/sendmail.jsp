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
	//홈버튼
	$("#gohome").on("click", function(){
		location.href = "/sae_member/login"
	});
});
</script>
</head>
<body>
<h1>메일이 전송되었습니다.</h1>
<button id="gohome" name="gohome" type="button">홈으로</button>
</body>
</html>