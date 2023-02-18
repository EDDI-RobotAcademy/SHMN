<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
       location.href = "/sae_ticket/ticketBook?day=2";

    })
})

</script>
<body>
 <header>
   <h1>상세보기</h1>
   </header>
   <hr />
    
    <form name="readForm" method="post">
    <table>
    <!-- 	<tr>
    		 <td><label for = "tk_bno">번호</label>
    		<td><label for = "tk_bno">${read.tk_bno}</label></td>
    	</tr>-->
    	<tr>
    		<td><label for = "tk_name">구분</label>
    		<td><label for = "tk_name">${read.tk_name}</label></td>
    	</tr>
    	<tr>
    		<td><label for = "tk_price">가격</label>
    		<td><label for = "tk_price">${read.tk_price}</label></td>
    	</tr>
    	<tr>
    		<td><label for = "tk_stock ">예약 가능 인원</label>
    		<td><label for = "tk_stock ">${read.tk_stock }</label></td>
    	</tr>
    	<tr>
    		<td><label for = "tk_date ">예약 날짜</label>
    		<td><label for = "tk_date ">${read.tk_date }</label></td>
    	</tr>
    </table>
    	<input type="hidden" value="${read.tk_bno}" name="tk_bno"></input> 
    	<!-- form post: label로 못받음 input으로 꼭 -->
   
   
   <br>
   
   
   <!-- 관리자용 버튼 -->
      <c:if test = "${member.userId == 'admin' }">
      	<button type="button" class="update_btn">수정</button>
      	<button type="button" class="delete_btn">삭제</button>
   		<button type="button" class="list_btn">목록</button>
      </c:if>
      

	
    </form>
   <br>
   <hr />
</body>
</html>