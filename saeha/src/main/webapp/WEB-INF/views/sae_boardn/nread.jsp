<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>공지게시판 상세보기</title>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">

</head>
<script type="text/javascript">
$(document).ready(function() {
		var nform = $("form[name='readnForm']");
		
		//버튼을 누르면 게시글 수정 폼을 보여준다
      $(".nupdate_btn").on("click", function() {
         nform.attr("action", "/sae_boardn/nupdateView");
         nform.attr("method", "get");
         nform.submit();
      })
      
      //삭제
      $(".ndelete_btn").on("click", function() {
         var deleteYN = confirm("삭제하시겠습니까?");
         
         if (deleteYN == true) {
            nform.attr("action", "/sae_boardn/ndelete");
            nform.attr("method", "post");
            nform.submit();
         }
      })
	})
</script>
<body>
<%@include file="../include/nav.jsp" %>
	<div class="page-content">

<section id="blog" class="content-section">		
		<div class="section-content">
				<div class="tabs-content">
				<div class="wrapper">
						<ul class="tabs clearfix" data-tabgroup="first-tab-group">
							<li><a href="#tab1" class="active">NOTICE</a></li>
						</ul>

<form name="readnForm" role="form" method="post">
 <input type="hidden" id="bno" name="n_bno" value="${nread.n_bno }" />
</form>
<section id="first-tab-group" class="tabgroup">
<div style="height: 50px;">
<h4>${nread.n_title}</h4>
</div>
<div style="border-bottom: 1px solid black;border-top: 1px solid black; height: 30px; text-align: right;">
<fmt:formatDate value = "${nread.n_regdate }" pattern="yyyy-MM-dd" />
</div>
<div style="text-align: left;">
${nread.n_content}
<br>
<br>
</div>

</section>

</div>
</div>
</div>
</section>
</div>


<c:if test="${member.userId == 'admin'}">
   <button type="button" class="nupdate_btn">수정</button>
   <button type="button" class="ndelete_btn">삭제</button>
   <button type="button"><a href="/sae_boardn/nlist">목록</a></button>
</c:if>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>
