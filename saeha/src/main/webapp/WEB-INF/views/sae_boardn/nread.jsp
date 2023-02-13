<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>공지게시판 상세보기</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
		var nform = $("form[name='readnForm']");
		
		//버튼을 누르면 게시글 수정 폼을 보여준다
      $(".nupdate_btn").on("click", function() {
         nform.attr("action", "/sae_boardn/nupdateView");
         nform.attr("method", "get");
         nform.submit();
      })
      
      //삭제
      $(".ndelete_btn").on("click", function() {
         var deleteYN = confirm("삭제하시겠습니까?");
         
         if (deleteYN == true) {
            nform.attr("action", "/sae_boardn/ndelete");
            nform.attr("method", "post");
            nform.submit();
         }
      })
	})
</script>
<body>

<div align="center">
<h1> 공지사항 </h1>

<form name="readnForm" role="form" method="post">
 <input type="hidden" id="bno" name="n_bno" value="${nread.n_bno }" />
</form>

<table border="0" width="80%" height="80">
<thead>
	<tr>
		<th height="40"><h3>${nread.n_title}</h3></th>
	</tr>
</thead>
<tbody>
	<tr>
		<th align="right"> 등록일 : <fmt:formatDate value = "${nread.n_regdate }" pattern="yyyy-MM-dd" /> </th>
	</tr>
</tbody>
<tbody>
	<tr>
		<td rows="15" cols="67"> ${nread.n_content}"</td>
	</tr>
</tbody>
</table>
<tfoot>
<c:if test="${member.userId == 'admin'}">
   <button type="button" class="nupdate_btn">수정</button>
   <button type="button" class="ndelete_btn">삭제</button>
   <button type="button"><a href="/sae_boardn/nlist">목록</a></button>
</c:if>
</tfoot>
</body>
</html>
