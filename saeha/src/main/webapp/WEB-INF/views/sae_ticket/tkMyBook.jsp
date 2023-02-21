<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
</head>
<body>
<div name="removefrm">

<header>
	<h1>예약 내역</h1>
</header>

<hr />
	
	<c:set var="sum" value="0" />
	<c:forEach var="booklist" items="${booklist}" >

	

	<td><c:out value="${vo.tk_name}"></c:out></td>
	<td><c:out value="${booklist.bt_age}"></c:out></td>
	<td><c:out value="${booklist.bt_count}"></c:out>개</td>
	<td><c:out value="${booklist.bt_price}"></c:out>원</td>
	<a href="/sae_ticket/bookdelete?bt_bno=${booklist.bt_bno }&count=${booklist.bt_count}&bt_pno=${booklist.bt_pno}" 
	type="button" class="delete_btn" onclick="removeCheck()">취소</a><br />
	<c:set var="sum" value="${sum + booklist.bt_count * booklist.bt_price }" />
	</c:forEach>
	<hr>
	<td>합계: <c:out value="${sum }" />원</td>

	<br />
	<td>
	<button><a href="/sae_ticket/ticketList">목록으로</a></button>
	
	<button type="button" onclick="#">결제하기</button>
	</td>
</div>
<script>
function removeCheck(){
	if(confirm("정말 취소하시겠습니까?") == true){ //확인
		alert("취소가 완료되었습니다.");
		document.removefrm.submit();
		
	}else{//취소
		return ;
	}
}


</script>
</body>
</html>