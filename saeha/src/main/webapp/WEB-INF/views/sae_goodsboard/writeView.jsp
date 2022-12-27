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
<title>게시판 writeView</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
	formObj.attr("action", "/sae_goodsboard/write");
	formObj.attr("method", "post");
	formObj.submit();
	});
})
function fn_valiChk(){
	var regForm = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return false;
		}
	}
}
</script>
<body>
<div id="root">
<header>
<h1>게시판 writeView.jsp</h1>
</header>
<hr />

<div>
<%@include file="nav.jsp" %>
</div>
<hr />

<section id="container">
<form name="writeForm" method="post" action="/sae_goodsboard/write">
<table>
<tbody>
<c:if test="${member.userId != null}">
<tr>
<td>
	<label for="title">제목</label><input type="text" id="title" name="gwTitle" class="chk" title="제목을 입력하세요" />
	</td>
	</tr>
	<tr>
	<td>
	<label for="content">내용</label><textarea id="content" name="gwContent" class="chk" title="내용을 입력하세요"></textarea>
	</td>
	</tr>
	<tr>
	<td>
	<label for="score">점수</label><select id="score" name="gwScore" >
					<% for (int i = 5; i> 0; i--)
					{
					%>
					<option value="<%=i %>"><%=i %>점</option>
					<%
					}
					%></select>
	</td>
	</tr>
	<tr>
	<td>
	<label for="writer">작성자</label><input type="text" id="writer" name="gwWriter" class="chk" title="작성자를 입력하세요" value="${member.userId}" />
	</td>
	</tr>
	<tr>
	<td>
	<label for="file">파일</label><input type="file" id="file" name="gwFile" />
	</td>
	</tr>
	<label for="pno">상품번호</label><input type="text" id="pno" name="gwPno" class="chk" value="${pno}" />
	<tr>
	<td>
	<button class="write_btn" type="submit">작성</button>
	</td>
	</tr>
</c:if>
<c:if test="${member.userId == null}">
<p>로그인 후에 작성하실 수 있습니다.</p>
</c:if>
</tbody>
</table>
</form>
</section>
<hr />
</div>
</body>
</html>