<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>FAQ</title>
</head>
<body>
<<<<<<< Updated upstream
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;관람안내<br><Br>
				</h1>
=======
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
      			<button><a href="/sae_faq/faqWriteView">글 등록</a></button>
   			 </c:if>
   			
   			</table>	
			
	</form>
	</section>
>>>>>>> Stashed changes
	</div>

		<form action="role" method="get">
		<c:forEach items="${list}" var="list">
		<!-- 컨트롤러에서 이름을 list로 정한 service.list()를 가져옴.  var은 ${list}를 list라는 이름으로 선언한 것. -->

      <div class="faq-question">
        <input id="<c:out value="${list.faq_bno}" />" type="checkbox" class="panel">
        <div class="plus"><c:out value="${list.faq_bno}" /></div>
        <label for="<c:out value="${list.faq_bno}" />" class="panel-title"><c:out value="${list.faq_title}" /></label>
        <div class="panel-content"><c:out value="${list.faq_content}" /></div>
					<!-- 그리고 out으로 뿌려줌 -->
      </div>	
	
	</c:forEach>
	<div>
	 <c:if test = "${member.userId == 'admin' }"> 
      			<a href="/sae_faq/faqWriteView"><button>관리자 글 등록</button></a>
   			 </c:if>
	</div>			

	</form>
</div>
	</div>
		<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>