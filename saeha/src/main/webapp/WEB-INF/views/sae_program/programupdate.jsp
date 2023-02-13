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
<title>프로그램 수정페이지</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click",function(){
		event.prventDefault();
		location.href = "/board/readView?bno=${update.bno}"
				        + "&page=${scri.page}"
				        + "&perPageNum=${scri.perPageNum}"
				        + "&searchType=${scri.searchType}"
				        + "&keword=${scri.keyword}";
				        	        
		
	});
	
	$(".update_btn").on("click",function(){
		if (fn_valiChk()){
			return false;
		}
	formObj.attr("action","/sae_program/programUpdate");
	formObj.attr("method","post");
	formObj.submit();			
		});
	})
	
	function fn_valiChk() {
	   var regForm = $("form[name='updateForm'] .chk").length;
	   for(var i = 0; i<regForm;i++){
		   if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			   alert($(".chk").eq(i).attr("title"));
			   return true;
		   }
	   }
	
	}
	
	


</script>

<body>
<div id="root">
<header>
<h1>프로그램 수정페이지</h1>
</header>
<hr  />

<%-- <div>
<%@include file="nav.jsp" %>
</div> --%>
<hr />

<section id="container">
<!-- <form name="updateForm" method="post" action="sae_program/upload"> -->
<form action="/sae_program/programUpdate" name="updateForm" role="form" method="post">
<input type="hidden" id="bno" name="bno" value="${update.bno}" readonly="readonly"/>
      <input type="hidden" id="page" name="page" value="${scri.page}" />
      <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
      <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
      <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
<table>
<tbody>
<%-- <c:if test="${member.userId != null}"> --%>
  <tr>
  <%-- <td>
    <a href="/sae_program/programview?pg_bno=${book.pg_bno}"><c:out value="${book.pg_name}" /></a>
  </td> --%>
  <td>
  <label for="pg_type">프로그램 분류</label>
  <select  id="pg_type" name="pg_type" class="chk" >
    <option value="1">관람</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
  </select>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_name">프로그램 이름</label><input type="text" id="pg_name" name="pg_name" class="chk" value="${programUpdate.pg_name }"/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_content">프로그램 내용</label><textarea id="pg_content" name="pg_content" class="chk"><c:out value="${programUpdate.pg_content}"/></textarea>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_file">프로그램 파일</label><input type="file" id="pg_file" name="pg_file" class="chk" value="${programUpdate.pg_file }"/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_stock">수용 인원</label><input type="text" id="pg_stock" name="pg_stock" class="chk" value="${programUpdate.pg_stock }"/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_startdate">기간1</label><input type="date" id="pg_startdate" name="pg_startdate" class="chk" value="${programUpdate.pg_startdate }"/>
  <label for="pg_enddate">기간2</label><input type="date" id="pg_enddate" name="pg_enddate" class="chk" value="${programUpdate.pg_enddate }"/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_bstartdate">예약 시작일</label><input type="date" id="pg_bstartdate" name="pg_bstartdate" class="chk" value="${programUpdate.pg_bstartdate }"/>
  <label for="pg_benddate">예약 종료일</label><input type="date" id="pg_benddate" name="pg_benddate" class="chk" value="${programUpdate.pg_benddate }"/>
  </td>
  </tr>
  <tr>
  <td>
    <ul id='pg_time'></ul>
  <label for="pg_time">프로그램 시간</label><input type="time" id="pg_time" name="pg_time" class="chk" value="${programUpdate.pg_time }"/>
      <input type='button' value='추가' onclick='addList()' />
  </td> 
  </tr>
  <tr>
  <td>
  <button class="update_btn" type="submit">수정 완료</button>
  </td>
  </tr>
<%-- </c:if> --%>
<%-- <c:if test="${member.userId == null }">
 <p>로그인 후에 이용하실 수 있습니다.</p>
</c:if> --%>
</tbody>
</table>
</form>
</section>
<hr />
</div>

</body>
</html>