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



<form name="bookForm" role="form" method="post">
<c:if test="${member.userId != null}">
<input type="hidden" id="pg_bno" name="pg_bno" class="form-control" value="${bookview.pg_bno}" readonly="readonly" />
<input type="hidden" id="pg_name" name="pg_name" class="form-control" value="${bookview.pg_name}" readonly="readonly" />
<input type="hidden" id="pg_content" name="pg_content" class="form-control" value="${bookview.pg_content}" readonly="readonly" />
<input type="hidden" id="pg_startdate" name="pg_startdate" class="form-control" value="${bookview.pg_startdate}" readonly="readonly" />
<input type="hidden" id="pg_enddate" name="pg_enddate" class="form-control" value="${bookview.pg_enddate}" readonly="readonly" />
<input type="hidden" id="pg_type" name="pg_type" class="form-control" value="${bookview.pg_type}" readonly="readonly" />
<!-- bk_pno -->
<input type="hidden" id="bk_pno" name="bk_pno" class="form-control" value="${bookview.pg_bno}" readonly="readonly"/>

<div style="border-top: 2px solid #333;display: flex;padding:40px;padding-bottom:60px; border-bottom: 1px solid gray; justify-content: center;">

<div style="width: 10%;"></div>
<table style=" width: 50%;font-size: large;font-weight: 530;">
<tr>
<td  style="padding: 10px 0;">분류</td>
<td>
<input type="text" id="bk_type" name="bk_type" class="form-control" value="${bookview.pg_type}" readonly="readonly"/>
</td>
</tr>
<tr>
<td style="padding: 10px 0;">관람이름</td>
<td>
<input type="text" id="pg_name" name="pg_name" class="form-control" value="${bookview.pg_name}" readonly="readonly" />
</td>
</tr>
<tr>
<td style="padding: 10px 0;">예약자 아이디</td>
<td>
<input type="text" id="bk_id" name="bk_id" class="form-control" value="${member.userId}" readonly="readonly" />
</td>
</tr>
<tr>
<td style="padding: 10px 0;">예약자 이름</td>
<td>
<input type="text" id="bk_name" name="bk_name" class="form-control" />
</td>
</tr>
<tr>
<td style="padding: 10px 0;">전화번호</td>
<td>
<input type="text" id="bk_tel" name="bk_tel" class="form-control"/>
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
<td style="padding: 10px 0;">날짜를 선택하세요</td>
<td>
<input type="date" id="bk_pdate" name="bk_pdate"
       min="${bookview.pg_startdate }" max="${bookview.pg_enddate }"/>
</td>
</tr>
<tr>
<td style="padding: 10px 0;">예약시간</td>
<td>
<input type="radio" id="bk_time" name="bk_time" class="form-control" value="9:00" style="width: 15px; height: 15px;">9:00
<input type="radio" id="bk_time" name="bk_time" class="form-control" value="11:00" style="width: 15px; height: 15px;">11:00
<input type="radio" id="bk_time" name="bk_time" class="form-control" value="14:00" style="width: 15px; height: 15px;">14:00
<input type="radio" id="bk_time" name="bk_time" class="form-control" value="16:00" style="width: 15px; height: 15px;">16:00
</td>
</tr>
</table>
</div><br>
<div style="text-align: right;width: 93%;">
<button style="background-color: #45489a;font-size:17px; width:100px;height:45px;border-radius:5px; color: white; border-color: #45489a;" class="book_btn" type="submit">예약하기</button>
</div>


</c:if>
<c:if test="${member.userId == null}">
<p>로그인 후에 작성하실 수 있습니다.</p>
</c:if>

</form>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>

</body>
</html>