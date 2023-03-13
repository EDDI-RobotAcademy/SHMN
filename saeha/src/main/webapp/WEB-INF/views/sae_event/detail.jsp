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
<title>응모한 사진 상세보기</title>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Golos+Text&family=Hahmlet:wght@300&display=swap')
	;
</style>
<body>
	<%@include file="../include/nav.jsp"%>
	<div class="page-content">
		<div style="width: 90%">
			<div style="padding: 60px 0; height: 100%;">
				<div class="container">
						<h1>응모한 사진 상세보기</h1>
					<hr />
					<div class="form-group"
						style="font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif;">
						<label for="title" class="col-sm-2 control-laber">제목</label> <input
							type="text" id="title" name="gwTitle" class="form-control"
							value="${detailView.et_title}" readonly="readonly"
							style="background-color: #ffffff; border: 0px solid #ffffff; font-size: 16px" />
					</div>
					<div style="display:flex">
						<div style="width:15%"></div>
						<div
							style="width:70%; font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif;">
							<img style="width: 100%; align: center"
								src="/resources/eventimg/${detailView.et_file}" />
						</div>
						<div style="width:15%"></div>
					</div>
					<br>
					<div class="form-group"
						style="font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif;">
						<label for="writer" class="col-sm-2 control-laber">작성자</label> <input
							type="text" id="writer" name="gwWriter" class="form-control"
							value="${detailView.et_writer}" readonly="readonly"
							style="background-color: #ffffff; border: 0px solid #ffffff; font-size: 16px" />
					</div>
					<div class="form-group"
						style="font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif;">
						<label for="content" class="col-sm-2 control-laber">내용</label>
						<textarea id="content" name="gwContent" class="form-control"
							readonly="readonly"
							style="background-color: #ffffff; border: 0px solid #ffffff; font-size: 16px"><c:out
								value="${detailView.et_content}" /></textarea>
					</div>
					<div align="right">
						<c:if
							test="${member.userId eq detailView.et_memberid || member.userId eq 'admin' }">
							<a href="/sae_event/delete?bno=${detailView.et_bno }">삭제</a>
						</c:if>
						<a href="/sae_event/main">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
	</footer>
</body>
</html>