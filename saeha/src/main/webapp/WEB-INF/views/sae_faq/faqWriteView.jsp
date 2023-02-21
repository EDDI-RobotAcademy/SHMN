
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 등록</title>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
</head>
<body>

<script type="text/javascript">

	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		
		$(".write_btn").on("click", function() {
			
		
		formObj.attr("action", "/sae_faq/faqWrite");
		formObj.attr("method", "post");
		formObj.submit();
		});
	})
</script>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;공지사항 등록
				</h1>
	</div>

	<form action="/sae_faq/faqWrite" name = "writeForm" method="POST">
<table style="width: 60%;">
		
		<tr>
		<td>
<input style="width: 100%; height: 40px" type="text" id="title" name="faq_title" title="제목을 입력하세요." />
		</td>
		</tr>
		<tr>
			<td>
		<textarea id="content"  style="height: 400px;width:100%;" name = "faq_content"  title="내용을 입력하세요." ></textarea>
			</td>
		</tr>
		<tr>	
			<td style="text-align: right;">
			<button class="write_btn" type="submit" style="background-color: #45489a; color: white; border-color: #45489a;">작성</button> &nbsp;
			<input type="button" value="뒤로" onclick="history.back(-1)" style="background-color: #45489a; color: white; border-color: #45489a;">
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

