<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 등록</title>
</head>
<script type="text/javascript">

$(document).ready(function() {
	var formObj = $("form[name='writeForm']");
	
	$(".write_btn").on("click", function() {
		
	
	formObj.attr("action", "/sae_ticket/tkWrite");
	formObj.attr("method", "post");
	formObj.submit();
	});
})
</script>
<body>
<div id = "root">

<header>
	<h1>입장권 등록</h1>
</header>
	<hr />

	<form action="/sae_ticket/tkWrite" name = "writeForm" method="POST">
	<table>
	<tbody>
		
	<!--  	<tr><td>
			<label for= "tk_bno">입장권 번호</label><input type="text" id="tk_bno" name="tk_bno" />
			</td>
		</tr>-->
		<tr><td>
			<label for= "tk_name">입장 분류</label>
				<input type="radio" value="일반" id="tk_name" name="tk_name"> 일반 
				<input type="radio" value="야간" id="tk_name" name="tk_name"> 야간
			</td>
		</tr>
		<tr><td>
			<label for= "tk_price">가격</label><input type="text" id="tk_price" name="tk_price"/>
			</td>
		</tr>
		<tr><td>
			<label for= "tk_stock">예약 가능 인원</label><input type="text" id="tk_stock" name="tk_stock"  />
			</td>
		</tr>
		<tr><td>
			<label for= "tk_date">예약 날짜</label><input type="date" id="tk_date" name="tk_date"  />
			</td>
		</tr>

		<tr>	
			<td>
			<button class="write_btn" type="submit">작성</button> 
			<input type="button" value="뒤로" onclick="history.back(-1)">
			</td>
		</tr>
		
		
	</tbody>
	</table>
	</form>
	</div>
</body>
</html>
	