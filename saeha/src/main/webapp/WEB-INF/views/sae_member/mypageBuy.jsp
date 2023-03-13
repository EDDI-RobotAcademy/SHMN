<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>구매 리스트</title>
</head>
<body>
<%@include file='../include/nav.jsp' %>
<div class="page-content">
<div style="width:90%">
<div style="padding:60px 0; height: 100%;">
<div class="container">
<div class="section-heading">
				<h1>
구매내역</h1>

<hr />
</div>
	<section id="container">
	<table class="table table-hover">
				<thead>
					<tr>
					 <th>구매일자</th>
					 <th>상품번호</th>
					 <th>상품사진</th>
					 <th>상품 이름</th>
					 <th>구매 갯수</th>
					 <th>결제 금액</th>
					</tr>
				</thead>
				<c:forEach items="${buylist }" var="buylist">
					<tr>
						<td><fmt:formatDate value="${buylist.by_date}" pattern="yyyy-MM-dd" /></td>
						<td><c:out value="${buylist.by_pno }"/></td>
						<td>
						<a href="/sae_product/read?pd_bno=${buylist.by_pno }"><img height="100px" width="100px"
								 src="/resources/productimg/${buylist.by_filepath }"></a>
						</td>
						<td><c:out value="${buylist.by_name }" /></td>
						<td><c:out value="${buylist.by_count }" /></td>
						<td><c:out value="${buylist.by_price}"/></td>
					</tr>
				</c:forEach>
			</table>
			
		<div class="col=md-offset-3">
			<ul class="pagination">
			 <c:if test="${bpageMaker.prev}">
				<li><a href="hanboklist${bpageMaker.makeSearch(bpageMaker.startPage - 1)}">이전</a></li>
			 </c:if>

			<c:forEach begin="${bpageMaker.startPage}" end="${bpageMaker.endPage}" var="idx">
			 <li <c:out value = "${bpageMaker.cri.page == idx ? 'class=info' : ''}" />>
				<a href="buylist${bpageMaker.makeSearch(idx)}">${idx}</a>
			 </li>
			</c:forEach>

			<c:if test="${bpageMaker.next && bpageMakerendPage > 0 }">
			 <li><a href="buylist${bpageMaker.makeSearch(bpageMaker.endPage + 1 )}">다음</a></li>
			</c:if>
		   </ul>
		</div></section>
				</div></div>
	</div></div>
	<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>