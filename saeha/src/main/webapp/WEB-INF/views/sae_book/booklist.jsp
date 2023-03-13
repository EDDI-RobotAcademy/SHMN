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

<title>예약 목록</title>
</head>

<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width:90%;">
<div class="section-heading">
   <h1>예약목록</h1>
</div>
    
<div style="padding:60px 0; height: 100%;">

<section id="container">
<form role="form" method="get">
<input type="hidden" id="bk_bno" name="bk_bno" value="${bookread.bk_bno}" />
<input type="hidden" id="bk_pno" name="bk_pno" value="${bookread.bk_pno}" />
<input type="hidden" id="bk_id" name="bk_id" value="${bookread.bk_id}" />
<input type="hidden" id="bk_time" name="bk_time" value="${bookread.bk_time}" />
<input type="hidden" id="pg_bno" name="pg_bno" value="${programread.pg_bno}" />
<input type="hidden" id="pg_name" name="pg_name" value="${programread.pg_name}" />
<input type="hidden" id="pg_content" name="pg_content" value="${programread.pg_content}" />

<h4>관람 예약목록</h4>
<table class="table table-hover">
<thead>
<tr><th>예약번호</th><th>프로그램</th><th>예약자</th><th>예약인원</th><th>예약일</th><th>예약시간</th></tr>
</thead>

<c:forEach items="${booklist1}" var = "booklist1">
<tr>
<td><c:out value="${booklist1.bk_bno}" /></td>
<td>
<a href="/sae_book/bookread?bk_bno=${booklist1.bk_bno}&bk_pno=${booklist1.bk_pno}"><c:out value="${booklist1.pg_name}" /></a>
</td>
<td><c:out value="${booklist1.bk_name}" /></td>
<td><c:out value="${booklist1.bk_inwon}" /></td>
<td><c:out value="${booklist1.bk_pdate}" /></td>
<td><c:out value="${booklist1.bk_time}" /></td>
<%-- <td><fmt:formatDate value="${programlist.regdate}" pattern="yyyy-MM-dd" /></td> --%>
</tr>
</c:forEach>
</table>

<h4>체험 예약목록</h4>
<table class="table table-hover">
<thead>
<tr><th>예약번호</th><th>프로그램</th><th>예약자</th><th>예약인원</th><th>예약일</th><th>예약시간</th></tr>
</thead>
<c:forEach items="${booklist2}" var = "booklist2">
<tr>
<td><c:out value="${booklist2.bk_bno}" /></td>
<td>
<a href="/sae_book/bookread?bk_bno=${booklist2.bk_bno}&bk_pno=${booklist2.bk_pno}"><c:out value="${booklist2.pg_name}" /></a>
</td>
<td><c:out value="${booklist2.bk_name}" /></td>
<td><c:out value="${booklist2.bk_inwon}" /></td>
<td><c:out value="${booklist2.bk_pdate}" /></td>
<td><c:out value="${booklist2.bk_time}" /></td>
<%-- <td><fmt:formatDate value="${programlist.regdate}" pattern="yyyy-MM-dd" /></td> --%>
</tr>
</c:forEach>
</table>

<h4>전시 예약목록</h4>
<table class="table table-hover">
<thead>
<tr><th>예약번호</th><th>프로그램</th><th>예약자</th><th>예약인원</th><th>예약일</th><th>예약시간</th></tr>
</thead>
<c:forEach items="${booklist3}" var = "booklist3">
<tr>
<td><c:out value="${booklist3.bk_bno}" /></td>
<td>
<a href="/sae_book/bookread?bk_bno=${booklist3.bk_bno}&bk_pno=${booklist3.bk_pno}"><c:out value="${booklist3.pg_name}" /></a>
</td>
<td><c:out value="${booklist3.bk_name}" /></td>
<td><c:out value="${booklist3.bk_inwon}" /></td>
<td><c:out value="${booklist3.bk_pdate}" /></td>
<td><c:out value="${booklist3.bk_time}" /></td>
<%-- <td><fmt:formatDate value="${programlist.regdate}" pattern="yyyy-MM-dd" /></td> --%>
</tr>
</c:forEach>
</table>

<%-- <div class="search row">
<div class="col-xs-2 col-sm-2">
<select id="typechange" name="searchType" class="form-control">
<option value="0">=========</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
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
/* $('#typechange').change(function () {
		location.href = '/sae_book/booklist?bk_type=' + this.value;
}); */
</script> --%>
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

</div>
   </div>
   <footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>