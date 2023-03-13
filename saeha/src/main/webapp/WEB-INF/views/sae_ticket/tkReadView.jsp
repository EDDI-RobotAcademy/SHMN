<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>티켓 상세보기</title>
</head>

<script type="text/javascript">

$(document).ready(function() {
    var formObj = $("form[name='readForm']");
    
    //수정
    $(".update_btn").on("click", function() {
       formObj.attr("action", "/sae_ticket/tkUpdateView");
       formObj.attr("method", "get");
       formObj.submit();
    })
     //삭제
    $(".delete_btn").on("click", function() {
       var deleteYN = confirm("삭제하시겠습니까?");
       
       if (deleteYN == true) {
          formObj.attr("action", "/sae_ticket/delete");
          formObj.attr("method", "post");
          formObj.submit();
       }else{
      	 return false;
       }
    })

    
    //목록
    $(".list_btn").on("click", function() {
       location.href = "/sae_ticket/ticketList";

    })
})

</script>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width:100%">
<div style="padding:40px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;상세보기<br><Br>
				</h1>

	<img src="/resources/img/tkback.jpg" style="width: 98%">
	</div>
	<div style="display: flex; ">
		<div style="width: 100%;">

    
<div style="padding:0px 0; height: 100%;">
    <form name="readForm" method="post">
    <table style="width:50%; margin:auto;">

    	<tr style="border-bottom: 1px solid #ccc; height: 70px;">
    		<td style = "text-align:center; width: 50%;"><label for = "tk_name">구분</label>
    		<td style = "text-align:center; width: 50%;"><label for = "tk_name">${read.tk_name}</label></td>
    	</tr>
    	
    	<tr style="border-bottom: 1px solid #ccc; height: 70px;">
    		<td style = "text-align:center; width: 50%;"><label for = "tk_stock ">예약 가능 인원</label>
    		<td style = "text-align:center; width: 50%;"><label for = "tk_stock ">${read.tk_stock }</label></td>
    	</tr>
    	<tr style="border-bottom: 1px solid #ccc; height: 70px;">
    		<td style = "text-align:center; width: 50%;"><label for = "tk_date ">예약 날짜</label>
    		<td style = "text-align:center; width: 50%;"><label for = "tk_date ">${read.tk_date }</label></td>
    	</tr>
    </table>
    	<input type="hidden" value="${read.tk_bno}" name="tk_bno"></input> 
    	<!-- form post: label로 못받음 input으로 꼭 -->
   
   
   <br>
   <br>
   
   
   <!-- 관리자용 버튼 -->
      <c:if test = "${member.userId == 'admin' }">
      <div style="text-align: center;">
      	<button style="background-color: #45489a; color: white; border-color: #45489a;" type="button" class="update_btn">수정</button>
      	<button style="background-color: #45489a; color: white; border-color: #45489a;"type="button" class="delete_btn">삭제</button>
   		<button style="background-color: #45489a; color: white; border-color: #45489a;" type="button" class="list_btn">목록</button>
      </div>
      </c:if>
      

	
    </form>
    </div>
   </div>
   </div>
   </div></div></div>
   <footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>