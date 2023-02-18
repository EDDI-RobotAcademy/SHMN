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
<title>예약 view</title>
</head>

<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='bookupdateForm']");
	
	//수정
	$(".update_btn").on("click",function(){
		formObj.attr("action","/sae_book/bookUpdateView");
		formObj.attr("method","post");
		formObj.submit();
	})
	//삭제
	$(".delete_btn").on("click",function(){
		var deleteYN = confirm("예약을 취소하시겠습니까?");
		if (deleteYN == true) {
			
			formObj.attr("action","/sae_book/bookDelete");
			formObj.attr("method","get");
			formObj.submit();
			
		}
	})
	
	//목록
	$(".list_btn").on("click",function(){
		var type = $("#pg_type").val();
		location.href="/sae_book/booklist?pg_type="+type + "&pg_name=${programread.pg_name}" ;
	})
	
	//예약페이지로
/* 	$(".book_btn").on("click", function(){
		formObj.attr("action","/sae_book/bookview");
		formObj.attr("method","get");
		formObj.submit();
		
	}) */

})

</script>
<body>

<div class="container">
<header>
<h1> 예약확인 페이지 </h1>
</header>
<hr />

<%-- <div>
<%@include file="nav.jsp" %>
</div> --%>

<!-- 
  role="form" : html5에 새롭게 추가된 태그로서 해당 태그에 대한 정의를 해 줌으로서
                컴퓨터의 리더기를 이용하여 웹 페이지를 읽을 때 해당 부분이 form 이라는 것을 알려줌
                
  https://aibees.github.io./Why-Use-Service/
 -->

<section id="container">
<form action="/sae_book/bookUpdate" name="bookupdateForm" role="form" method="post">
<input type="hidden" id="bk_bno" name="bk_bno" value="${bookread.bk_bno}" />
<input type="hidden" id="bk_pno" name="bk_pno" value="${bookread.bk_pno}" />
<input type="hidden" id="bk_type" name="bk_type" value="${bookread.bk_type}" />
<input type="hidden" id="pg_name" name="pg_name" value="${bookinfo.pg_name}" />
<input type="hidden" id="pg_content" name="pg_content" value="${bookinfo.pg_content}" />
<input type="hidden" id="bk_name" name="bk_name" value="${bookUpdate.bk_name}" />
<input type="hidden" id="bk_tel" name="bk_tel" value="${bookUpdate.bk_tel}" />
<input type="hidden" id="bk_inwon" name="bk_name" value="${bookUpdate.bk_inwon}" />
<input type="hidden" id="bk_pdate" name="bk_pdate" value="${bookUpdate.bk_pdate}" />
</form>
<div class="form-group">
 <label for="bk_type" class="col-sm-2 control-laber"></label>
 <input type="text" id="bk_type" name="bk_type" class="form-control" value="${bookread.bk_type }" readonly="readonly" />
 </div>
<div class="form-group">
<label for="pg_name" class="col-sm-2 control-laber">관람 이름</label>
<input type="text" id="pg_name" name="pg_name" class="form-control" value="${bookinfo.pg_name}" readonly="readonly" />
</div>
<div class="form-group">
<label for="pg_content" class="col-sm-2 control-label">관람 내용</label>
<textarea id="pg_content" name="pg_content" class="form-control" readonly="readonly"><c:out value="${bookinfo.pg_content}"/></textarea>
</div>
<div class="form-group">
<label for="bk_bno" class="col-sm-2 control-laber">예약 번호</label>
<input type="text" id="bk_bno" name="bk_bno" class="form-control" value="${bookread.bk_bno}" readonly="readonly" />
</div>
<div class="form-group">
<label for="bk_name" class="col-sm-2 control-laber">예약자 성명</label>
<input type="text" id="bk_name" name="bk_name" class="form-control" value="${bookUpdate.bk_name}" readonly="readonly" />
</div>
<div class="form-group">
<label for="bk_tel" class="col-sm-2 control-laber">예약자 번호</label>
<input type="text" id="bk_tel" name="bk_tel" class="form-control" value="${bookUpdate.bk_tel}" readonly="readonly" />
</div>
<div class="form-group">
<label for="bk_inwon" class="col-sm-2 control-laber">예약 인원</label>
<input type="text" id="bk_inwon" name="bk_inwon" class="form-control" value="${bookUpdate.bk_inwon}" readonly="readonly" />
</div>
 <div class="form-group">
<label for="bk_pdate" class="col-sm-2 control-laber">관람 날짜</label>
<input type="text" id="bk_pdate" name="bk_pdate" class="form-control" value="${bookUpdate.bk_pdate}" readonly="readonly" />
</div>

<button class="write_btn" type="submit">수정</button>
<%-- <c:if test = "${member.userId == 'admin1' }">
<button type="button" class="update_btn btn btn-warning">예매변경</button>
<button type="button" class="delete_btn btn btn-danger">예매취소</button>
<button type="button" class="list_btn btn btn-primary">예매목록</button>
</c:if> --%>



</section>
<hr />
</div>

</body>
</html>