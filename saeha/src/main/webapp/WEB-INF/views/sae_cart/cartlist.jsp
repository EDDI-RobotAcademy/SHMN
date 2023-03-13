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
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
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
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width: 90%;">
<div style="padding:60px 0;height: 100%;width: 90%;">
<div class="section-heading">
				<h1>Saehamano<br><em>MyCart</em></h1>
                        <p>Curabitur hendrerit mauris mollis ipsum vulputate rutrum. 
                        <br>Phasellus luctus odio eget dui imperdiet.</p>
                        
                    </div>

		<% if(cartlist.size() != 0){ %>
			<form name="cartbuy" action="/sae_buy/buycart" role="form" method="post">

			<h3>${member.userId }님의 장바구니 목록</h3>
<div style="width: 80%;">
<table style="width:100%;text-align: center;">
<tr style="height: 50px;
    border-top: 2px solid #333;
    border-bottom: 1px solid #444;">
<td>번호</td>
<td colspan="2">제품정보</td>
<td>수량</td>
<td>상품가격</td>
<td>총 가격</td>
<td>삭제</td>
</tr>

							<%
								for(int i = 0; i < cartlist.size(); i++){
									CartVO ct = (CartVO) cartlist.get(i);
									if(ct.getCt_stock() <= 0){
							%>
							<meta http-equiv="refresh" content="0; URL='/sae_cart/cartdelete?ct_pno=<%=ct.getCt_pno()%>'">
							<%
							} 
							%>
 <tr style=" border-bottom: 0.5px solid #eee;">
    <td style="padding:10px 0;">1</td>
    <td style="padding:10px 0;width:80px;height: 100px;background-color: orange;"><a href="/sae_product/read?pd_bno=<%=ct.getCt_pno()%>"><img height="100px" width="100px"
								 src="/resources/productimg/<%=ct.getP_filepath() %>"></a></td>
     <td style="padding:10px 0;">
     <input type="hidden" name="buyvolist[<%=i %>].by_id" value="${member.userId }">
								<input type="hidden" name="buyvolist[<%=i %>].by_pno" value="<%=ct.getCt_pno()%>">
								<input name="buyvolist[<%=i %>].by_name" id="input" type="text" value="<%= ct.getCt_name()%>" readonly="readonly" style="text-align:center">
							
		</td>
     <td style="padding:10px 0;">
     <input name="buyvolist[<%=i %>].by_count" type="number" class="count<%=i %>"  value="<%= ct.getCt_count()%>" max="<%= ct.getCt_stock()%>" style="text-align:center">/
     <input id="input" class="stock<%=i %>" type="text" value="<%= ct.getCt_stock()%>" readonly="readonly" style="text-align:center"></td>
     <td style="padding:10px 0;">
     <input id="input" class="price<%=i %>" type="text" value="<%= ct.getCt_price()%>" readonly="readonly" style="text-align:center">
	</td>
    <td style="padding:10px 0;"><input name="buyvolist[<%=i %>].by_price" id="input" class="total<%=i %>" style="text-align:center" readonly="readonly"></button></td>
  <td>
	<button style="background: none;border: 1px solid #eee;" type="button" onclick="location.href='/sae_cart/cartdelete?ct_pno=<%=ct.getCt_pno()%>'">X</button>		  
  </td>
  </tr>		
					<%
						}
					%>
</table>
<br><br><br><br><br>


<div style="display: flex; border-top: 2px solid #444;border-bottom: 2px solid #444;padding: 20px 0;justify-content: center;">
<div style="width: 50%; font-size: x-large;font-weight: 600;"> 총 주문금액</div>
<div style="width:40%;">
  <div style="display: flex; justify-content: space-between;padding: 10px 0;">주문상품 수 <span>3개</span></div>
  <div style="display: flex; justify-content: space-between;padding: 10px 0;">주문금액 <span><input type="text" style="text-align:center" id="finalinput" class="totaltotal" readonly="readonly"></span></div>
  <div style="display: flex; justify-content: space-between;padding: 10px 0;">
  <select class="coupon" name="coupon_price">
							<option value="0">쿠폰없음</option>
							<c:forEach items="${couponlist }" var="couponlist">
								<c:if test="${couponlist.coupon_content != '사용완료' }">
									<option value="${couponlist.coupon_price }">
										<c:out value="${couponlist.coupon_name }" /></option>
								</c:if>
							</c:forEach>
						</select>
  <input type="text" style="text-align:center" id="finalinput" class="couponval" readonly="readonly">  
</div>
  <hr>
  <div style="display: flex; justify-content: space-between;padding: 10px 0;font-size: large;font-weight: 600;">최종결제금액
  <span style="color: red;"><input id="finalinput" style="text-align:center" type="text" class="finaltotal" value="" readonly="readonly"></span></div>
</div>

</div>
			</form>
<br>
	</div>	
<div style="text-align: center;">
	<button class="buybtn" style="background-color: white;font-size:17px; height:45px;border-radius:10px; color: black;">카카오페이로 결제하기</button>
</div>	

			
	</div>
	
	<!-- </div> -->
	
	<%
		}
	%>
	</div>
		<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
	
</body>
</html>