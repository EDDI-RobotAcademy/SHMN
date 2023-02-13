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
<title>프로그램 등록</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click",function(){
		if (fn_valiChk()){
			return false;
		}
	formObj.attr("action","/sae_program/upload");
	formObj.attr("method","post");
	formObj.submit();			
		});
	})
	
	function fn_valiChk() {
	   var regForm = $("form[name='writeForm'] .chk").length;
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
<h1>프로그램 등록</h1>
</header>
<hr  />

<%-- <div>
<%@include file="nav.jsp" %>
</div> --%>
<hr />

<section id="container">
<form name="writeForm" method="post" action="sae_program/upload">
<table>
<tbody>
 <c:if test="${member.userId == admin}"> 
  <tr>
  <td>
    <a href="/sae_program/programview?pg_bno=${programread.pg_bno}"><c:out value="${programread.pg_name}" /></a>
  </td>
  <td>
  <label for="pg_type">프로그램 분류</label>
  <select  id="pg_type" name="pg_type" class="chk">
    <option value="1">관람</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
  </select>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_name">프로그램 이름</label><input type="text" id="pg_name" name="pg_name" class="chk" title="프로그램 번호를 입력하세요."/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_content">프로그램 내용</label><textarea id="pg_content" name="pg_content" class="chk" title="프로그램 내용을 입력하세요."></textarea>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_file">프로그램 파일</label><input type="file" id="pg_file" name="pg_file" class="chk" title="프로그램 파일을 입력하세요."/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_stock">수용 인원</label><input type="text" id="pg_stock" name="pg_stock" class="chk" title="수용 인원을 입력하세요."/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_startdate">기간1</label><input type="date" id="pg_startdate" name="pg_startdate" class="chk" title="기간을 입력하세요."/>
  <label for="pg_enddate">기간2</label><input type="date" id="pg_enddate" name="pg_enddate" class="chk" title="기간을 입력하세요."/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="pg_bstartdate">예약 시작일</label><input type="date" id="pg_startdate" name="pg_bstartdate" class="chk" title="기간을 입력하세요."/>
  <label for="pg_benddate">예약 종료일</label><input type="date" id="pg_enddate" name="pg_benddate" class="chk" title="기간을 입력하세요."/>
  </td>
  </tr>
  <tr>
  <td>
    <ul id='pg_time'></ul>
  <label for="pg_time">프로그램 시간</label><input type="time" id="pg_time" name="pg_time" class="chk"/>
      <input type='button' value='추가' onclick='addList()' />
  </td> 
  </tr>
  <tr>
  <td>
  <button class="write_btn" type="submit">작성</button>
  </td>
  </tr>
 </c:if> 

</tbody>
</table>
</form>
</section>
<hr />
</div>

</body>
</html>