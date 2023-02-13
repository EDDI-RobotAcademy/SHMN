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
<title>관람 목록</title>
</head>
<body>
<div class="container">
<header>
<h1>관람목록</h1>
</header>
<hr />

<%-- <div>
<%@include file="nav.jsp" %>
</div> --%>
<section id="container">
<form role="form" method="get">
<table class="table table-hover">
<thead>
<tr><th>번호</th><th>제목</th><th>수용인원</th><th>시작일</th><th>종료일</th><th>시간</th></tr>
</thead>

<c:forEach items="${programlist}" var = "programlist">
<tr>
<td><c:out value="${programlist.pg_bno}" /></td>
<td>
<a href="/sae_program/programview?pg_bno=${programlist.pg_bno}"><c:out value="${programlist.pg_name}" /></a>
</td>
<td><c:out value="${programlist.pg_stock}" /></td>
<td><c:out value="${programlist.pg_startdate}" /></td>
<td><c:out value="${programlist.pg_enddate}" /></td>
<td><c:out value="${programlist.pg_time}" /></td>
<%-- <td><fmt:formatDate value="${programlist.regdate}" pattern="yyyy-MM-dd" /></td> --%>
</tr>
</c:forEach>
</table>

<div class="search row">
<div class="col-xs-2 col-sm-2">
<select name="searchType" class="form-control">
<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}" />>--------</option>
<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}" />>제목</option>
<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}" />>내용</option>
<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
</select>
</div>

<div class="col-xs-10 col-sm-10">
<div class="input-group">
<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" />
<span class="input-group-btn">
<button id="searchBtn" type="button" class="btn btn-default">검색</button>
</span>
</div>
</div>

<script>
$(function(){
   $('#searchBtn').click(function(){
      self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() +
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

<c:if test="${member.userId == 'admin1'}">
  <button type="button">
    <a href="/sae_program/program">프로그램 추가</a>
  </button>
</c:if>
</ul>
</div>
</form>
</section>
</div>
</body>
</html>