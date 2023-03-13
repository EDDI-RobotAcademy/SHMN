<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
      
       <link rel="stylesheet" href="/resources/css/templatemo-style.css">
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>예약 view</title>
</head>

<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='bookupdateForm']");
	
	//수정
	$(".update_btn").on("click",function(){
		formObj.attr("action","/sae_book/bookUpdate");
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
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width: 90%;">
<div style="padding:60px 0;height: 100%;width: 90%;">
<div class="section-heading">
				<h1>
					Program<br>
					<em>Reservation</em>
				</h1>
				<p>
					Praesent pellentesque efficitur magna, <br>sed pellentesque
					neque malesuada vitae.
				</p>
			</div>
<!-- 
  role="form" : html5에 새롭게 추가된 태그로서 해당 태그에 대한 정의를 해 줌으로서
                컴퓨터의 리더기를 이용하여 웹 페이지를 읽을 때 해당 부분이 form 이라는 것을 알려줌
                
  https://aibees.github.io./Why-Use-Service/
 -->

<form action="/sae_book/bookUpdate" name="bookupdateForm" role="form" method="post">
<input type="hidden" id="bk_bno" name="bk_bno" value="${bookread.bk_bno}" />
<input type="hidden" id="bk_pno" name="bk_pno" value="${bookread.bk_pno}" />
<input type="hidden" id="bk_type" name="bk_type" value="${bookread.bk_type}" />
<input type="hidden" id="pg_name" name="pg_name" value="${programread.pg_name}" />
<input type="hidden" id="pg_content" name="pg_content" value="${programread.pg_content}" />
<input type="hidden" id="bk_name" name="bk_name" value="${bookread.bk_name}" />
<input type="hidden" id="bk_tel" name="bk_tel" value="${bookread.bk_tel}" />
<input type="hidden" id="bk_inwon" name="bk_name" value="${bookread.bk_inwon}" />
<input type="hidden" id="bk_pdate" name="bk_pdate" value="${bookread.bk_pdate}" />
<input type="hidden" id="bk_time" name="bk_time" value="${bookread.bk_time}" />
</form>

<div style="border-top: 2px solid #333;display: flex;padding:40px;padding-bottom:60px; border-bottom: 1px solid gray; justify-content: center;">

<div style="width: 10%;"></div>
<table style=" width: 50%;font-size: large;font-weight: 530;">
<tr>
<td  style="padding: 10px 0;">분류</td>
<td>
 <input type="text" id="bk_type" name="bk_type" class="form-control" value="${bookread.bk_type }" readonly="readonly" />
</td>
</tr>
<tr>
<td style="padding: 10px 0;">관람이름</td>
<td>
<input type="text" id="pg_name" name="pg_name" class="form-control" value="${programread.pg_name}" readonly="readonly" />
</td>
</tr>
<tr>
<td style="padding: 10px 0;">관람 내용</td>
<td>
<textarea id="pg_content" name="pg_content" class="form-control" readonly="readonly"><c:out value="${programread.pg_content}"/></textarea>
</td>
</tr>
<tr>
<td style="padding: 10px 0;">예약자 이름</td>
<td>
<input type="text" id="bk_name" name="bk_name" class="form-control" value="${bookUpdate.bk_name}"/>
</td>
</tr>
<tr>
<td style="padding: 10px 0;">전화번호</td>
<td>
<input type="text" id="bk_tel" name="bk_tel" class="form-control" value="${bookUpdate.bk_tel}"/>
</td>
</tr>
<tr>
<td style="padding: 10px 0;">예약인원</td>
<td>
<select id="bk_inwon" name="bk_inwon" class="form-control">
  <option value="1">1명</option>
  <option value="2">2명</option>
  <option value="3">3명</option>
  <option value="4">4명</option>
</select>
</td>
</tr>
<tr>
<td style="padding: 10px 0">관람날짜</td>
<td>
<input type="date" id="bk_pdate" name="bk_pdate"
       min="${bookview.pg_startdate }" max="${bookview.pg_enddate }"/>
</td>
</tr>
<tr>
<td style="padding: 10px 0;">예약시간</td>
<td>
<input type="radio" id="bk_time" name="bk_time" class="form-control" value="9:00">9:00
<input type="radio" id="bk_time" name="bk_time" class="form-control" value="11:00">11:00
<input type="radio" id="bk_time" name="bk_time" class="form-control" value="14:00">14:00
<input type="radio" id="bk_time" name="bk_time" class="form-control" value="16:00">16:00
</td>
</tr>
</table>
</div><br>
<div style="text-align: right;width: 93%;">
<button class="update_btn" type="submit"  style="background-color: #45489a;font-size:17px; width:100px;height:45px;border-radius:5px; color: white; border-color: #45489a;">수정</button>
</div>


</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>