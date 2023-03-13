<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
</head>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width:100%">
<div style="padding:50px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				예약하기<br><Br>
				</h1>
				<img src="/resources/img/tkback.jpg" style="width: 98%">
				</div>
				
				
		<h4> ${member.userId }님, ${vo.tk_date}  ${vo.tk_name} 예약 선택하셨습니다. 인원을 선택해 주세요.</h4>
		
		<div >
		<form name="readForm" class="readForm" method="post" action="/sae_ticket/ticketBuy" >
		<table style="width: 50%; margin:auto;">

		
		<tr style="border-bottom: 1px solid #ccc; height: 70px;">
		<td style="width: 30%; text-align: center;"><label>&nbsp;미취학</label>
		<br><label style="color:gray; font-size:90%; font-weight: normal;">만 12세 미만</label>
		</td>
		
			<td style = "text-align:center;">
    		<input type="hidden" value="미취학" name="ticketlist[0].bt_age"></input> 
    		<input type="hidden" value="${vo.tk_bno}" name="ticketlist[0].bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price - 1000}" name="ticketlist[0].bt_price"></input> 
    		<input type="number" value="0" min="0" max="5" name="ticketlist[0].bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="ticketlist[0].bt_id"></input> 
    		</td>
    		</tr>
   			<!--  max="${vo.tk_stock}" -->
   			
		<tr style="border-bottom: 1px solid #ccc; height: 70px;">
		<td style="width: 30%;  text-align: center;"><label>&nbsp;청소년</label>
		<br><label style="color:gray; font-size:90%; font-weight: normal;">만 19세 미만</label>
		</td>
		<td style = "text-align:center;">
   			<input type="hidden" value="청소년" name="ticketlist[1].bt_age"></input> 
   			<input type="hidden" value="${vo.tk_bno}" name="ticketlist[1].bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price - 500}" name="ticketlist[1].bt_price"></input> 
    		<input type="number" value="0" min="0" max="5" name="ticketlist[1].bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="ticketlist[1].bt_id"></input> 
    	</td></tr>
   			
   			
   		<tr style="border-bottom: 1px solid #ccc; height: 70px;">
		<td style="width: 30%; text-align: center;"><label>&nbsp;성인</label>
		<br><label style="color:gray; font-size:90%; font-weight: normal;">만 19세 이상</label>
		</td>
		
			<td style = "text-align:center;">
   			<input type="hidden" value="성인" name="ticketlist[2].bt_age"></input> 
   			<input type="hidden" value="${vo.tk_bno}" name="ticketlist[2].bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price}" name="ticketlist[2].bt_price"></input> 
    		<input type="number" value="0" min="0" max="5" name="ticketlist[2].bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="ticketlist[2].bt_id"></input> 
   			</td></tr>
   			
   		<tr style="border-bottom: 1px solid #ccc; height: 70px;">
		<td style="width: 30%; text-align: center;"><label>&nbsp;노인</label>
		<br><label style="color:gray; font-size:90%; font-weight: normal;">만 65세 이상</label>
		</td>
			<td style = "text-align:center;">
   			<input type="hidden" value="노인" name="ticketlist[3].bt_age"></input> 
   			<input type="hidden" value="${vo.tk_bno}" name="ticketlist[3].bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price - 1000}" name="ticketlist[3].bt_price"></input> 
    		<input type="number" value="0" min="0" max="5" name="ticketlist[3].bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="ticketlist[3].bt_id"></input> 
   			</td></tr>
   			
   			<br /><br/><br/>
   		</table>
		</form>
		
		<br /> 
		<div style="text-align: center;">
			<input type="button" value="뒤로" onclick="history.back(-1)" style="background-color: #45489a; color: white; border-color: #45489a;">
   			<button style="background-color: #45489a; color: white; border-color: #45489a;" type="submit"  onclick="bookCheck()">예약하기</button>
		</div>
	<script>

	function bookCheck(){
		let result = confirm("예약하시겠습니까?");
		
		event.preventDefault();
		
		if(result){
			alert("예약이 완료되었습니다.");
			document.readForm.submit();
		}else{
			return false;
		}
	}


	</script>
	</div>
	</div>
	</div>
</body>
</html>