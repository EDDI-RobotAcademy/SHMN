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

    		<input type="hidden" value="${vo.tk_bno}" name="bt_pno"></input> 
    		<input type="hidden" value="${vo.tk_price}" name="bt_price"></input> 
    		<input type="number" min="1" name="bt_count"></input> 
    		<input type="hidden" value="${member.userId}" name="bt_id"></input> 
   			<button type="submit" >	버튼</button>
		</form>
	
</body>
</html>