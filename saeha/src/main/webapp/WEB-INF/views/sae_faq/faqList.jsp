<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<title>FAQ</title>
</head>
<body>
	<div class="container">
		<header>
			<h1>자주 묻는 질문</h1>
		</header>
		<hr />
		
		<section id = "container">
		<form action="role" method="get">
		<table class = "table table-hover">

		 		<thead>
					<tr>
					 <th>번호</th>
					 <th>제목</th>
					 <th>상세내용</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="list">
				<!-- 컨트롤러에서 이름을 list로 정한 service.list()를 가져옴.  var은 ${list}를 list라는 이름으로 선언한 것. -->
					<tr>
				 		 <td><c:out value="${list.faq_bno}" /></td>
						 <td><a href="/sae_faq/faqReadView?faq_bno=${list.faq_bno}">
						     <c:out value="${list.faq_title}" /></a></td>
						 <td><c:out value="${list.faq_content}" /></td>
					</tr>
					<!-- 그리고 out으로 뿌려줌 -->
					
				</c:forEach>
			
		
			 <c:if test = "${member.userId == 'admin' }"> 
      			<button><a href="/sae_faq/faqWriteView">관리자 글 등록</a></button>
   			 </c:if>
   			
   			</table>	
			<div>
			<a href="/sae_faq/faqWriteView">글 작성</a>
			</div>
	</form>
	</section>
	</div>
</body>
</html>