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
				alert("구매수량은 1이상 입력하셔야 합니다");
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
	<section id="container">


		<div class="form-grop">
			<label for="title" class="col-sm-2 control-label">상품 이름</label> <input
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
				id="pd_type" name="pd_type" value="${read.pd_type }" /><input
				type="number" id="pd_number" name="pd_number" value="1" />
		</form>

		<c:if test="${read.pd_stock == 0 }">
			<h1>품절</h1>
		</c:if>

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
			<c:if test="${read.pd_stock != 0 }">
				<button type="button" class="buy_btn btn btn-primary">구매</button>
				<button type="button" class="cart_btn btn btn-primary">장바구니에
					담기</button>
			</c:if>

			<button type="button" class="list_btn btn btn-primary">목록</button>

		</div>
	</section>
	<!-- 댓글 보기 -->
	<hr />
	<div id="reply">
		<ol class="replyList">
			<c:forEach items="${replyList}" var="replyList">
				<!--  var 사용할 변수 명  -->
				<p>
					작성자: ${replyList.py_writer }님/
					<fmt:formatDate value="${replyList.py_date}" pattern="yyyy-MM-dd" />
				</p>
				<p>문의 내용 : ${replyList.py_content }</p>

				<%-- <c:if test="${member.userId != true == 'admin'}"> --%>
				<!-- 댓글을 쓴 사람과 관리자만이 삭제 할 수 있다. -->
				<div>
					<%-- <button type="button" class="replyUpdateBtn" data-pno="${replyList.py_pno}">수정</button> --%>
					<button type="button" class="replyDeleteBtn"
						data-pno="${replyList.py_pno}">삭제</button>
					<c:if test="${member.userId == 'admin' }">
						<!-- 아이디 admin 만이 답글을 달 수 있다. -->
						<button type="submit">답글달기</button>
					</c:if>
				</div>

			</c:forEach>
		</ol>
	</div>

	<hr>


	<!-- 댓글 작성 폼 -->
	<c:if test="${member.userId != null}">
		<div>
			<form name="replyForm" method="get" >
				<input type="hidden" id="bno" name="py_bno" value="${read.pd_bno }" />
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">
				<p>
					<label for="writer"> 작성자 : </label> <input type="text" id="writer"
						name="py_writer" value="${member.userId}" readonly="readonly" />
				</p>
				<p>
					<label for="content">문의</label> <input type="text" id="content"
						name="py_content" />
				</p>
				<p>
					<button type="submit" class="replyWriteBtn">댓글 작성</button>
				</p>
			</form>
		</div>
	</c:if>

<!-- 리뷰 공간 -->
<iframe src="/sae_goodsboard/list?pno=${read.pd_bno }" style="width:100%; height:600px" frameBorder="0"></iframe>
<!-- 리뷰 공간 -->


	<!-- 삭제 폼 -->
	<form name="deleteForm" role="form" method="post"
		action="/sae_product/replyDelete">
		<input type="hidden" id="bno" name="py_bno" value="${read.pd_bno}"
			readonly="readonly" /> <input type="hidden" id="DeleteFormPno"
			name="py_pno" /> <input type="hidden" id="page" name="page"
			value="${scri.page }" /> <input type="hidden" id="perPageNum"
			name="perPageNum" value="${scri.perPageNum }" /> <input
			type="hidden" id="searchType" name="searchType"
			value="${scri.searchType }" /> <input type="hidden" id="keyword"
			name="keyword" value="${scri.keyword }" />
	</form>
</body>
</html>