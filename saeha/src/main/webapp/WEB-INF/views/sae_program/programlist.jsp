<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">

<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>관람 목록</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>
	<div class="page-content">
		<div style="width: 90%">
			<div style="padding: 60px 0; height: 100%;">
				<div class="section-heading">
					<h1>
						Ongoing<br> <em>Programs</em>
					</h1>
					<p>
						Introduce the program of Saehamano. <br>Visit and register
						for exhibitions, viewing, and experience programs.
					</p>
				</div>

				<div style="width: 90%; margin: 20px 0;">
					<form role="form" method="get">

						<label for="pg_type">프로그램 분류</label> <select id="pg_type"
							name="pg_type" onchange="location.href=this.value" class="chk">
							<option value="">====</option>
							<option onchange="location.href=this.value"
								value="/sae_program/programlist?pg_type=관람">관람</option>
							<option value="/sae_program/programlist?pg_type=체험">체험</option>
							<option value="/sae_program/programlist?pg_type=전시">전시</option>
						</select>
						<div style="display: flex; flex-flow: wrap;">
							<c:forEach items="${programlist}" var="programlist">
								<div
									style="width: 33%; padding: 25px; border-top: 0.5px solid gray;">
									<div>
										<a
											href="/sae_program/programview?pg_bno=${programlist.pg_bno}"><img
											src="/resources/programimg/${programlist.pg_filepath }"
											style="width: 320px;"></a>
									</div>
									<div style="width: 5%"></div>
									<div style="width: 70%;">
										<br>
										<div style="font-size: x-large;">
											<c:out value="${programlist.pg_bno}" />
											.&nbsp;<b><c:out value="${programlist.pg_name}" /></b>
										</div>
										<div style="font-size: 15.5px; padding-bottom: 4px;">
											<br>
											<c:out value="${programlist.pg_startdate}" />
											-
											<c:out value="${programlist.pg_enddate}" />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
										<div>
											정원ㅣ
											<c:out value="${programlist.pg_stock}" />
											명
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="col-md-offset-3">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''} " />>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMakerendPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
									</li>
								</c:if>
							</ul>

							<div style="text-align: right; width: 92%;">
								<c:if test="${member.userId == 'admin'}">
									<a href="/sae_program/program">
										<button type="button"
											style="background-color: #45489a; color: white; border-color: #45489a;">
											프로그램 추가</button>
									</a>
								</c:if>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
	</footer>
</body>
</html>