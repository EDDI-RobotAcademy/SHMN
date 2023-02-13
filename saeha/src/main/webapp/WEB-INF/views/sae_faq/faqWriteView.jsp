
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 등록</title>
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
<div id = "root">
	<header>
		<h1>faq 등록</h1>
	</header>
		<hr />
	

	<form action="/sae_faq/faqWrite" name = "writeForm" method="POST">
	<table>
	<tbody>
		
		<tr><td>
			<label for= "title">제목</label><input type="text" id="title" name="faq_title" title="제목을 입력하세요." />
			</td>
		</tr>
		<tr>
			<td>
			<label for = "content">내용</label><textarea id="content" name = "faq_content"  title="내용을 입력하세요." ></textarea>
			</td>
		</tr>
		<tr>	
			<td>
			<button class="write_btn" type="submit">작성</button> 
			<input type="button" value="뒤로" onclick="history.back(-1)">
			</td>
		</tr>
		
		
	</tbody>
	</table>
	</form>
	</div>
</body>
</html>

