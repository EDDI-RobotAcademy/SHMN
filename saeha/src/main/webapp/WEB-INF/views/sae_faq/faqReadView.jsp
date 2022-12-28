<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
<meta charset="UTF-8">
<title>게시판 readView</title>
</head>

<script type="text/javascript">

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
            formObj.attr("method", "post");
            formObj.submit();
         }else{
        	 return false;
         }
      })
      
      //목록
      $(".list_btn").on("click", function() {
         location.href = "/sae_faq/faqList";
      })
})

</script>
<body>
   <header>
   <h1>상세보기</h1>
   </header>
   <hr />
    
    <form name="readForm" method="post">
    <table>
    	<tr>
    		<td><label for = "faq_title">제목</label>
    		<td><label for = "faq_title">${read.faq_title}</label></td>
    	</tr>
    	<tr>
    		<td><label for = "faq_content">내용</label>
    		<td><label for = "faq_content">${read.faq_content}</label></td>
    	</tr>
    </table>
    	<input type="hidden" value="${read.faq_bno}" name="faq_bno"></input> 
    	<!-- form post: label로 못받음 input으로 꼭 -->
   
   
   <br><br>
   
   
   <!-- 관리자용 버튼 -->
      <c:if test = "${member.userId == 'admin' }">
      	<button type="submit" class="update_btn">(관리자)수정</button>
      	<button type="submit" class="delete_btn">(관리자)삭제</button>
   		<button type="button" class="list_btn">(관리자)목록</button>
      </c:if>
      
     
   <div><!-- 나중에 삭제!!!!!!! --> 
   <br><br>
   <button type="submit" class="update_btn">수정</button>
   <button type="submit" class="delete_btn">삭제</button>
   <button type="button" class="list_btn">목록</button>
   </div>
    </form>
   <br>
   <hr />
</body>
</html>