<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">

<meta charset="UTF-8">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>update View</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click",function(){
		event.preventDefault(); // 창이 새로고침되거나, 다른 링크로 이동하는 것을 막아줌
		location.href="/sae_goodsboard/readView?gwBno=${update.gwBno}" +
					"&page=${scri.page}" + "&perPageNum=${scri.perPageNum}" +
					"&score=${scri.score}" + "&keyword=${scri.keyword}" ;
	});
	
	$(".update_btn").on("click",function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action","/sae_goodsboard/update");
		formObj.attr("method","post");
		formObj.submit();
	});
});

function fn_valiChk() {
	   var updateForm = $("form[name='updateForm'] .chk").length;
	   for(var i = 0; i<updateForm;i++){
		   if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
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
					리뷰<br>
					<em>수정하기</em>
				</h1>
				<p>
					Praesent pellentesque efficitur magna, <br>sed pellentesque
					neque malesuada vitae.
				</p>
			</div>
<div style="padding-top: 50px;
    width: fit-content;
    border-top: 3px solid #333;">


<form name="updateForm" role="form" method="post" action="/sae_goodsboard/update">
<input type="hidden" name="gwBno" value="${update.gwBno}" readonly="readonly">
<input type="hidden" name="gwPno" value="${update.gwPno}" readonly="readonly">
<input type="hidden" id="page" name="page" value="${scri.page }">
<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }">
<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }">


<div style="display: flex; font-size: 20px; height: 100px;" >
        <div style="width: 600px; ">
          작성자<br>
          <input type="text" style=" border-radius: 10px;
          border-color: #ABABAB;" id="writer" name="gwWriter" class="chk" 
		  						value="${member.userId }" readonly="readonly"/>	
        </div>
        <div style="width: 400px; "> 상품번호<br>
          <input type="text" style=" border-radius: 10px;
          border-color: #ABABAB;" id="pno" name="gwPno" class="chk" value="${pno}" />
    </div>
</div>
    <div style="display: flex; font-size: 20px; height: 100px; ">
      <div style="width: 600px;"> 이미지<br>
      <input type="file" id="file" name="gwFile" 
		  						value="${update.gwFile }"/>	
	</div>
      <div style="width: 400px; ">별점 <br>
					 <select style="border-radius: 10px;
    border-color: #ABABAB;  width: 250px;   text-align: center;"
					id="score" name="gwScore" class="form-control">
					<% for (int i = 5; i> 0; i--)
					{
					%>
					<option value="<%=i %>"><%=i %>점</option>
					<%
					}
					%>
				</select>
</div>
  </div>
  <div style="font-size: 20px; height: 100px;"> 제목<br>
  		  <input style=" border-radius: 10px;width:1000px;
    border-color: #ABABAB;" type="text" id="title" name="gwTitle" class="chk" 
		  						value="${update.gwTitle }" title="제목을 입력하세요." />
    </div>
  <div style="font-size: 20px;">
  <div >내용</div>
    <textarea id="content" style=" border-radius: 10px; width:1000px;height:200px;
    border-color: #ABABAB;" name="gwContent" class="chk" title="내용을 입력하세요."><c:out value="${update.gwContent }" /></textarea>
    </div>

<br>
<div style="text-align: center;">
		<button type="submit" class="update_btn" style="background-color: #45489a;font-size:17px; width:100px;height:45px;border-radius:5px; color: white; border-color: #45489a;">저장</button>
		<button type="button" class="cancel_btn" style="background-color: #45489a;font-size:17px; width:100px;height:45px;border-radius:5px; color: white; border-color: #45489a;">취소</button>
</div>

</form>



</div>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>