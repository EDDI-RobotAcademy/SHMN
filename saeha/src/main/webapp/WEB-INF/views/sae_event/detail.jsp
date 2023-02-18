<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판 readView</title>
</head>

<body>

	<div class="container">
		<header>
			<h1>응모한 사진 상세보기</h1>
		</header>
		<hr />


		<section id="container">

			<div class="form-group">
				<label for="title" class="col-sm-2 control-laber">제목</label> <input
					type="text" id="title" name="gwTitle" class="form-control"
					value="${detailView.et_title}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-laber">내용</label>
				<textarea id="content" name="gwContent" class="form-control"
					readonly="readonly"><c:out
						value="${detailView.et_content}" /></textarea>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-laber">작성자</label> <input
					type="text" id="writer" name="gwWriter" class="form-control"
					value="${detailView.et_writer}" readonly="readonly" />
			</div>

			<div><img style="width:70%" src="/resources/eventimg/${detailView.et_file}" /></div>
			<div>
				<c:if
					test="${member.userId eq detailView.et_memberid || member.userId eq 'admin' }">
					<a href="/sae_event/delete?bno=${detailView.et_bno }">삭제</a>
				</c:if>
				<a href="/sae_event/main">목록</a>
			</div>
</body>
</html>