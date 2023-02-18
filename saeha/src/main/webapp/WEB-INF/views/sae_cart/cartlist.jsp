<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
	#input {
		 border:none;
	}
	#input:focus{
		outline:none;
	}
</style>

<script type="text/javascript">

	$(document).ready(function() {
		
		
		setTotalInfo();
		
	});
	
	function setTotalInfo(){
		let totalprice = 0; // 총 가격
		let finaltotalprice = 0;
		$(".cart_td").each(function(index, element) {
			totalprice += parseInt($(element).find(".total_price_input").val());
		});
		$(".totalprice").text(totalprice);
	}
	
	
	

</script>
<body>
	<div class="container">
		<header>
			<h1>${member.userId }님의 장바구니 목록</h1>
		</header>
		<hr/>

		<section id="container">
			<form role="form" method="get">
				<table class="table table-hover">
					<thead>
						<tr>
							<th></th>
							<th>상품 사진</th>
							<th>상품 이름</th>
							<th>재고 수량</th>
							<th>수량</th>
							<th>하나당 가격</th>
							<th>총 가격</th>
						</tr>
					</thead>
					<c:forEach items="${cartlist }" var="cartlist">
						<tr>
							<td class="cart_td">
								<input type="hidden" class="price_input" value="${cartlist.ct_price }">
								<input type="hidden" class="total_price_input" value="${cartlist.ct_price * cartlist.ct_count }">
							</td>
							<td><a href="/sae_product/read?pd_bno=${cartlist.ct_pno}"><img height="100px" width="100px"
							 src="/resources/productimg/${cartlist.p_filepath}"></a></td>
							<td><input style="text-align:center" id="input" type="text" value="${cartlist.ct_name }" readonly="readonly"></td>
							<td><input style="text-align:center" id="input" type="number" value="${cartlist.ct_stock }" readonly="readonly"></td>
							<td><input style="text-align:center" class="eatchnumber" type="number" value="${cartlist.ct_count }"></td>
							<td><input style="text-align:center" id="input" type="text" value="${cartlist.ct_price }" readonly="readonly"></td>
							<td><input style="text-align:center" class="totalprice" id="input" type="text" value="" readonly="readonly"></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</section>
	</div>
</body>
</html>