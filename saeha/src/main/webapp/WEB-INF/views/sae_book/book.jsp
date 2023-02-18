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
<title>예약페이지</title><!-- 프로그램 리스트 그대로 받아와야함 -->
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='bookForm']");
	$(".book_btn").on("click",function(){
		if (fn_valiChk()){
			return false;
		}
	formObj.attr("action","/sae_book/book");
	formObj.attr("method","post");
	formObj.submit();			
		});
	})
	
 	function fn_valiChk() {
	   var regForm = $("form[name='bookForm'] .chk").length;
	   for(var i = 0; i<regForm;i++){
		   if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			   alert($(".chk").eq(i).attr("title"));
			   return true;
		   }
	   } 
	
	}
	


</script>
<body>
<header>
<h1>예약페이지</h1>
</header>
<hr />

<div>
<%@include file="nav.jsp" %>
</div>
<hr />
<section id="container">
<form name="bookForm" role="form" method="post">
<c:if test="${member.userId != null}">
<input type="hidden" id="pg_bno" name="pg_bno" class="form-control" value="${bookview.pg_bno}" readonly="readonly" />
<input type="hidden" id="pg_name" name="pg_name" class="form-control" value="${bookview.pg_name}" readonly="readonly" />
<input type="hidden" id="pg_content" name="pg_content" class="form-control" value="${bookview.pg_content}" readonly="readonly" />
<input type="hidden" id="pg_startdate" name="pg_startdate" class="form-control" value="${bookview.pg_startdate}" readonly="readonly" />
<input type="hidden" id="pg_enddate" name="pg_enddate" class="form-control" value="${bookview.pg_enddate}" readonly="readonly" />
<input type="hidden" id="pg_time" name="pg_time" class="form-control" value="${bookview.pg_time}" readonly="readonly" />
<input type="hidden" id="pg_type" name="pg_type" class="form-control" value="${bookview.pg_type}" readonly="readonly" />


<!-- bk_pno -->
<input type="hidden" id="bk_pno" name="bk_pno" class="form-control" value="${bookview.pg_bno}" readonly="readonly"/>

<label for="bk_type" class="col-sm-2 control-laber">분류</label>
<input type="text" id="bk_type" name="bk_type" class="form-control" value="${bookview.pg_type}" readonly="readonly"/>

<label for="pg_name" class="col-sm-2 control-laber">관람 이름</label>
<input type="text" id="pg_name" name="pg_name" class="form-control" value="${bookview.pg_name}" readonly="readonly" />

<label for="bk_id" class="col-sm-2 control-laber">예약자 아이디</label>
<input type="text" id="bk_id" name="bk_id" class="form-control" value="${member.userId}" readonly="readonly" />

<label for="bk_name" class="col-sm-2 control-laber">예약자 이름</label>
<input type="text" id="bk_name" name="bk_name" class="form-control" />

<label for="bk_tel" class="col-sm-2 control-laber">예약자 전화번호</label>
<input type="text" id="bk_tel" name="bk_tel" class="form-control"/>

<label for="bk_inwon" class="col-sm-2 control-laber">예약 인원</label>
<input type="text" id="bk_inwon" name="bk_inwon" class="form-control" value=""/>

<label for="bk_pdate" class="col-sm-2 control-laber">예약 날짜</label>
<input type="date" id="bk_pdate" name="bk_pdate"
       value=""
       min="${programread.pg_startdate }" max="${programread.pg_enddate }"/>


<button class="book_btn" type="submit">작성</button>
</c:if>
<c:if test="${member.userId == null}">
<p>로그인 후에 작성하실 수 있습니다.</p>
</c:if>

</form>
</section>

</body>
</html>