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
<div>
	<c:set var="sum" value="0" />
	<c:forEach var="booklist" items="${booklist}" >
	<td><c:out value="${booklist.bt_age}"></c:out></td>
	<td><c:out value="${booklist.bt_count}"></c:out>개</td>
	<td><c:out value="${booklist.bt_price}"></c:out>원</td><br />
	<a href="/sae_ticket/bookdelete?bt_bno=${booklist.bt_bno }&count=${booklist.bt_count}&bt_pno=${booklist.bt_pno}" type="button" class="delete_btn">취소</a>
	<c:set var="sum" value="${sum + booklist.bt_count * booklist.bt_price }" />
	</c:forEach>
	<td><c:out value="${sum }" /></td>
	
</div>

</body>
</html>