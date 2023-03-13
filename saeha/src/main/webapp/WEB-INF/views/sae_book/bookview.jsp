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
	var formObj = $("form[name='bookviewForm']");
	
	//수정
	$(".update_btn").on("click",function(){
		formObj.attr("action","/sae_book/bookupdateview");
		formObj.attr("method","get");
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
<%@include file='../include/nav.jsp' %>
<div class="page-content">
<div style="width:90%">
<div style="padding:60px 0; height: 100%;">
<div class="section-heading">
				<h1>
예약확인</h1>

<hr />
</div>
<div class="container">
<!-- 

  role="form" : html5에 새롭게 추가된 태그로서 해당 태그에 대한 정의를 해 줌으로서
                컴퓨터의 리더기를 이용하여 웹 페이지를 읽을 때 해당 부분이 form 이라는 것을 알려줌
                
  https://aibees.github.io./Why-Use-Service/
 -->

<section id="container">
<form name="bookviewForm" role="form" method="post">
<input type="hidden" id="bk_bno" name="bk_bno" value="${bookread.bk_bno}" />
<input type="hidden" id="bk_pno" name="bk_pno" value="${bookread.bk_pno}" />
<input type="hidden" id="bk_id" name="bk_id" value="${bookread.bk_id}" />
<input type="hidden" id="pg_bno" name="pg_bno" value="${programread.pg_bno}" />
<input type="hidden" id="pg_name" name="pg_name" value="${programread.pg_name}" />
<input type="hidden" id="pg_content" name="pg_content" value="${programread.pg_content}" />
</form>
<div class="form-group">
 <label for="pg_type" class="col-sm-2 control-laber"></label>
 <input type="text" id="pg_type" name="pg_type" class="form-control" value="${programread.pg_type }" readonly="readonly" />
 </div>
<div class="form-group">
<label for="pg_name" class="col-sm-2 control-laber">관람 이름</label>
<input type="text" id="pg_name" name="pg_name" class="form-control" value="${programread.pg_name}" readonly="readonly" />
</div>
<div class="form-group">
<label for="pg_content" class="col-sm-2 control-label">관람 내용</label>
<textarea id="pg_content" name="pg_content" class="form-control" readonly="readonly"><c:out value="${programread.pg_content}"/></textarea>
</div>
<div class="form-group">
<label for="bk_bno" class="col-sm-2 control-laber">예약 번호</label>
<input type="text" id="bk_bno" name="bk_bno" class="form-control" value="${bookread.bk_bno}" readonly="readonly" />
</div>
<div class="form-group">
<label for="bk_name" class="col-sm-2 control-laber">예약자 성명</label>
<input type="text" id="bk_name" name="bk_name" class="form-control" value="${bookread.bk_name}" readonly="readonly" />
</div>
<div class="form-group">
<label for="bk_tel" class="col-sm-2 control-laber">예약자 번호</label>
<input type="text" id="bk_tel" name="bk_tel" class="form-control" value="${bookread.bk_tel}" readonly="readonly" />
</div>
<div class="form-group">
<label for="bk_inwon" class="col-sm-2 control-laber">예약 인원</label>
<input type="text" id="bk_inwon" name="bk_inwon" class="form-control" value="${bookread.bk_inwon}" readonly="readonly" />
</div>
 <div class="form-group">
<label for="bk_pdate" class="col-sm-2 control-laber">관람 날짜</label>
<input type="text" id="bk_pdate" name="bk_pdate" class="form-control" value="${bookread.bk_pdate}" readonly="readonly" />
</div>
 <div class="form-group">
<label for="bk_pdate" class="col-sm-2 control-laber">관람 시간</label>
<input type="text" id="bk_time" name="bk_time" class="form-control" value="${bookread.bk_time}" readonly="readonly" />
</div>
<!-- <button class="write_btn" type="submit">작성</button> -->
<c:if test = "${member.userId != null }">
<button type="button" class="update_btn btn btn-warning">예매변경</button>
<button type="button" class="delete_btn btn btn-danger">예매취소</button>
<button type="button" class="list_btn btn btn-primary">예매목록</button>
</c:if>

</section>
<hr />
</div>
				</div></div>
	</div>
	<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>