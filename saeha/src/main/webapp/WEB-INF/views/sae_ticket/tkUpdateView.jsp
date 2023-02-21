<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
<title>수정 게시판</title>
</head>
<script type="text/javascript">
		
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
			
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/sae_ticket/ticketList";
			})	
		})
</script>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;입장권 수정 게시판
				</h1>
	</div>
	<div id="root">
				<form name="updateForm" role="form" method="post" action="/sae_ticket/ticketUpdate">
					<input type="hidden" name="tk_bno" value="${update.tk_bno}" readonly="readonly"/>
						<table style="width:50%;">
						<!--  <tr>
								<td>
									<label for="tk_bno">번호</label>
									<input type="text" id="tk_bno" name="tk_bno" value="${update.tk_bno}"/>
								</td>
							</tr>-->	
							<tr style="border-bottom: 1px solid #ccc; height: 70px;">
								<td style="width: 30%;">
			&nbsp;&nbsp;
									<label for="tk_name">구분</label></td>
			<td>
									<input type="radio" id="tk_name" name="tk_name" value="일반"/>일반
									<input type="radio" id="tk_name" name="tk_name" value="야간"/>야간
								</td>
							</tr>	
							<tr style="border-bottom: 1px solid #ccc; height: 70px;">
								<td style="width: 30%;">
			&nbsp;&nbsp;
									<label for="tk_price">가격</label></td>
			<td>
									<input type="text" id="tk_price" name="tk_price" value="${update.tk_price}"/>
								</td>
							</tr>	
							<tr style="border-bottom: 1px solid #ccc; height: 70px;">
								<td style="width: 30%;">
			&nbsp;&nbsp;
									<label for="tk_stock">예약 가능 인원</label></td>
			<td>
									<input type="text" id="tk_stock" name="tk_stock" value="${update.tk_stock}"/>
								</td>
							</tr>	
							<tr style="border-bottom: 1px solid #ccc; height: 70px;">
								<td style="width: 30%;">
			&nbsp;&nbsp;
									<label for="tk_date">예약 날짜</label></td>
			<td>
									<input type="date" id="tk_date" name="tk_date" value="${update.tk_date}"/>
								</td>
							</tr>	
							<tr style="height: 70px;">	
			<td style="text-align: right;">
			<button class="update_btn" type="submit" style="background-color: #45489a; color: white; border-color: #45489a;">저장</button>&nbsp; 
			</td>
			<td>&nbsp;
<button class="cancel_btn" type="submit" style="background-color: #45489a; color: white; border-color: #45489a;">취소</button>
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