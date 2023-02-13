<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>공지게시판</title>
</head>
<body>
<div align="center">
<header>
<h1> 공지게시판 </h1>
</header>
<form role="form" method="get" >
<table border="0" width="80%">
<thead>
	<tr>
		<th width="8%" height="40">번호</th>
		<th>제목</th>
		<th width="13%">등록일</th>
	<!--<th>이미지</th>-->	
	</tr>
</thead>
<tbody>
	<c:forEach var="nlist" items="${nlist}">
	<!-- 받은 items값만큼 반복 컨트롤러에서 설정한 이름 -->
	<tr>
		<td height="35"><c:out value="${nlist.n_bno}" /></td>
		<td><a href="/sae_boardn/nread?n_bno=${nlist.n_bno}"><c:out value=" ${nlist.n_title} " /></a></td>
	<%-- <td><c:out value="${nlist.n_content}" /></td> --%>
		<td><fmt:formatDate value="${nlist.n_regdate}" pattern="yyyy-MM-dd" /></td>
	<!--<td><input name="n_file" src="${nlist.n_file}" /></td>-->		
	</tr>
	</c:forEach>
</tbody>
</table>
<tfoot>
<c:if test="${member.userId == 'admin'}">
<button type="button"><a href="/sae_boardn/nwriteView">글 등록</a></button>
</c:if>
</tfoot>
</form>
</div>
</body>
</html>