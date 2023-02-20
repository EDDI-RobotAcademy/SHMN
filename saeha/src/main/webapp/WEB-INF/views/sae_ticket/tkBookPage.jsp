<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
</head>
<body>
		<form name="readForm" class="readForm" method="post" action="/sae_ticket/ticketBuy">
		
			<span>미취학</span>
    		<input type="hidden" value="미취학" name="ticketlist[0].bt_age"></input> 
    		<input type="hidden" value="${vo.tk_bno}" name="ticketlist[0].bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price - 1000}" name="ticketlist[0].bt_price"></input> 
    		<input type="number" value="0" min="0" max="${vo.tk_stock}" name="ticketlist[0].bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="ticketlist[0].bt_id"></input> 
   			
   			
   			<span>청소년</span>
   			 <input type="hidden" value="청소년" name="ticketlist[1].bt_age"></input> 
   			<input type="hidden" value="${vo.tk_bno}" name="ticketlist[1].bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price - 500}" name="ticketlist[1].bt_price"></input> 
    		<input type="number"  value="0" min="0" max="${vo.tk_stock}" name="ticketlist[1].bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="ticketlist[1].bt_id"></input> 
   			
   			
   			<span>성인</span>
   			<input type="hidden" value="성인" name="ticketlist[2].bt_age"></input> 
   			
   			<input type="hidden" value="${vo.tk_bno}" name="ticketlist[2].bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price}" name="ticketlist[2].bt_price"></input> 
    		<input type="number"  value="0" min="0" max="${vo.tk_stock}" name="ticketlist[2].bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="ticketlist[2].bt_id"></input> 
   			
   			
   			<span>노인</span>
   			<input type="hidden" value="노인" name="ticketlist[3].bt_age"></input> 
   			<input type="hidden" value="${vo.tk_bno}" name="ticketlist[3].bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price - 1000}" name="ticketlist[3].bt_price"></input> 
    		<input type="number"  value="0" min="0" max="${vo.tk_stock}" name="ticketlist[3].bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="ticketlist[3].bt_id"></input> 
   			
   			<button type="submit" >	버튼</button>
		</form>
	
</body>
</html>