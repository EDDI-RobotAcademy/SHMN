<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript">

var form;
var temporary = $("#pd_total").val();
var totalval = temporary;
$(document).ready(function() {
	form = $("form[name='singlebuy']");
	var coupon;
	var total;

	
	var fpd_number = fnReplace($('#pd_number').val());
	var fprice = fnReplace($('#pd_price').val());
	
	$("#pd_total").val(fpd_number * fprice);
	totalval = $("#pd_total").val();
	
	$("#pd_number").change(function() {
		if(stockChk()){
			return false;
		}
		if(stockoverChk()){
			return false;
		}
		});
	
	$("#pd_number").on("propertychange change paste input", function() {
		var pd_number = fnReplace($('#pd_number').val());
		var price = fnReplace($('#pd_price').val());
		
		$(".coupon").val("0");
		$("#pd_total").val(pd_number * price);
		totalval = $("#pd_total").val();
	});
	
	$(".buybtn").on("click", function() {
		requestPay();
	});
	
	$(".coupon").change(function() {
		coupon = $('.coupon').val();
		var er = totalval - coupon;
		if(er <= 0){
			alert("쿠폰할인금액이 가격보다 같거나 높습니다!");
			$(".coupon").val("0");
			$("#pd_total").val(totalval);
			totalval = $("#pd_total").val();
		}else{
			$('#pd_total').val(totalval - coupon);
		}

	});
	
	
	
})

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
	        alert(msg);
	        form.attr("method","post");
			form.submit();
	        return true;
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	         alert(msg);
	    }
	    
	});
}

function stockChk() {
	var number = $('#pd_number').val();
	if (number <= 0){
		alert("구매수량은 1이상 입력하셔야 합니다");
		$('#pd_number').val('1');
		$("#pd_total").val(fnReplace($('#pd_number').val()) * fnReplace($('#pd_price').val()));
		totalval = $("#pd_total").val();
		return ture;
	}
}

function stockoverChk() {

	var number = fnReplace($('#pd_number').val());
	var stock = ${buylist.pd_stock };
	if (number > stock){
		alert("재고가 부족합니다.");
		$('#pd_number').val(number - 1);
		$("#pd_total").val(fnReplace($('#pd_number').val()) * fnReplace($('#pd_price').val()));
		totalval = $("#pd_total").val();
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
<meta charset="UTF-8">
<title>상품 구매</title>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
<style type="text/css">
input{border: none;}
</style>
</head>

<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0;height: 100%;width: 90%;">
<div class="section-heading">
				<h1>Purchasing<br><em>Products</em></h1>
                        <p>Curabitur hendrerit mauris mollis ipsum vulputate rutrum. 
                        <br>Phasellus luctus odio eget dui imperdiet.</p>
                        
                    </div>
	
	<form name="singlebuy" action="/sae_buy/buysingle" role="form" method="post">
		<input	type="hidden" id="pd_pno" name="by_pno" class="form-control"
				value="${buylist.pd_bno }"/>

<h3>
					구매하기
				</h3>				
<div style="width: 80%;">
<table style="width:100%;text-align: center;">
<tr style="height: 50px;
    border-top: 2px solid #333;
    border-bottom: 1px solid #444;">
<td>번호</td>
<td colspan="2">제품정보</td>
<td>수량</td>
<td>상품가격</td>
<td>삭제</td>
</tr>
 <tr style=" border-bottom: 0.5px solid #eee;">
    <td style="padding:10px 0;">1</td>
    <td style="padding:10px 0;width:80px;height: 100px;background-color: orange;"><img src="/resources/productimg/${img}"/></td>
     <td style="padding:10px 0;"><input
				type="text" id="pd_name" name="go_name" 
				value="${buylist.pd_name }" readonly="readonly" /></td>
     <td style="padding:10px 0;">
     <input	type="number" id="pd_number" name="by_count"value="${number }" />/
     <input	type="text" id="pd_stock" name="go_stock"value="${buylist.pd_stock }" readonly="readonly" /></td>
     <td style="padding:10px 0;"><input
				type="text" id="pd_price" name="go_price" 
				value="${buylist.pd_price }" readonly="readonly" /></td>
    <td style="padding:10px 0;"><button style="background: none;border: 1px solid #eee;">X</button></td>
  </tr>
</table>		
	<br><br><br><br><br>

<div style="display: flex; border-top: 2px solid #444;border-bottom: 2px solid #444;padding: 20px 0;justify-content: center;">
<div style="width: 50%; font-size: x-large;font-weight: 600;"> 총 주문금액</div>
<div style="width:40%;">
  <div style="display: flex; justify-content: space-between;padding: 10px 0;">주문상품 수 <span>3개</span></div>
  <div style="display: flex; justify-content: space-between;padding: 10px 0;">주문금액 <span>35000원</span></div>
  <div style="display: flex; justify-content: space-between;padding: 10px 0;">쿠폰  
 <select class="coupon" name="coupon_price">
			<option value="0">쿠폰없음</option>
			<c:forEach items="${couponlist }" var="couponlist">	
					<c:if test="${couponlist.coupon_content != '사용완료' }">
						<option value="${couponlist.coupon_price }">
						<c:out value="${couponlist.coupon_name }"/></option>
					</c:if>
			</c:forEach>
		</select>
		</div>
  <hr>
  <div style="display: flex; justify-content: space-between;padding: 10px 0;font-size: large;font-weight: 600;">최종결제금액
  <span style="color: red;"><input
				type="text" id="pd_total" name="by_price" 
				value="${buylist.pd_price }" readonly="readonly" /></span></div>
</div>

</div>
<br>
<div style="text-align: center;">
	<button onclick="history.go(-1)" style="background-color: #333;font-size:17px; height:45px;border-radius:10px; color: white;padding:0 10px;">뒤로</button>
	&nbsp;
	<button class="buybtn" style="background-color: white;font-size:17px; height:45px;border-radius:10px; color: black;">카카오페이로 결제하기</button>
</div>	
	</div>	

	</form>

	</div>
	</div>
	<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
	
</body>
</html>