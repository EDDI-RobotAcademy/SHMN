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
<h1>비밀번호를 찾고자하는 아이디를 입력해주세요.</h1>
<div><input id="id" type="text"></div>
<button id="next" name="next">입력</button>
<button id="back" name="back">뒤로가기</button>
</body>
</html>