<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 등록</title>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
</head>
<script type="text/javascript">

$(document).ready(function() {
	var formObj = $("form[name='writeForm']");
	
	$(".write_btn").on("click", function() {
		
	
	formObj.attr("action", "/sae_ticket/tkWrite");
	formObj.attr("method", "post");
	formObj.submit();
	});
})
</script>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;입장권 등록
				</h1>
	</div>
<div id = "root">
	<form action="/sae_ticket/tkWrite" name = "writeForm" method="POST">
	<table style="width:50%;">
		
	<!--  	<tr><td>
			<label for= "tk_bno">입장권 번호</label><input type="text" id="tk_bno" name="tk_bno" />
			</td>
		</tr>-->
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;<label for= "tk_name">입장 분류</label></td>
			<td>
				<input type="radio" value="일반" id="tk_name" name="tk_name"> 일반 
				<input type="radio" value="야간" id="tk_name" name="tk_name"> 야간
			</td>
		</tr>
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td>
			&nbsp;&nbsp;<label for= "tk_price">가격</label></td>
			<td><input type="text" id="tk_price" name="tk_price"/>
			</td>
		</tr>
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td>
			&nbsp;&nbsp;<label for= "tk_stock">예약 가능 인원</label></td>
			<td><input type="text" id="tk_stock" name="tk_stock"  />
			</td>
		</tr>
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td>
			&nbsp;&nbsp;<label for= "tk_date">예약 날짜</label></td>
			<td><input type="date" id="tk_date" name="tk_date"  />
			</td>
		</tr>

		<tr style="height: 70px;">	
			<td style="text-align: right;">
			<button class="write_btn" type="submit" style="background-color: #45489a; color: white; border-color: #45489a;">작성</button>&nbsp; 
			</td>
			<td>&nbsp;
			<input type="button" value="뒤로" onclick="history.back(-1)" style="background-color: #45489a; color: white; border-color: #45489a;">
			</td>
		</tr>
		
		
	</table>
	</form>
	</div>
	</div>
	</div>
	<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>
	