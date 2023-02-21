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
<title>reply delete update</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='deleteForm']");
	
	$(".cancel_btn").on("click", function(){
		location.href = "/sae_goodsboard/readView?gwBno=${replyDelete.geBno}" + "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}" + "&score=${scri.score}"
				+ "&keyword=${scri.keyword}";
	});
});
</script>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content" style="display: flex; justify-content: center;">
<div style="padding:60px 0; height: 100%;width: 90%;">
	<div class="section-heading">
				<h1>
				&nbsp;댓글 수정하기<br><Br>
				</h1>
	</div>


<section id="container">
<form name="deleteForm" role="form" method="post" action="/sae_goodsboard/replyDelete">
<input type="hidden" name="geBno" value="${replyDelete.geBno}" readonly="readonly" />
<input type="hidden" id="rno" name="geRno" value="${replyDelete.geRno}" />
<input type="hidden" id="page" name="page" value="${scri.page}" />
<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />

<div>
<p>삭제하시겠습니까?</p>
<button type="submit" class="delete_btn">예. 삭제합니다.</button>
<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>

</div>
</form>
</section>
</div>
</div>
<footer class="footer">
<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
</footer>
</body>
</html>