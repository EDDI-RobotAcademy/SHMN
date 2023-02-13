<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript">

function requestPay(){
	//가맹점 식별코드
	var IMP = window.IMP; 
	var total = $("#pd_total").val();
    //IMP.request_pay(param, callback);
	IMP.init('imp13105565');
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${buylist.pd_name }' , //결제창에서 보여질 이름
	    amount : total, //실제 결제되는 가격
	    buyer_email : '${member.userMail}',
	    buyer_name : '${member.userId}',
	    buyer_tel : '${member.userTel}',
	    buyer_addr : '${member.userAddress}',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>
<meta charset="UTF-8">
<title>상품 구매</title>
</head>

<body>
	<div class="container">
	
		<form role="form" method="get">
		
	<div class="form-grop">
		<img src="/resources/productimg/${img}"/>
	</div>
	<div class="form-grop">
			<label for="title" class="col-sm-2 control-label">굿즈 이름</label> <input
				type="text" id="pd_name" name="go_name" class="form-control"
				value="${buylist.pd_name }" readonly="readonly" />
		</div>

		<div class="form-grop">
			<label for="title" class="col-sm-2 control-label">재고 수량</label> <input
				type="text" id="pd_stock" name="go_stock" class="form-control"
				value="${buylist.pd_stock }" readonly="readonly" />
		</div>

		<div class="form-grop">
			<label for="title" class="col-sm-2 control-label">하나당가격</label> <input
				type="text" id="pd_price" name="go_price" class="form-control"
				value="${buylist.pd_price }" readonly="readonly" />
		</div>
		
		<div class="form-grop">
			<label for="title" class="col-sm-2 control-label">총가격</label> <input
				type="text" id="pd_total" name="pd_total" class="form-control"
				value="${buylist.pd_price }" readonly="readonly" />
		</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		var fpd_number = fnReplace($('#pd_number').val());
		var fprice = fnReplace($('#pd_price').val());
		
		$("#pd_total").val(fpd_number * fprice);
		
		
		$("#pd_number").change(function() {
			if(stockChk()){
				return false;
			}
			});
		
		$("#pd_number").on("propertychange change paste input", function() {
			var pd_number = fnReplace($('#pd_number').val());
			var price = fnReplace($('#pd_price').val());
			
			$("#pd_total").val(pd_number * price);
			
		});
	})
	
	function stockChk() {
		var number = $('#pd_number').val();
		if (number <= 0){
			alert("구매수량은 1이상 입력하셔야 합니다");
			$("#pd_total").val(${buylist.pd_price });
			$('#pd_number').val('1');
			return ture;
		}
	}
	function fnReplace(val) {
	    var ret = 0;
	    if(typeof val != "undefined" && val != null && val != ""){
	        ret = Number(val.replace(/,/gi,''));
	    }
	    return ret;        
	}
	</script>

	<div class="form-grop">
			<lable for="title" class="col-sm-2 control-label">수량</lable>
			 <input
				type="number" id="pd_number" name="pd_number"
				value="${number }" />
		</div>
		</form>
	</div>
	
	<div>
		<select name="coupon">
			<option value="">쿠폰없음</option>
			<c:forEach items="${couponlist }" var="couponlist">	
					
						<option value="${couponlist.coupon_name }"><c:out value="${couponlist.coupon_name }"/></option>
				
			</c:forEach>
	</select>
	</div>
	<button onclick="requestPay()">결제하기</button>
</body>
</html>