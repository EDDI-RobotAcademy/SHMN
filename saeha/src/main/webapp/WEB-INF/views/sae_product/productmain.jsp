<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>상품 메인 페이지</title>
</head>
<body>
	
	<div>
	<c:if test = "${member.userId == 'admin' }"> 
		<button><a href="/sae_product/registerView">상품 등록</a></button>
	</c:if>
	</div>
	
	<div>
		<button><a href="/">메인페이지로</a></button>
	</div>
	
	<a href="/sae_product/goodslist">굿즈 상품 보기</a>
	<a href="/sae_product/hanboklist">한복 상품 보기</a>
</body>
</html>