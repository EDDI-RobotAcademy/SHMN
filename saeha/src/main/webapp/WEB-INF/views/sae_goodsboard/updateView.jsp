<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>update View</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click",function(){
		event.preventDefault(); // 창이 새로고침되거나, 다른 링크로 이동하는 것을 막아줌
		location.href="/sae_goodsboard/readView?gwBno=${update.gwBno}" +
					"&page=${scri.page}" + "&perPageNum=${scri.perPageNum}" +
					"&score=${scri.score}" + "&keyword=${scri.keyword}" ;
	});
	
	$(".update_btn").on("click",function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action","/sae_goodsboard/update");
		formObj.attr("method","post");
		formObj.submit();
	});
});

function fn_valiChk() {
	   var updateForm = $("form[name='updateForm'] .chk").length;
	   for(var i = 0; i<updateForm;i++){
		   if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			   alert($(".chk").eq(i).attr("title"));
			   return true;
		   }
	   }
	}
</script>
<body>
<div id = "root">
<header><h1>게시판</h1></header>
<hr  />

<div><%@include file="nav.jsp" %></div>
<hr />

<section id="container">
<form name="updateForm" role="form" method="post" action="/sae_goodsboard/update">
<input type="hidden" name="gwBno" value="${update.gwBno}" readonly="readonly">
<input type="hidden" name="gwPno" value="${update.gwPno}" readonly="readonly">
<input type="hidden" id="page" name="page" value="${scri.page }">
<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }">
<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }">
<table>
	<tbody>
	<tr>
		<td>
		  <label for="title">제목</label> 
		  <input type="text" id="title" name="gwTitle" class="chk" 
		  						value="${update.gwTitle }" title="제목을 입력하세요." />
		</td>
	</tr>
	<tr>
		<td>
		  <label for="content">내용</label>
		  <textarea id="content" name="gwContent" class="chk" title="내용을 입력하세요."><c:out value="${update.gwContent }" /></textarea>
		</td>
	</tr>
	<tr>
		<td>
		  <label for="score">점수</label> 
		 		 <select
					id="score" name="gwScore" class="form-control">
					<% for (int i = 5; i> 0; i--)
					{
					%>
					<option value="<%=i %>"><%=i %>점</option>
					<%
					}
					%>
				</select>
		</td>
	</tr>
	<tr>
		<td>
		  <label for="writer">작성자</label>
		  <input type="text" id="writer" name="gwWriter" class="chk" 
		  						value="${member.userId }" readonly="readonly"/>	
		</td>
	</tr>
	<tr>
		<td>
		  <label for="file">파일</label>
		  <input type="file" id="file" name="gwFile" 
		  						value="${update.gwFile }"/>	
		</td>
	</tr>
	<tr>
		<td>
		  <label for="date">작성 날짜</label>
		  <c:out value="${read.gwDate }" />
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
<hr />

</div>

</body>
</html>