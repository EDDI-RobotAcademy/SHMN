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
<!-- CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<!-- JavaScript -->
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Golos+Text&family=Hahmlet:wght@300&display=swap')
	;
</style>
<script type="text/javascript">
	$(document).ready(function() {
						var formObj = $("form[name='readForm']");			
											
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
							if('${member.userId}' == null || '${member.userId}' == ""){
								alert("로그인 이후 이용가능합니다.");
								location.href = "/sae_member/login"
							}else {
								formObj.attr("action", "/sae_buy/buysingleView");
								formObj.attr("method", "get");
								formObj.submit();
							}
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
						// 장바구니
						$(".cart_btn").on("click", function() {
							form.ct_count = $("#pd_number").val();
							$.ajax({
								url: '/sae_cart/add',
								type: 'POST',
								data: form,
								success: function(result) {
									cartAlert(result);
								}
							})
						});
						
					
					
			function stockChk() {
			var number = $('#pd_number').val();
			if (number <= 0){
				alert("수량은 1이상 선택하셔야 합니다");
				$("#go_price").val(${read.pd_price });
				$('#pd_number').val('1');
				return ture;
			}
		}
		
		function stockoverChk() {
			var number = fnReplace($('#pd_number').val());
			var stock = ${read.pd_stock }
			if (number > stock){
				alert("재고가 부족합니다");
				$('#pd_number').val(number - 1);
				$("#go_price").val(fnReplace($('#pd_number').val()) * ${read.pd_price });
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
	
	const form = {
			
			pd_bno : '${read.pd_bno }',
			ct_pno : '${read.pd_bno }',
			ct_name : '${read.pd_name }',
			ct_price : '${read.pd_price }',
			ct_count : ''
	}
	
	function cartAlert(result) {
		if(result == '1'){
			alert("장바구니에 추가되었습니다");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '3'){
			alert("로그인이 필요합니다.");
			location.href = "/sae_member/login"
		}
	
	}
	
	
	<!-- 문의사항 게시판 -->
		//댓글 등록 이벤트
		$(".replyWriteBtn").on("click", function() {
		   var formObj = $("form[name='replyForm']");
		   formObj.attr("action", "/sae_product/replyWrite");
		   formObj.submit();
		}); 
		
		//댓글 삭제 view
		$(".replyDeleteBtn").on("click", function() {
			 if(confirm("삭제하시겠습니까?")){
			//삭제 했을때 이벤트
				 var modify = $(this).attr("data-pno");
				 $("#DeleteFormPno").val(modify);
				 var formObj = $("form[name='deleteForm']");
					formObj.submit(); 
			 }
			});
	});
</script>

<body>
	<%@include file="../include/nav.jsp"%>
	<div class="page-content" style="padding-bottom:0px">
		<div style="width: 80%; margin: 0px;">
			<div style="padding: 60px 0; height: 100%;">
				<div class="section-heading" style="margin: 0px;">
					<!-- <div class="section-heading" style="margin-bottom: 0px"> -->
					<h1>
						SAE-HA<br> <em>Shop</em>
					</h1>
					<p>
						It's a shop in Saehamano.<br> It consists of hanbok and
						products. Take a look.
					</p>
					<hr style="border: 3px solid #b4c3ff">
					<br>
					<!-- </div> -->
				</div>
				<section id="container">
					<br>
					<div style="display: flex; width: 100%">
						<div class="form-grop" style="padding-top: 0; width: 60%;">
							<div class="carousel" data-flickity>
								<c:forEach items="${imglist }" var="imglist">
									<div class="form-grop carousel-cell" style="width: 100%">
										<img style="height: 500px"
											src="/resources/productimg/${imglist.ipath }" /> <br>
									</div>
								</c:forEach>
							</div>
						</div>
						<div style="width: 3%"></div>
						<div style="width: 37%">
							<div class="form-grop">
								<label style="font-family: 'Hahmlet', serif; font-size: large">상품
									이름: </label> <input style="border: none; font-size: large" type="text"
									id="go_name" name="go_name" value="${read.pd_name }"
									readonly="readonly" />
							</div>
							<hr>
							<div style="font-family: 'Hahmlet', serif;">
								<label style="font-size: large">등록 날짜: </label> <label
									style="font-size: large"><fmt:formatDate
										value="${read.pd_date }" pattern="yyyy-MM-dd" /></label>
							</div>
							<hr>
							<div class="form-grop">
								<label style="font-family: 'Hahmlet', serif; font-size: large">재고
									수량: </label> <input style="border: none; font-size: large" type="text"
									id="go_stock" name="go_stock" value="${read.pd_stock }"
									readonly="readonly" />
							</div>
							<hr>
							<div class="form-grop">
								<label style="font-family: 'Hahmlet', serif; font-size: large">가격:
								</label> <input style="border: none; font-weight: 600; font-size: large"
									type="text" id="go_price" name="go_price"
									value="${read.pd_price }" readonly="readonly" />
								<hr>
								<form name="readForm" role="form" method="post">
									<input type="hidden" id="pd_bno" name="pd_bno"
										value="${read.pd_bno }" /> <input type="hidden" id="page"
										name="page" value="${scri.page }" /> <input type="hidden"
										id="perPageNum" name="perPageNum" value="${scri.perPageNum }" />
									<input type="hidden" id="searchType" name="searchType"
										value="${scri.searchType }" /> <input type="hidden"
										id="keyword" name="keyword" value="${scri.keyword }" /> <input
										type="hidden" id="pd_type" name="pd_type"
										value="${read.pd_type }" /><label
										style="font-family: 'Hahmlet', serif; font-size: large">선택수량:
									</label> <input
										style="width: 60px; border: 0px solid #ffffff; font-size: large"
										type="number" id="pd_number" name="pd_number" value="1" />
									<hr>
								</form>
							</div>
							<div class="form-grop">
								<div style="font-family: 'Hahmlet', serif; font-size: large">상세설명:
								</div>
								<textarea id="go_content" name="go_content"
									style="height: 100px; width: 100%; vertical-align: top; border: 0px solid #ffffff; font-size: large"
									readonly="readonly">${read.pd_content }</textarea>
							</div>
						</div>
					</div>
					<br> <br>
					<div class="form-grop" align="right">
						<c:if test="${member.userId == 'admin' }">
							<button type="button" class="update_btn btn btn-warning">수정</button>
							<button type="button" class="delete_btn btn btn-danger">삭제</button>
						</c:if>
						<c:if test="${read.pd_stock != 0 }">
							<button type="button" class="buy_btn btn btn-primary">구매</button>
							<button type="button" class="cart_btn btn btn-primary">장바구니에
								담기</button>
						</c:if>
						<button type="button" class="list_btn btn btn-primary">목록</button>
					</div>


					<c:if test="${read.pd_stock == 0 }">
						<h1>품절</h1>
					</c:if>

				</section>
			</div>
		</div>
	</div>
	<!-- 리뷰 공간 -->
	<iframe src="/sae_goodsboard/list?pno=${read.pd_bno }"
		style="width: 100%; height: 1200px; padding-top: 0px" frameBorder="0"></iframe>
	<!-- 리뷰 공간 -->

	<footer class="footer">
		<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
	</footer>
</body>
</html>