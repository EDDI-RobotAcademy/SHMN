<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
</head>
    <!--  jQuery, bootstrap -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width: 90%;">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;공지사항 등록
				</h1>
	</div>


<form method="post" action="/sae_boardn/nwrite">
<!-- 게시판에 이미지 업로드를 위해 multipart/form-data 추가-->
<table style="width: 90%;">
		<tr>
			<td>
			<input style="width: 100%; height: 40px" type="text" id="title" name="n_title" value="제목을 입력해주세요." />
			<br><br>
			</td>
		</tr>
		<tr>
			<td>
				<div id="content" name="n_content"></div>
				<script type="text/javascript">
	// 메인화면 페이지 로드 함수
    $(document).ready(function () {
        $('#content').summernote({
            placeholder: '내용을 작성하세요.',
            height: 400,
            maxHeight: 400
        });
    });
	</script>
			<!-- <textarea id="content" name="n_content" rows="15" cols="67" style="height: 400px;width:100%;"></textarea>
			</textarea> -->
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">
			<br>
			<button class="nwrite_btn" type="submit" style="background-color: #45489a; color: white; border-color: #45489a;">등록</button>
			<!-- 글 등록 버튼  -->
			<input type="button" value="뒤로" onclick="history.back(-1)" style="background-color: #45489a; color: white; border-color: #45489a;">
			</td>
		</tr>
</table>
</form>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>