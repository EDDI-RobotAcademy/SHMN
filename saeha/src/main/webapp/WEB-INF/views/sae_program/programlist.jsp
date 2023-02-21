<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">

      <!-- 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>관람 목록</title>
</head>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
					Ongoing<br>
					<em>Programs</em>
				</h1>
				<p>
					Praesent pellentesque efficitur magna, <br>sed pellentesque
					neque malesuada vitae.
				</p>
	</div>

<div class="search row" style="width:90%;">
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

<div style="width:90%; margin: 20px 0;">
<form role="form" method="get">

<c:forEach items="${programlist}" var = "programlist">
<div style="padding: 25px;display: flex;border-top: 0.5px solid gray;">
<div style="background-color: orange;width:220px; height: 140px;">
</div>
<div style="width: 5%"></div>
<div style="width:70%;"><br>
<div style="font-size: x-large;"><c:out value="${programlist.pg_bno}" />.&nbsp;<b><a href="/sae_program/programview?pg_bno=${programlist.pg_bno}"><c:out value="${programlist.pg_name}" /></a></b></div>
<div style="font-size: 15.5px; padding-bottom: 4px;"><br><c:out value="${programlist.pg_startdate}" /> - <c:out value="${programlist.pg_enddate}" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${programlist.pg_time}" /></div>
<div>정원ㅣ <c:out value="${programlist.pg_stock}" />명</div>
</div>
</div>
</c:forEach>


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

<div style="text-align: right; width: 92%;">
<c:if test="${member.userId == 'admin'}">
    <a href="/sae_program/program">
  <button type="button">
    프로그램 추가
  </button>
    </a>
</c:if>
</div>

</div>
</form>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>