<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
    <link href="/resources/css/templatemo-xtra-blog.css" rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>굿즈 등록</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		
		$("#pd_stock").change(function() {
			if(stockChk()){

				return false;
			}
		});
		
		$("#write_btn").on("click", function() {
			if(fn_valiChk()){
			return false;
			}
			
		formObj.attr("action", "/sae_product/productwrite");
		formObj.attr("method","post");
		formObj.submit();
		});
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for(var i = 0; i<regForm; i++){
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	
	function stockChk() {
		var number = $('#pd_stock').val();
		if (number <= 0){
			alert("재고수량은 1이상 입력하셔야 합니다");
			$('#pd_stock').val('1');
			return ture;
		}		
	}
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Golos+Text&family=Hahmlet:wght@300&display=swap');
</style>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width:90%">
<div style="padding:60px 0; height: 100%; margin-left: 250px;">
	<div class="section-heading" style="margin-left: 180px;">
				<h1 style="font-family: 'Hahmlet', serif;">
				&nbsp;상품 등록
				</h1>
	</div>

	<div id="root">
	<form action="/sae_product/productwrite" enctype="multipart/form-data" name = "writeForm" method="post">
<table style="width: 65%;">
		<c:if test="${member.userId == 'admin' }">
		<input type="hidden" id="pd_readcount" name="pd_readcount" value="0" />
		<input type="hidden" id="pd_buycount" name="pd_buycount" value="0" />
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			<label for= "pd_type">상품 종류</label>	</td><td>
			<input type="radio" name="pd_type" value="g" checked="checked">굿즈
			<input type="radio" name="pd_type" value="h">한복
			</td>
		</tr>
	<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			<label for= "pd_name">상품 이름</label>
			</td><td>
			<input type="text" id="pd_name" name="pd_name" class="chk" title="굿즈 이름을 입력하세요" />
			</td>

		</tr>
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			<label for = "pd_content">상세 설명</label>
			</td><td>
			<textarea style="height: 300px;width: 90%;resize: none;" id="pd_content" name = "pd_content" class="chk" title="상세셜명을 입력하세요." ></textarea>
			</td>
		</tr>
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			<label for = "pd_stock">재고수량</label>
			</td><td>
			<input style="width:60px;" type="number" id="pd_stock" name = "pd_stock" class="chk" title="재고수량을 입력하세요." value="1" />
			</td>
		</tr>
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			<label for= "pd_price">가격</label>
			</td><td>
			<input style="width:100px;" type="number" id="pd_price" name="pd_price" class="chk" title="가격을 입력하세요." />
			</td>
		</tr>
		<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			<label for= "uploadFile">사진</label>
			</td><td>
			<input multiple="multiple" type="file" id="file" name="file" class="chk" title="상품 사진을 입력하세요" />
			</td>
		</tr>
			


		</c:if>
		<c:if test="${member.userId != 'admin' }"> <!-- userid가 관리자가 아니라면 출력 -->
			<p>관리자만 작성 가능합니다</p>
		</c:if>
	</tbody>
	</table>
	</form>
	</div>
	<div style="float: left; margin-left: 250px;">
	<button id="write_btn" type="submit">등록</button>
	<button type="button" onclick="location.href='/sae_product/productmain'">뒤로</button>
	</div>
	</div>
	
</div></div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>