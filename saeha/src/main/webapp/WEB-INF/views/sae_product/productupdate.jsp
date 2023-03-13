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
<title>update updateView.jsp</title>
</head>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='updateForm']");

						$(".cancel_btn")
								.on(
										"click",
										function() {
											location.href = "/sae_product/read?pd_bno=${update.pd_bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}";
										});

						$(".update_btn").on("click", function() {
							if (fn_valiChk()) {
								return false;
							}
							formObj.attr("action", "/sae_product/update");
							formObj.attr("method", "post");
							formObj.submit();
						});
					});

	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width:90%">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;상품 수정				</h1>
	</div>

	<div id="root">
			<form name="updateForm" enctype="multipart/form-data" role="form"
				method="post" action="/sae_product/update">
				<input type="hidden" name="pd_bno" value="${update.pd_bno }"
					readonly="readonly" /> <input type="hidden" id="page" name="page"
					value="${scri.page }"> <input type="hidden" id="perPageNum"
					name="perPageNum" value="${scri.perPageNum }"> <input
					type="hidden" id="searchType" name="searchType"
					value="${scri.searchType }"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword }"> <input
					type="hidden" name="pd_type" value="${update.pd_type }"
					readonly="readonly" />


				<table style="width:65%;">
						<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
							<label for="pd_name">상품 이름</label>
							</td><td>
							<input type="text"
								id="pd_name" name="pd_name" value="${update.pd_name }"
								class="chk" title="상품 이름을 입력하세요." /></td>
						</tr>
							<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
							<label for="pd_content">상세 설명</label></td><td>
							<textarea id="pd_content" name="pd_content" class="chk"
									title="상세 설명을 입력하세요."><c:out
										value="${update.pd_content }"></c:out></textarea></td>
						</tr>
							<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
							<label for="pd_stock">재고 수량</label>
							</td><td>
							<input type="number"
								id="pd_stock" name="pd_stock" value="${update.pd_stock }"
								class="chk" title="재고 수량을 입력하세요." /></td>
						</tr>
	<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">						
<label for="pd_price">가격</label>
</td><td>
<input type="number"
								id="pd_price" name="pd_price" value="${update.pd_price }"
								class="chk" title="가격을 입력하세요." /></td>
						</tr>
	<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">						
<label for="uploadFile">상품사진</label>
</td><td>
<input
								multiple="multiple" type="file" id="file" name="file"
								class="chk" title="상품 사진을 입력하세요" /> 
						</tr>
	<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">						
<label for="regdate">등록 날짜</label> 
</td><td>
<fmt:formatDate
									value="${update.pd_date }" pattern="yyyy-MM-dd" /></td>
						</tr>
	<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
	<td style="float: right;" colspan="2">
	<button type="submit" class="update_btn">저장</button>&nbsp;&nbsp;
					<button type="button" class="cancel_btn">뒤로</button>
	</td>
	</tr>
				</table>

			</form>

	</div>
		</div>
</div></div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>