<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>faq 수정 게시판</title>	
</head>
	<script type="text/javascript">
		
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
			
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/sae_faq/faqList";
			})
	
		})
	
	</script>
	<body>
	<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;수정 게시판
				</h1>
	</div>
	
				<form name="updateForm" role="form" method="post" action="/sae_faq/faqupdate">
					<input type="hidden" name="faq_bno" value="${update.faq_bno}" readonly="readonly"/>
					<table style="width: 60%;">
							<tr>
								<td>
<input style="width: 100%; height: 40px" type="text" id="title" name="faq_title" value="${update.faq_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
<textarea id="content" name="faq_content" style="height: 400px;width:100%;"><c:out value="${update.faq_content}" /></textarea>
								</td>
							</tr>
			<tr>
<td style="text-align: right;">		

						<button type="submit" class="update_btn" style="background-color: #45489a; color: white; border-color: #45489a;">저장</button> &nbsp;
						<button type="submit" class="cancel_btn" style="background-color: #45489a; color: white; border-color: #45489a;">취소</button>
</td></tr>
					</table>
				</form>
		</div>
		</div>
			<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
	</body>
</html>