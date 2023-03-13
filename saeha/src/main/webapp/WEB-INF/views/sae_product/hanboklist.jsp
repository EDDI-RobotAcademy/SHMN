<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
<link href="/resources/css/templatemo-xtra-blog.css" rel="stylesheet">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
#center {
	margin: 150px;
}
</style>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>
	<%@include file='../include/nav.jsp'%>
	<div class="page-content">
		<div style="width: 90%; margin-left: 100px;">
			<div style="padding: 60px 0; height: 80%;">
					<div class="section-heading"
					style="display: flex; margin-left: 80px; margin-bottom:0px">
					<h1>
						Saeha Shop<br> <em>Hanbok</em>
					</h1>
					<form method="GET" class="form-inline tm-mb-60 tm-search-form">
						<input class="form-control tm-search-input" name="keyword"
							id="keywordInput" value="${srci.keyword}" type="text"
							placeholder="Search..." aria-label="Search"
							style="width: 500px; height: 50px;">
						<button class="tm-search-button" id="searchBtn" type="button"
							style="height: 50px">검색</button>
					</form>
				</div>
			<hr style="border: 3px solid #b4c3ff; margin-top:0px; width:85%; margin-left:10px ">
				<!-- Search form -->
				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "hanboklist"
											+ '${hpageMaker.makeQuery(1)}'
											+ "&searchType=pn"
											+ "&keyword="
											+ encodeURIComponent($(
													'#keywordInput').val());
								});
					});
				</script>






				<form role="form" method="get">

					<c:forEach items="${hanboklist }" var="hanboklist">

						<article class="col-12 col-md-6 tm-post">
							<input value="<c:out value="${hanboklist.pd_bno }" />"
								type="hidden"> <a href="post.html"
								class="effect-lily tm-post-link tm-pt-60">

								<div class="tm-post-link-inner">

									<a
										href="/sae_product/read?pd_bno=${hanboklist.pd_bno}&pd_type=${hanboklist.pd_type}&page=${scri.page}&perPageNum=${scri.perPageNum}
									&searchType=${scri.searchType }&keyword=${srci.keyword }"><img
										style="width: 440px; height: 330px"
										src="/resources/productimg/${hanboklist.p_filepath }" /></a>
								</div>

								<h2 class="tm-pt-30 tm-color-primary tm-post-title">
									<c:out value="${hanboklist.pd_name}" />
								</h2>
							</a>
							<p class="tm-pt-30">
								<fmt:formatDate value="${hanboklist.pd_date}"
									pattern="yyyy-MM-dd" />
							</p>
							<div class="d-flex justify-content-between tm-pt-45">
								<span class="tm-color-primary"> <c:out
										value="${hanboklist.pd_price }" /> 원
								</span>
							</div>
							<hr>
							<div class="d-flex justify-content-between">
								<span><c:out value="${hanboklist.pd_readcount }" /> read</span>
								<span>by people</span>
							</div>
						</article>

					</c:forEach>





				</form>


			</div>
			<div class="row tm-row tm-mt-100 tm-mb-75" style="margin-right: 20px">

				<div style="display: flex; margin-right: 500px;"
					class="tm-paging-wrapper">
					<span class="d-inline-block mr-3">Page</span>&nbsp;&nbsp;&nbsp;
					<nav class="tm-paging-nav d-inline-block">
						<ul>
							<c:if test="${hpageMaker.prev}">
								<li><a
									href="hanboklist${hpageMaker.makeSearch(hpageMaker.startPage - 1)}"
									class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a></li>
							</c:if>

							<c:forEach begin="${hpageMaker.startPage}"
								end="${hpageMaker.endPage}" var="idx">
								<li
									<c:out value = "${hpageMaker.cri.page == idx ? 'class=info' : ''}"/>
									class="tm-paging-item active"><a
									href="hanboklist${hpageMaker.makeSearch(idx) }"
									class="mb-2 tm-btn tm-paging-link">${idx}</a></li>
							</c:forEach>

							<c:if test="${hpageMaker.next && hpageMakerendPage > 0 }">
								<li><a
									href="hanboklist${hpageMaker.makeSearch(hpageMaker.endPage + 1 )}"
									class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
								<li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
	</footer>
</body>
</html>