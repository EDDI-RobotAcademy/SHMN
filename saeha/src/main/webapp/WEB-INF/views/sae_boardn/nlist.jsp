<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지게시판</title>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">

<link rel="icon" href="data:;base64,iVBORw0KGgo=">

</head>
<body>

<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%; width: 150%; padding-right: 15%;">
<div style="width:100%; margin-right: 300px;">
<div class="section-heading">
				<h1 style="margin-left: 50px">
					Notice<br>
					<em>Boards</em>
				</h1>
				<p>
					This is the announcement board of Saehamano. 
			<br>We will introduce everything related to announcements.
				</p>
		
		<div class="page-content" style="display: flex; justify-content: center;">
		<div style="width: 100%">
		<div style="padding:60px 0;  height: 150%; width: 100%; ">
<section id="blog" class="content-section">		
		<div class="section-content">
				<div class="tabs-content">
				<div class="wrapper">
						<ul class="tabs clearfix" data-tabgroup="first-tab-group">
							<li><a href="#tab1" class="active">NOTICE</a></li>
						</ul>
		<form role="form" method="get">
			<section id="first-tab-group" class="tabgroup">
				<div>
					<ul>
						<c:forEach var="nlist" items="${nlist}">
							<li>
							<input type="hidden" value="<c:out value="${nlist.n_bno}" />">
								<div class="item">
									<div class="text-content">
										<h4>
											<a href="/sae_boardn/nread?n_bno=${nlist.n_bno}"><c:out
													value=" ${nlist.n_title} " /></a>
										</h4>
										<span><fmt:formatDate value="${nlist.n_regdate}"
												pattern="yyyy-MM-dd" /></span>
											ㅣ<span>조회수<c:out value="${nlist.n_hit }" /></span>
									</div>
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</section>
			</form>
		</div>
</div>

   <div style="text-align: right;"> 
			<c:if test="${member.userId == 'admin'}">
					<a href="/sae_boardn/nwriteView"><button style="background-color: #45489a; color: white; border-color: #45489a;">글 등록</button></a>
			
			</c:if>
	</div>
</div>
</section>
</div>
</div>

</div>


</section>
</div>
</div>
</div>

			</div>
			
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>