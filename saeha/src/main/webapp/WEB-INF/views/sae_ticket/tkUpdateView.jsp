<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
	<div id="root">
		<header>
			<h1>수정 게시판</h1>
		</header>
			<hr />
				<form name="updateForm" role="form" method="post" action="/sae_ticket/ticketUpdate">
					<input type="hidden" name="tk_bno" value="${update.tk_bno}" readonly="readonly"/>
					<table>
						<tbody>
						<!--  <tr>
								<td>
									<label for="tk_bno">번호</label>
									<input type="text" id="tk_bno" name="tk_bno" value="${update.tk_bno}"/>
								</td>
							</tr>-->	
							<tr>
								<td>
									<label for="tk_name">구분</label>
									<input type="radio" id="tk_name" name="tk_name" value="일반"/>일반
									<input type="radio" id="tk_name" name="tk_name" value="야간"/>야간
								</td>
							</tr>	
							<tr>
								<td>
									<label for="tk_price">가격</label>
									<input type="text" id="tk_price" name="tk_price" value="${update.tk_price}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="tk_stock">예약 가능 인원</label>
									<input type="text" id="tk_stock" name="tk_stock" value="${update.tk_stock}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="tk_date">예약 날짜</label>
									<input type="date" id="tk_date" name="tk_date" value="${update.tk_date}"/>
								</td>
							</tr>	
							
			
						</tbody>			
					</table>
					<div><br><br>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			<hr />
		</div>
	</body>
</html>