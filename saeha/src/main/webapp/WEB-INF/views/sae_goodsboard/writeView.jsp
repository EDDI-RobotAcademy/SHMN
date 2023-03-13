<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판 writeView</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
	formObj.attr("action", "/sae_goodsboard/write");
	formObj.attr("method", "post");
	formObj.submit();
	});
})
function fn_valiChk(){
	var regForm = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return false;
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
					리뷰<br>
					<em>작성하기</em>
				</h1>
				<p>
					Praesent pellentesque efficitur magna, <br>sed pellentesque
					neque malesuada vitae.
				</p>
			</div>
<div style="padding-top: 50px;
    width: fit-content;
    border-top: 3px solid #333;">

<c:if test="${member.userId != null}">

<form name="writeForm" enctype="multipart/form-data" method="post" action="/sae_goodsboard/write">

<div style="display: flex; font-size: 20px; height: 100px;" >
        <div style="width: 600px; ">
          작성자<br>
          <input type="text" id="writer" name="gwWriter" style=" border-radius: 10px;
          border-color: #ABABAB;" class="chk" title="작성자를 입력하세요" value="${member.userId}" />
        </div>
        <div style="width: 400px; "> 상품번호<br>
          <input type="text" style=" border-radius: 10px;
          border-color: #ABABAB;" id="pno" name="gwPno" class="chk" value="${pno}" />
    </div>
</div>
    <div style="display: flex; font-size: 20px; height: 100px; ">
      <div style="width: 600px;"> 이미지<br><input multiple="multiple" type="file" id="file" name="file" />
	</div>
      <div style="width: 400px; ">별점 <br>
      <select style="border-radius: 10px;
    border-color: #ABABAB;
    width: 250px;
    text-align: center;" id="score" name="gwScore" >
					<% for (int i = 5; i> 0; i--)
					{
					%>
					<option value="<%=i %>"><%=i %>점</option>
					<%
					}
					%></select>
</div>
  </div>
  <div style="font-size: 20px; height: 100px;"> 제목<br>
    <input style=" border-radius: 10px;width:1000px;
    border-color: #ABABAB;" type="text" id="title" name="gwTitle" class="chk" title="제목을 입력하세요" />
    </div>
  <div style="font-size: 20px;">
  <div >내용</div>
    <textarea id="content" style=" border-radius: 10px; width:1000px;height:200px;
    border-color: #ABABAB;" name="gwContent" class="chk" title="내용을 입력하세요"></textarea>
    </div>


<br>
<div style="text-align: center;">
	<button class="write_btn" type="submit" style="background-color: #45489a;font-size:17px; width:100px;height:45px;border-radius:5px; color: white; border-color: #45489a;">작성하기</button>
</div>
</form>
</c:if>
<c:if test="${member.userId == null}">
<p>로그인 후에 작성하실 수 있습니다.</p>
</c:if>

</div>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>