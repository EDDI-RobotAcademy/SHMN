<%@page import="org.apache.ibatis.javassist.CtBehavior"%>
<%@page import="com.kh.saeha.vo.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% List<CartVO> cartlist = (List)request.getAttribute("cartlist"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
	#input {
		 border:none;
	}
	#input:focus{
		outline:none;
	}
	#finalinput{
		 border:none;
		 width:200px;
 		 font-size:20px;
	}
	#finalinput:focus{
		outline:none;
	}
	
</style>
<script type="text/javascript">
var finaltotalval = $(".finaltotal").val();
var form;
	$(document).ready(function() {
		
		form = $("form[name='cartbuy']");
		var coupon;
		$('.couponval').val($(".coupon").val());
		
		
		for(var i = 0; i < <%=cartlist.size()%>; i++){
			
			$(".total" + i).val(fnReplace($('.price' + i).val()) * fnReplace($('.count' + i).val()));
			finaltotalchange();
			finaltotalval = fnReplace($("finaltotal").val());
			
			var totalEventListener = function() {
				var j = i;
				return function() {
					$(".count" + j).on("propertychange change paste input", function() {
						$(".total" + j).val(fnReplace($('.price' + j).val()) * fnReplace($('.count' + j).val()));
						$(".coupon").val("0");
						$('.couponval').val($(".coupon").val());
						finaltotalchange();
						finaltotalval = $("finaltotal").val();
						if(fnReplace($('.count' + j).val()) > fnReplace($('.stock' + j).val())){
							alert("재고수량 보다 많습니다. 최대 수량으로 적용됩니다");
							$('.count' + j).val($('.stock' + j).val());
							$(".total" + j).val(fnReplace($('.price' + j).val()) * fnReplace($('.count' + j).val()));
							$(".coupon").val("0");
							$('.couponval').val($(".coupon").val());
							
							finaltotalchange();
							finaltotalval = $("finaltotal").val();
						}
						
						if(fnReplace($('.count' + j).val()) <= 0){
							alert("수량은 1이상 선택하셔야 합니다.");
							$('.count' + j).val("1");
							$(".total" + j).val(fnReplace($('.price' + j).val()) * fnReplace($('.count' + j).val()));
							$(".coupon").val("0");
							$('.couponval').val($(".coupon").val());
							finaltotalchange();
							finaltotalval = $("finaltotal").val();
						}
						
					});
				}
			};
			var _totalEventListener = totalEventListener();
			_totalEventListener();
		}
		
		
		
		$(".coupon").change(function() {
			finaltotalchange();
			finaltotalval = $(".finaltotal").val();
			coupon = fnReplace($(".coupon").val());
			var er = finaltotalval - coupon;
			if(er <= 0){
				alert("쿠폰할인금액이 가격보다 같거나 높습니다!");
				$(".coupon").val("0");
				finaltotalval = fnReplace($("finaltotal").val());
				$('.couponval').val(coupon);
			} else {
				$(".finaltotal").val(finaltotalval - coupon);
				$('.couponval').val(coupon);
			}
		});
		
		$(".buybtn").on("click", function() {
			requestPay();
		});
		
	});
	
 	function requestPay(){
		var IMP = window.IMP; 
		var totals = $(".finaltotal").val();
		var names = "";
		<%
		for(int i = 0; i < cartlist.size(); i++){
			CartVO ct = (CartVO) cartlist.get(i);
		%>
			names += "<%=ct.getCt_name()%>";
		<%
		}
		%>
	    //IMP.request_pay(param, callback);
		IMP.init('imp13105565');
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : names, //결제창에서 보여질 이름
		    amount : totals, //실제 결제되는 가격
		    buyer_email : '${member.userMail}',
		    buyer_name : '${member.userId}',
		    buyer_tel : '${member.userTel}',
		    buyer_addr : '${member.userAddress}',
		    buyer_postcode : '123-4567'
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
	
	function fnReplace(val) {
	    var ret = 0;
	    if(typeof val != "undefined" && val != null && val != ""){
	        ret = Number(val.replace(/,/gi,''));
	    }
	    return ret;        
	}
	
	function finaltotalchange() {
		var finaltotal = 0;
		
		for(var i = 0; i < <%=cartlist.size()%>; i++){
			finaltotal += fnReplace($('.price' + i).val()) * fnReplace($('.count' + i).val());
		}
		
		$(".finaltotal").val(finaltotal);
		$(".totaltotal").val(finaltotal);
	}
	
</script>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<div class="container">
		<header>
			<h1>${member.userId }님의 장바구니 목록</h1>
		</header>
		<hr/>
		<% if(cartlist.size() != 0){ %>
			<form name="cartbuy" action="/sae_buy/buycart" role="form" method="post">
				<table class="table table-hover">
					<thead>
						<tr>
							<th></th>
							<th>상품 사진</th>
							<th>상품 이름</th>
							<th>재고 수량</th>
							<th>하나당 가격</th>
							<th>수량</th>
							<th>총 가격</th>
						</tr>
					</thead>
							<%
								for(int i = 0; i < cartlist.size(); i++){
									CartVO ct = (CartVO) cartlist.get(i);
									if(ct.getCt_stock() == 0){
							%>
							<meta http-equiv="refresh" content="0; URL='/sae_cart/cartdelete?ct_pno=<%=ct.getCt_pno()%>'">
							<%
							} 
							%>
					<tr>
							<td>
							</td>
							<td>
								<a href="/sae_product/read?pd_bno=<%=ct.getCt_pno()%>"><img height="100px" width="100px"
								 src="/resources/productimg/<%=ct.getP_filepath() %>"></a>
							</td>
							<td>
								<input type="hidden" name="buyvolist[<%=i %>].by_id" value="${member.userId }">
								<input type="hidden" name="buyvolist[<%=i %>].by_pno" value="<%=ct.getCt_pno()%>">
								<input name="buyvolist[<%=i %>].by_name" id="input" type="text" value="<%= ct.getCt_name()%>" readonly="readonly" style="text-align:center">
							</td>
							<td>
								<input id="input" class="stock<%=i %>" type="text" value="<%= ct.getCt_stock()%>" readonly="readonly" style="text-align:center">
							</td>
							<td>
								<input id="input" class="price<%=i %>" type="text" value="<%= ct.getCt_price()%>" readonly="readonly" style="text-align:center">
							</td>
							<td>
								<input name="buyvolist[<%=i %>].by_count" type="number" class="count<%=i %>"  value="<%= ct.getCt_count()%>" max="<%= ct.getCt_stock()%>" style="text-align:center">
							</td>
							<td>
								<input name="buyvolist[<%=i %>].by_price" id="input" class="total<%=i %>" style="text-align:center" readonly="readonly">
							</td>
							<td>
								<button type="button" onclick="location.href='/sae_cart/cartdelete?ct_pno=<%=ct.getCt_pno()%>'">삭제</button>
							</td>
					</tr>
					<%
						}
					%>
				</table>
				<div>
					<div>
						<select class="coupon" name="coupon_price">
							<option value="0">쿠폰없음</option>
							<c:forEach items="${couponlist }" var="couponlist">
								<c:if test="${couponlist.coupon_content != '사용완료' }">
									<option value="${couponlist.coupon_price }">
										<c:out value="${couponlist.coupon_name }" /></option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
				<br>
				<br>
				<br>
					<table>
						<tr>
							<td style="text-align:center">가격</td>
							<td style="text-align:center">쿠폰</td>
							<td style="text-align:center">결제할 금액</td>
						</tr>
						<tr>
							<td>
								<input type="text" style="text-align:center" id="finalinput" class="totaltotal" readonly="readonly"> -
							</td>
							<td>
								 <input type="text" style="text-align:center" id="finalinput" class="couponval" readonly="readonly"> 
							</td>
							<td>
							 = <input id="finalinput" style="text-align:center" type="text" class="finaltotal" value="" readonly="readonly">
							</td>
						</tr>
					</table>
			</form>
			<button class="buybtn">카카오페이로 결제하기</button>
	</div>
	<%
		}
	%>
</body>
</html>