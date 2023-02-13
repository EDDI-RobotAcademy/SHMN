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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판 goodsView</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
						var formObj = $("form[name='readForm']");
						// 구매수량 개수
						$("#pd_number").change(function() {
							if(stockChk()){
								return false;
							}
							});
						
						$("#pd_number").on("propertychange change paste input", function() {
							var pd_number = fnReplace($('#pd_number').val());
							var price = fnReplace($('#go_price').val());
							
							$("#go_price").val(pd_number * ${read.pd_price });
						});
						
						
						//수정
						$(".update_btn").on("click", function() {
							formObj.attr("action", "/sae_product/productupdate");
							formObj.attr("method", "get");
							formObj.submit();
						});
						// 구매
						$(".buy_btn").on("click", function() {
							formObj.attr("action", "/sae_buy/buysingle");
							formObj.attr("method", "get");
							formObj.submit();
						});
						//삭제
						$(".delete_btn").on("click", function() {
							var deleteYN = confirm("삭제하시겠습니까?");

							if (deleteYN == true) {
								formObj.attr("action", "/sae_product/delete");
								formObj.attr("method", "post");
								formObj.submit();
							}
						});

						//목록
						$(".list_btn").on("click",function() {
							
							if (${read.pd_type == "g"}){
								location.href = "/sae_product/goodslist?page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
							} else {
								location.href = "/sae_product/hanboklist?page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
							    + "&searchType=${scri.searchType}&keyword=${scri.keyword}";
							}
							
						});
										
						//장바구니
						$(".cart_btn").on("click",function() {
									location.href = "/sae_product/goodslist?page=${scri.page}"
											+ "&perPageNum=${scri.perPageNum}"
											+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										});
										
						

					})
					
		function stockChk() {
		var number = $('#pd_number').val();
		if (number <= 0){
			alert("구매수량은 1이상 입력하셔야 합니다");
			$("#go_price").val(${read.pd_price });
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
<body>
	<section id="container">
		

		<div class="form-grop">
			<label for="title" class="col-sm-2 control-label">굿즈 이름</label> <input
				type="text" id="go_name" name="go_name" class="form-control"
				value="${read.pd_name }" readonly="readonly" />
		</div>

		<div class="form-grop">
			<label for="content" class="col-sm-2 control-label">상세설명</label> <input
				type="text" id="go_content" name="go_content" class="form-control"
				value="${read.pd_content }" readonly="readonly" />
		</div>

		<div class="form-grop">
			<label for="title" class="col-sm-2 control-label">재고 수량</label> <input
				type="text" id="go_stock" name="go_stock" class="form-control"
				value="${read.pd_stock }" readonly="readonly" />
		</div>

		<div class="form-grop">
			<label for="title" class="col-sm-2 control-label">가격</label> <input
				type="text" id="go_price" name="go_price" class="form-control"
				value="${read.pd_price }" readonly="readonly" />
		</div>

		
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="pd_bno" name="pd_bno"
				value="${read.pd_bno }" /> <input type="hidden" id="page"
				name="page" value="${scri.page }" /> <input type="hidden"
				id="perPageNum" name="perPageNum" value="${scri.perPageNum }" /> <input
				type="hidden" id="searchType" name="searchType"
				value="${scri.searchType }" /> <input type="hidden" id="keyword"
				name="keyword" value="${scri.keyword }" /> <input type="hidden"
				id="pd_type" name="pd_type" value="${read.pd_type }" />구매 갯수<input
				type="number" id="pd_number" name="pd_number" value="1"/>
		</form>

		<div class="form-grop">
			<label for="go_date" class="col-sm-2 control-label">등록 날짜</label>
			<fmt:formatDate value="${read.pd_date }" pattern="yyyy-MM-dd" />
		</div>

		<c:forEach items="${imglist }" var="imglist">
			<div class="form-grop">

				<img src="/resources/productimg/${imglist.ipath }" />
			</div>

			<br>
		</c:forEach>
		<div>
			<c:if test="${member.userId == 'admin' }">
				<button type="button" class="update_btn btn btn-warning">수정</button>
				<button type="button" class="delete_btn btn btn-danger">삭제</button>
			</c:if>
			<button type="button" class="buy_btn btn btn-primary">구매</button>
			<button type="button" class="list_btn btn btn-primary">목록</button>
			<button type="button" class="cart_btn btn btn-primary">장바구니에
				담기</button>
		</div>
	</section>
</body>
</html>