<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
      <!-- 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<div class="container">
<header>
<h1>게시판</h1>
</header>
<hr />

<div>
<%@include file="nav.jsp" %>
</div>
<section id="container">
<form role="form" method="get">
<div>
평균&nbsp;${devideCount }점
</div>
<div>
리뷰 총 갯수&nbsp;${pageMaker.totalCount}개
</div>
<table class="table table-hover">
<thead>
<tr><th>번호</th><th>제목</th><th>작성자</th><th>별점</th><th>등록일</th></tr>
</thead>

<c:forEach items="${list}" var = "list">
<tr>
<td><c:out value="${list.gwBno}" /></td>
<td>
<a href="/sae_goodsboard/readView?gwBno=${list.gwBno}&page=${scri.page}&perPageNum=${scri.perPageNum}&score=${scri.score}&keyword=${scri.keyword}"><c:out value="${list.gwTitle}" /></a>
</td>
<td><c:out value="${list.gwWriter}" /></td>
<td><c:forEach var="score" begin="1" end="${list.gwScore}">★
</c:forEach></td>
<td><c:out value="${list.gwDate}" /></td>
</tr>
</c:forEach>
</table>

<div class="search row">
<div class="col-xs-2 col-sm-2">

 <select
					id="score" name="score" class="form-control">
					<option value="10">전체보기</option>
					<% for (int i = 5; i> 0; i--)
					{
					%>
					<option value="<%=i %>"><%=i %>점</option>
					<%
					}
					%>
				</select> 

</div>

<div class="col-xs-10 col-sm-10">
<div class="input-group">
<input type="hidden" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" />
<span class="input-group-btn">
<button id="searchBtn" type="button" class="btn btn-default">검색</button>
<!-- 소희씨 이거 가운데로 옮겨주세요 뭔가 위치를... 잘 잡고싶어요 -->
</span>
</div>
</div>

<script>
$(function(){
	$('#searchBtn').click(function(){
		self.location = "list" + '${pageMaker.makeQuery(1)}' + "&score=" + $("select option:selected").val() + "&pno=" + ${pno} +
						"&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
});
</script>
</div>

<div class="col-md-offset-3">
<ul class="pagination">
<c:if test="${pageMaker.prev}">
<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
</c:if>

<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''} " />>
<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
</c:forEach>

<c:if test="${pageMaker.next && pageMakerendPage > 0}">
<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
</li>
</c:if>
</ul>
</div>
</form>
</section>
</div>
</body>
</html>