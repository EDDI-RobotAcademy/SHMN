<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
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
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;공지사항 수정
				</h1>
	</div>

<form name="nupdateForm" action="/sae_boardn/nupdate" method="post" role="form">
 <input type="hidden" name="n_bno" value="${nupdate.n_bno}" readonly="readonly" />
<table style="width: 60%;">
		<tr>
			<td style="width: 100%; height: 40px;">
   			<label for="regdate" >작성 날짜</label>
   			<fmt:formatDate value="${nupdate.n_regdate }" pattern = "yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<td>
   			<input style="width: 100%; height: 40px;" type="text" id="title" name="n_title" value="${nupdate.n_title}" />
			</td>
		</tr>
		<tr>
			<td>
    		<textarea style="height: 400px;width:100%;" id="content" name="n_content" rows="15" cols="67"><c:out value="${nupdate.n_content}" /></textarea>
			</td>
		</tr>
	
	
<tr>
	<td style="text-align: right;">
	<button style="background-color: #45489a; color: white; border-color: #45489a;" type="submit" class="nupdate_btn">저장</button>&nbsp;
	<button type="button" class="cancel_btn" style="background-color: #45489a; color: white; border-color: #45489a;">취소</button>
	</td>
</tr>
</table>

</form>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>