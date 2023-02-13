<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>수정 게시판</title>	
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
	
		<div id="root">
			<header>
				<h1>수정 게시판</h1>
			</header>
			<hr />
				<form name="updateForm" role="form" method="post" action="/sae_faq/faqupdate">
					<input type="hidden" name="faq_bno" value="${update.faq_bno}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="faq_title"
																		 value="${update.faq_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="faq_content">
																			<c:out value="${update.faq_content}" /></textarea>
								</td>
							</tr>
			
						</tbody>			
					</table>
					<div><br><br>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			<hr />
		</div>
	</body>
</html>