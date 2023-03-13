<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<meta charset="UTF-8">
<title>예약 내역</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$(".buybtn").on("click", function() {
			requestPay();
		});

	});

	function requestPay() {
		//가맹점 식별코드
		var IMP = window.IMP;
		var total = $(".price").val();
		//IMP.request_pay(param, callback);
		IMP.init('imp13105565');
		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '티켓', //결제창에서 보여질 이름
			amount : total, //실제 결제되는 가격
			buyer_email : '${member.userMail}',
			buyer_name : '${member.userId}',
			buyer_tel : '${member.userTel}',
			buyer_addr : '${member.userAddress}',
			buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				alert(msg);
				return true;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}

		});
	}
</script>
<body>
	<%@include file="../include/nav.jsp"%>
	<div class="page-content">

		<div style="padding: 50px 0; height: 100%;">
			<div class="section-heading">
				<h1>
					예약 내역<br><br>
				</h1>

				<img src="/resources/img/tkback.jpg" style="width: 98%">
			</div>

			<h4 style= "width:90%; margin:auto;"> ${member.userId }님의 예약 내역 </h4>
		

		<tbody>

			<table  style="width:70%; margin:auto;">
				<tr style="border-bottom: 1px solid #ccc; height: 70px;">
					<td style="text-align: center;"><label>연령</label></td>
					<td style="text-align: center;"><label>수량</label></td>
					<td style="text-align: center;"><label>금액</label></td>
					<td style="text-align: center;"><label>취소</label></td>
				</tr>

				<c:set var="sum" value="0" />
				<c:forEach var="booklist" items="${booklist}">
				<tr style="border-bottom: 1px solid #ccc; height: 70px;">
					<td style = "text-align:center;"><c:out value="${booklist.bt_age}"></c:out></td>
					<td style = "text-align:center;"><c:out value="${booklist.bt_count}"></c:out>개</td>
					<td style = "text-align:center;"><c:out value="${booklist.bt_price}"></c:out>원</td>
		
					<td style = "text-align:center;">
					<a href="/sae_ticket/bookdelete?bt_bno=${booklist.bt_bno }&count=${booklist.bt_count}&bt_pno=${booklist.bt_pno}"
						type="button" class="delete_btn" onclick="removeCheck()">취소</a>
					</td>
				</tr>
				
				<br>
					<c:set var="sum" value="${sum + booklist.bt_count * booklist.bt_price }" />
				</c:forEach>
				</table>
		<br>
		
		<div style = "width:55%; margin:auto;">
			<tr style="border-bottom: 1px solid #ccc; height: 70px; width: 30%; text-align: center;">
				<label>합계: <c:out value="${sum }" />원</label>
			</tr>
			<br><br>
		</div>
		
		<div style="text-align: center;">
			<button style="background-color: #45489a; border-color: #45489a;">
				<a href="/sae_ticket/ticketList" style="color: white;">목록으로</a>
			</button>
			<button class="buybtn" style="background-color: #45489a; color: white; border-color: #45489a;" type="button">결제하기</button>
		</div>
			
		<input class="price" type="hidden" value="${sum }">

		</form>
	</div>
	</div>
</body>
</html>