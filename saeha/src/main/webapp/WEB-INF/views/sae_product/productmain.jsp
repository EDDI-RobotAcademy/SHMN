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
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Golos+Text&family=Hahmlet:wght@300&display=swap')
	;

table {
	border-spacing: 20px;
}
</style>
<body>

	<%@include file='../include/nav.jsp'%>
	<div class="page-content">
		<div style="width: 90%; margin-left: 60px;">
			<div style="padding: 60px 0; width: 90%; height: 40%;">
				<div class="section-heading" style="margin-bottom: 0px">
					<h1>
						SAE-HA<br> <em>Shop</em>
					</h1>
					<p>
						It's a shop in Saehamano.<br> It consists of hanbok and
						products. Take a look.
					</p>
					<hr style="border: 3px solid #b4c3ff">
					<br>
				</div>

				<table style="text-align: center;">
					<div style="display: flex">
						<!-- 
						 -->
						<div>
							<a href="/sae_product/goodslist"><img
								style="width: 500px; height: 366px"
								src="/resources/img/product4.jpg"></a>
							<div>
								<h1 style="font-family: 'Hahmlet', serif; margin-top: 0px"
									align="center">Goods</h1>
							</div>
						</div>

						<div style="width: 2%"></div>
						<div>
							<a href="/sae_product/hanboklist"><img
								style="width: 500px; height: 366px"
								src="/resources/img/product3.jpg"></a>
							<div>
								<h1 style="font-family: 'Hahmlet', serif; margin-top: 0px"
									align="center">Hanbok</h1>
							</div>
						</div>
					</div>
				</table>
				<div class="section-heading" style="float:right">
					<c:if test="${member.userId == 'admin' }">
						<a href="/sae_product/registerView"><button>상품 등록</button></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
	</footer>
</body>
</html>