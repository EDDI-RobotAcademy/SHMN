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
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

</head>
<body>
	
	<table class = "table table-hover">
	
	
	<thead>
	<c:if test="${member.userId != null }">	

		<tr>
			<th>구분</th> 		<!-- 일반인지 야간인지 구분 -->
			<th>예약 가능 인원</th> <!-- 남은 재고 -->
			<th>예약하기</th>
		</tr>
	</c:if>
		
	</thead>
				
	<tbody>			
		<c:if test="${member.userId != null }">	<!-- 회원일때만 -->
		<c:forEach items="${day}" var="day" >
				
			
			<tr>
				<td><a href="/sae_ticket/tkReadView?tk_bno=${day.tk_bno}">
				    <c:out value="${day.tk_name}" /></a></td>
				<td><c:out value="${day.tk_stock}" /></td>
				<td>
					<a href="/sae_ticket/tkBookPage?tk_bno=${day.tk_bno}" target="_parent" 
					id="clickAlert">예매</a>
				</td>
			</tr>	
			
		</c:forEach>
		</c:if>
		
		<c:if test="${member.userId == null }">
 			<p>로그인 후에 이용하실 수 있습니다.</p>
		</c:if>
			
		
			
	</table>
	
	<script>
		
	// $('#clickAlert').click(function(){
	//	if(){
			
	//	alert('예약이 마감되었습니다.');
	//	}
//	});   


	</script>
</body>
</html>