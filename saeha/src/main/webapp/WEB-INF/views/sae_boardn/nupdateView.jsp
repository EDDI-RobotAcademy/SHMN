<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>공지게시판 수정</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	var nform = $("form[name='nupdateForm']");
	
	//버튼을 누르면 수정됨
	$(".nupdate_btn").on("click", function() {
		nform.attr("action", "/sae_boardn/nupdate");
		nform.attr("method", "post");
		nform.submit();
	});
	$(".cancel_btn").on("click", function() {
	      event.preventDefault();
	      location.href = "/sae_boardn/nread?n_bno=${nupdate.n_bno}";       
	  });
});

</script>
<body>

<div align="center">
<h1> 공지사항 수정</h1>

<form name="nupdateForm" action="/sae_boardn/nupdate" method="post" role="form">
 <input type="hidden" name="n_bno" value="${nupdate.n_bno}" readonly="readonly" />
<table>
		<tr>
			<td>
   			<h3><label for="title">제목</label></h3>
   			<input type="text" id="title" name="n_title" value="${nupdate.n_title}" />
			</td>
		</tr>
		<tr>
			<td>
    		<h3><label for="content">내용</label></h3>
    		<textarea id="content" name="n_content" rows="15" cols="67"><c:out value="${nupdate.n_content}" /></textarea>
			</td>
		</tr>
	
		<tr>
			<td>
   			<label for="regdate" >작성 날짜</label>
   			<fmt:formatDate value="${nupdate.n_regdate }" pattern = "yyyy-MM-dd" />
			</td>
		</tr>
</table>
	
<tr>
	<td>
	<button type="submit" class="nupdate_btn">저장</button>
	<button type="button" class="cancel_btn">취소</button>
	</td>
</tr>

</form>
</div>
</body>
</html>