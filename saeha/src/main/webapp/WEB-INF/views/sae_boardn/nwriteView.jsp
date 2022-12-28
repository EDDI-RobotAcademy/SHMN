<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var nform = $("form[name='nwriteForm']")
	
	$(".nwrite_btn").on("click", function(){
		nform.attr("action", "/sae_boardn/nwrite");
		nform.attr("method", "post");
		nform.submit();
		});
	});
</script>
<body>

<div align="center">
<h1>공지사항 등록</h1>

<form method="post" action="/sae_boardn/nwrite">
<!-- 게시판에 이미지 업로드를 위해 multipart/form-data 추가-->
<table>
		<tr>
			<td>
			<h3><label for="title">제목</label></h3>
			<input type="text" id="title" name="n_title" />
			</td>
		</tr>
		<tr>
			<td>
			<h3><label for="content">내용</label></h3>
			<textarea id="content" name="n_content" rows="15" cols="67"></textarea>
			</td>
		</tr>
<!-- 		
		<tr>
			<td>
			<label for="file">이미지</label>
			<input type="file" id="file" name="n_file" accept="image/*" value="파일 첨부"  />
			</td>
		</tr>
		 -->
		<tr>
			<td>
			<button class="nwrite_btn" type="submit">등록</button>
			<!-- 글 등록 버튼  -->
			</td>
		</tr>
</table>
</form>
</div>
</body>
</html>