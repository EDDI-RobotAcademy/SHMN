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
<title>reply updateview</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click", function(){
		location.href = "/sae_goodsboard/readView?gwBno=${replyUpdate.geBno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&score=${scri.score}"
				+ "&keyword=${scri.keyword}"
	});
});
</script>
<body>
<div id="root">
<header>
<h1>게시판 reply updateView</h1>
</header>
<hr />

<div>
<%@ include file="nav.jsp" %>
</div>
<hr />

<section id="container">
<form name="updateForm" role="form" method="post" action="/sae_goodsboard/replyUpdate">
<input type="hidden" name="geBno" value="${replyUpdate.geBno}" readonly="readonly" />
<input type="hidden" id="rno" name="geRno" value="${replyUpdate.geRno}" />
<input type="hidden" id="page" name="page" value="${scri.page}" />
<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
<table>
<tbody>
<tr>
<td>
<label for="content">댓글 내용</label>
<input type="text" id="content" name="geContent" value="${replyUpdate.geContent}" />
</td>
</tr>
</tbody>
</table>
<div>
<button type="submit" class="update_btn">저장</button>
<button type="button" class="cancel_btn">취소</button>
</div>
</form>
</section>
</div>
</body>
</html>