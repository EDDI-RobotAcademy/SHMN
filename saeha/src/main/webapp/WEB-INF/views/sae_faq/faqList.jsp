<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	
$(document).ready(function() {
    var formObj = $("form[name='readForm']");
    
    //수정
    $(".update_btn").on("click", function() {
       formObj.attr("action", "/sae_faq/faqUpdateView");
       formObj.attr("method", "get");
       formObj.submit();
    })
    
    //삭제
    $(".delete_btn").on("click", function() {
       var deleteYN = confirm("삭제하시겠습니까?");
       
       if (deleteYN == true) {
          formObj.attr("action", "/sae_faq/delete");
          formObj.attr("method", "get");
          formObj.submit();
       }else{
      	 return false;
       }
    })
    
}
	</script>
	<title>FAQ</title>
</head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap');
</style>
<style>
        @import url(https://fonts.googleapis.com/css?family=Raleway);
      
      body {
        color: #333;
        background: #fcfcfc;
        font-family: 'Raleway', sans-serif;
        overflow-x: hidden;
      }
      
      .faq-header{
        font-size: 42px;
        border-bottom: 1px dotted #ccc;
        padding: 24px;
      }
      
      .faq-content {
        margin: 0 auto;
      }
      
      .faq-question {
        padding: 20px 0;
        border-bottom: 1px dotted #ccc;
      }
      
      .panel-title {
        font-size: 24px;
        width: 100%;
        position: relative;
        margin: 0;
        padding: 10px 10px 0 48px;
        display: block;
        cursor: pointer;
      }
      
      .panel-content {
        font-size: 20px;
        padding: 0px 14px;
        margin: 0 40px;
        height: 0;
        overflow: hidden;
        z-index: -1;
        position: relative;
        opacity: 0;
        -webkit-transition: .4s ease;
        -moz-transition: .4s ease;
        -o-transition: .4s ease;
        transition: .4s ease;
      }
      
      .panel:checked ~ .panel-content{
        height: auto;
        opacity: 1;
        padding: 14px;
      }
      
      .plus {
        position: absolute;
        margin-left: 20px;
        margin-top: 4px;
        z-index: 5;
        font-size: 42px;
        line-height: 100%;
        -webkit-user-select: none;    
        -moz-user-select: none;
        -ms-user-select: none;
        -o-user-select: none;
        user-select: none;
        -webkit-transition: .2s ease;
        -moz-transition: .2s ease;
        -o-transition: .2s ease;
        transition: .2s ease;
      }
      
      .panel:checked ~ .plus {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
      }
      
      .panel {
        display: none;
      }
      
      </style>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width:90%">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
						<h1>
					F&Q<br>
					<em>Boards</em>
				</h1>
				 <p>
					This F&Q board is created for question and answer.
					<br>Here are answers to questions that Saehamono often hears.
				</p>
	</div>

		<form name="readForm" action="/sae_faq/faqWriteView" method="get">
		<c:forEach items="${list}" var="list">
		<!-- 컨트롤러에서 이름을 list로 정한 service.list()를 가져옴.  var은 ${list}를 list라는 이름으로 선언한 것. -->

      <div class="faq-question" style="font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif;">
        <input id="<c:out value="${list.faq_bno}" />" type="checkbox" class="panel">
        <div class="plus"><c:out value="${list.faq_bno}" /></div>
        <label for="<c:out value="${list.faq_bno}" />" class="panel-title">
        			<c:out value="${list.faq_title}" />
        			
      <div style="text-align: right;"> 
   
       <c:if test = "${member.userId == 'admin' }">
        			<a href="/sae_faq/faqUpdateView?faq_bno=${list.faq_bno}">수정</a>
        			<a href="/sae_faq/delete?faq_bno=${list.faq_bno}">삭제</a>
      	</c:if>
      	
      	</div>
      	
        </label>
        <div class="panel-content"><c:out value="${list.faq_content}" />
        <br><br>
            
    
      	
        
        </div>
        
					<!-- 그리고 out으로 뿌려줌 -->
      </div>	 
	
	</c:forEach>
	</form>
	<div style="text-align: right;">
	 <c:if test = "${member.userId == 'admin' }"> 
      			<a href="/sae_faq/faqWriteView"><button style="background-color: #45489a; color: white; border-color: #45489a;">관리자 글 등록</button></a>
   			</c:if>
	</div>			
</div>
</div>
	</div>
			</div>
		<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>