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
<title>프로그램 view</title>
</head>

<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='readForm']");
	
	//수정
	$(".update_btn").on("click",function(){
		formObj.attr("action","/sae_program/programUpdateView");
		formObj.attr("method","get");
		formObj.submit();
	})
	//삭제
	$(".delete_btn").on("click",function(){
		var deleteYN = confirm("삭제하시겠습니까?");
		if (deleteYN == true) {
			
			formObj.attr("action","/sae_program/programDelete");
			formObj.attr("method","get");
			formObj.submit();
			
		}
	})
	
	//목록
	$(".list_btn").on("click",function(){
		var type = $("#pg_type").val();
		location.href="/sae_program/programlist?pg_type="+type ;
	})
	
	//예약페이지로
	$(".book_btn").on("click", function(){
		formObj.attr("action","/sae_book/bookview");
		formObj.attr("method","get");
		formObj.submit();
		
	})



$('#heart').click(function(e){
		likeupdate(e);
	});
	
	function likeupdate(e){
		var root = getContextPath(),
		likeurl = "/sae_like/likeupdate",
		lk_id = $('#lk_id').val(),
		lk_pno = $('#lk_pno').val(),
		count = $('#likecheck').val(),
		data = {"lk_id" : lk_id,
				"lk_pno" : Number($("#lk_pno").attr("value")),
				"lkcount" : count};
		console.log(data);
	$.ajax({
		url : likeurl,
		type : 'PUT',
		dataType: "json",
        contentType: "application/json; charset=utf-8",
		data : JSON.stringify(data),
		success : function(result){
			console.log("수정" + result.result);
			if(count == 1){
				console.log("좋아요 취소");
				 $('#likecheck').val(0);
				 $('#heart').attr('src','/resources/img/empty.png');
			}else if(count == 0){
				console.log("좋아요!");
				$('#likecheck').val(1);
				$('#heart').attr('src','/resources/img/full.png');
			}
		}, error : function(result){
			console.log("에러" + result.result)
		}
		
		});
	};
	
	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	} 
})
</script>
<body>

<div class="container">
<header>
<h1> 프로그램 </h1>
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
<form name="readForm" role="form" method="post">
<input type="hidden" id="pg_bno" name="pg_bno" value="${programread.pg_bno}" />
<input type="hidden" id="pg_name" name="pg_name" value="${programread.pg_name}" />
<input type="hidden" id="pg_time" name="pg_time" value="${programread.pg_time}" />
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
<label for="pg_stock" class="col-sm-2 control-laber">예약 가능 인원</label>
<input type="text" id="pg_stock" name="pg_stock" class="form-control" value="${programread.pg_stock}" readonly="readonly" />
</div>
 <div class="form-group">
<label for="pg_startdate" class="col-sm-2 control-laber">기간1</label>
<input type="text" id="pg_startdate" name="pg_startdate" class="form-control" value="${programread.pg_startdate}" readonly="readonly" />
~
<label for="pg_startdate" class="col-sm-2 control-laber">기간2</label>
<input type="text" id="pg_enddate" name="pg_enddate" class="form-control" value="${programread.pg_enddate}" readonly="readonly" />
</div> 
 <div class="form-group">
<label for="pg_time" class="col-sm-2 control-laber">관람 시간</label>
<input type="text" id="pg_time" name="pg_time" class="form-control" value="${programread.pg_time}" readonly="readonly" />
</div>

<td id="like">
					<c:choose>
						<c:when test="${lk_bno ==0}">
							<img id="heart" src="/resources/img/empty.png"style="height:40px;" value="${programread.pg_bno}" >
							<input type="hidden" id="likecheck" value="${lk_bno }">
						</c:when>					
						<c:when test="${lk_bno ==1}">
							<img id="heart" src="/resources/img/full.png"style="height:40px;" value="${programread.pg_bno}" >
							<input type="hidden" id="likecheck" value="${lk_bno }">
						</c:when>
					</c:choose>					
				</td>
<!-- <button class="write_btn" type="submit">작성</button> -->
<c:if test = "${member.userId == 'admin' }">
<button type="button" class="update_btn btn btn-warning">수정</button>
<button type="button" class="delete_btn btn btn-danger">삭제</button>
<button type="button" class="list_btn btn btn-primary">목록</button>
</c:if>

<button type="button" class="book_btn btn btn-primary">예매하기</button>
<c:if test="${member.userId == null}">
<p>예매하시려면 로그인 해주세요!</p>
</c:if>
<input type="hidden" value="${member.userId }" id="lk_id" name="lk_id" />
<input type="hidden" value="${programread.pg_bno}" id="lk_pno" name="lk_pno" />

</section>
<hr />
</div>

</body>
</html>