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
<title>게시판</title>
</head>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content" style="display: flex; justify-content: center;">
<div style="padding:60px 0; height: 100%;width: 90%;">
<form role="form" method="get">
	<div class="section-heading">
				<h1>
				&nbsp;REVIEW<br><Br>
				</h1>
	</div>
<DIV style="display: flex; height: 150px; padding: 15px; border: 1px solid gray;">
        <div style="width: 40%; text-align: center; border-right: 1px solid gray; justify-content: center; display: grid;">
            <div style="height: 70%;font-size: 60px;text-align: center;align-items: baseline;display: flex;">
            <img  src="/resources/img/star.PNG" style="width: 57px;">${devideCount }</div> 
            <div> ${pageMaker.totalCount}개 리뷰</div>
        </div>
        <div></div>
    </DIV>
    <br>
<div style="display: flex;justify-content: space-between;">
 <div class="search row" style="width:280px; padding-left: 5px; ">
<div class="col-xs-2 col-sm-2" style="width: 55%;">

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

<div class="col-xs-10 col-sm-10" style="width: 45%;">
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
<div><a href="/sae_goodsboard/writeView?pno=${pno}"><button class="btn btn-default">리뷰작성</button></a>&nbsp;&nbsp;</div>
</div>
<br><br>
    
<table class="table table-hover">
<thead>
<tr><th style="width: 10%;text-align: center;">번호</th>
<th>제목</th>
<th style="width: 15%;text-align: center;">작성자</th>
<th style="width: 10%;text-align: center;">별점</th>
<th style="width: 15%;text-align: center;">등록일</th></tr>
</thead>

<c:forEach items="${list}" var = "list">
<tr>
<td style="width: 10%;text-align: center;"><c:out value="${list.gwBno}" /></td>
<td>
<a href="/sae_goodsboard/readView?gwBno=${list.gwBno}&page=${scri.page}&perPageNum=${scri.perPageNum}&score=${scri.score}&keyword=${scri.keyword}"><c:out value="${list.gwTitle}" /></a>
</td>
<td style="width: 15%;text-align: center;"><c:out value="${list.gwWriter}" /></td>
<td style="width: 10%;text-align: center;"><c:forEach var="score" begin="1" end="${list.gwScore}">★
</c:forEach></td>
<td style="width: 15%;text-align: center;"><c:out value="${list.gwDate}" /></td>
</tr>
</c:forEach>
</table>



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