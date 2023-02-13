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
<title>상품 리스트</title>
</head>
<body>
	
	<div>
		<button><a href="/">메인페이지로</a></button>
	</div>
	<div>
		<button><a href="/sae_product/productmain">상품페이지로</a></button>
	</div>
	
	
	<div class="container">
		<header>
			<h1>한복 리스트</h1>
		</header>
		<hr />

		<section id="container">
		 <form role="form" method="get">
			<table class="table table-hover">
				<thead>
					<tr>
					 <th>상품번호</th>
					 <th>상품사진</th>
					 <th>상품 이름</th>
					 <th>상품 가격</th>
					 <th>재고수량</th>
					 <th>등록일자</th>
					 <th>상품 조회수</th>
					</tr>
				</thead>
				<c:forEach items="${hanboklist }" var="hanboklist">
					<tr>
						<td><c:out value="${hanboklist.pd_bno }" /></td>
						<td><a href="/sae_product/read?pd_bno=${hanboklist.pd_bno}&pd_type=${hanboklist.pd_type}&page=${scri.page}&perPageNum=${scri.perPageNum}
									&searchType=${scri.searchType }&keyword=${srci.keyword }">
							<img src="/resources/productimg/${hanboklist.p_filepath }"/></a></td>
							
						<td><c:out value="${hanboklist.pd_name}" /></td>
						<td><c:out value="${hanboklist.pd_price }" /></td>
						<td><c:out value="${hanboklist.pd_stock }"/></td>
						<td><fmt:formatDate value="${hanboklist.pd_date}" pattern="yyyy-MM-dd" /></td>
						<td><c:out value="${hanboklist.pd_readcount }"/></td>
					</tr>
				</c:forEach>

			</table>

			<div class="search row">
				<div class="col-xs-2 col-sm-2">
					<select name="searchType" class="form-control">
						<option value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}" />>---------</option>
						<option value="pn" <c:out value="${scri.searchType eq 'pn' ? 'selected' : ''}" />>상품이름</option>
					</select>
				</div>

				<div class="col-xs-10 col-sm-10">
					<div class="input-group">
						<input type="text" name="keyword" id="keywordInput" 
							   value="${srci.keyword}" class="form-control" /> 
						 <span class="input-group-btn">
							<button id="searchBtn" type="button" class="btn btn-default">검색</button>
						</span>
					</div>
				</div>

				<script>
					$(function() { 
						$('#searchBtn').click(function() {
						self.location = "hanboklist" + '${hpageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val()
						+ "&keyword="+ encodeURIComponent($('#keywordInput').val());
							});
						});
			
	</script>
		</div>
		<div class="col=md-offset-3">
			<ul class="pagination">
			 <c:if test="${hpageMaker.prev}">
				<li><a href="hanboklist${hpageMaker.makeSearch(hpageMaker.startPage - 1)}">이전</a></li>
			 </c:if>

			<c:forEach begin="${hpageMaker.startPage}" end="${hpageMaker.endPage}" var="idx">
			 <li <c:out value = "${hpageMaker.cri.page == idx ? 'class=info' : ''}" />>
				<a href="hanboklist${hpageMaker.makeSearch(idx)}">${idx}</a>
			 </li>
			</c:forEach>

			<c:if test="${hpageMaker.next && hpageMakerendPage > 0 }">
			 <li><a href="hanboklist${hpageMaker.makeSearch(hpageMaker.endPage + 1 )}">다음</a></li>
			</c:if>
		   </ul>
		</div>
	</form>
</section>
</div>	
</body>
</html>