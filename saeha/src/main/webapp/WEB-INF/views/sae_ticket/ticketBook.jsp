e<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iframe 안 예매정보 </title>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	
	<table class = "table table-hover">
	
	<thead>
		
		<tr>
		<!-- 	<th>번호</th> -->
			<th>구분</th> <!-- 일반인지 야간인지 구분 -->
		<!--  	<th>가격</th> -->
			<th>예약 가능 인원</th><!-- 남은 재고 -->
			
			<th>예약하기</th>
		</tr>
	</thead>
				
	<tbody>				
		<c:forEach items="${day}" var="day">
	<tr>
			<!--  <td><c:out value="${day.tk_bno}" /></td>-->	
				<td><a href="/sae_ticket/tkReadView?tk_bno=${day.tk_bno}">
				    <c:out value="${day.tk_name}" /></a></td>
			<!-- 	<td><c:out value="${day.tk_price}" /></td> -->
				<td><c:out value="${day.tk_stock}" /></td>
				<td><!--  button type="button" class="book_btn" value="${ day.tk_bno}">예매하기</button>-->
				<a href="/sae_ticket/tkBookPage?tk_bno=${day.tk_bno}" target="_parent">예매</a>
				</td>
			</tr>	
				
				<td>
				<c:if test="${day.tk_bno == null }">
				<p> 예매 가능 날짜를 선택해 주세요</p>
				</c:if>
				</td>	
				<!--  	<c:if test="${member.userId == null}">
					<p>예매는 회원만 가능합니다.</p>
					</c:if>-->
			
	</c:forEach>
		

		
	</table>
	
	<script>
				//예약페이지로
			//	$(".book_btn").on("click", function(){
			//		var bno = $('.book_btn').val();
			//		location.href = "/sae_ticket/tkBookPage?tk_bno="+bno;
					
			//		})

			
			function notmember() {
				alert("로그인해");
				location.href = "sae_member/login"
			}
			</script>
			
	
</body>
</html>