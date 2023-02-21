<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">

<meta charset="UTF-8">
<title>프로그램 등록</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click",function(){
		if (fn_valiChk()){
			return false;
		}
	formObj.attr("action","/sae_program/upload");
	formObj.attr("method","post");
	formObj.submit();			
		});
	})
	
	function fn_valiChk() {
	   var regForm = $("form[name='writeForm'] .chk").length;
	   for(var i = 0; i<regForm;i++){
		   if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			   alert($(".chk").eq(i).attr("title"));
			   return true;
		   }
	   }
	
	}
	
$(document).ready (function () {                
    $('.btnAdd').click (function () {                                        
        $('.buttons').append (                        
            '<input type="time" name="pg_time"> <input type="button" class="btnRemove" value="Remove"><br>'                    
        ); // end append                            
        $('.btnRemove').on('click', function () { 
            $(this).prev().remove (); // remove the textbox
            $(this).next ().remove (); // remove the <br>
            $(this).remove (); // remove the button
        });
    }); // end click                                            
}); // end ready 


</script>

<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
	<div class="section-heading">
				<h1>
				&nbsp;프로그램 등록
				</h1>
	</div>
	
<div id="root">
<form name="writeForm" method="post" action="sae_program/upload">
<table style="width: 65%;">
 <c:if test="${member.userId == 'admin'}"> 
  <tr>
  <td>
    <a href="/sae_program/programview?pg_bno=${programread.pg_bno}"><c:out value="${programread.pg_name}" /></a>
  </td>
  </tr>
  <tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_type">프로그램 분류</label></td><td>
  <select  id="pg_type" name="pg_type" class="chk">
    <option value="1">관람</option>
    <option value="2">체험</option>
    <option value="3">단체</option>
    <option value="4">4</option>
  </select>
  </td>
  </tr>
  <tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_name">프로그램 이름</label></td>
			<td><input type="text" id="pg_name" name="pg_name" class="chk" title="프로그램 번호를 입력하세요."/>
  </td>
  </tr>
  <tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp; 
  <label for="pg_content">프로그램 내용</label></td>
			<td><textarea id="pg_content" name="pg_content" class="chk" title="프로그램 내용을 입력하세요."></textarea>
  </td>
  </tr>
  <tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_file">프로그램 파일</label></td>
			<td><input type="file" id="pg_file" name="pg_file" class="chk" title="프로그램 파일을 입력하세요."/>
  </td>
  </tr>
  <tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_stock">수용 인원</label></td>
			<td><input type="text" id="pg_stock" name="pg_stock" class="chk" title="수용 인원을 입력하세요."/>
  </td>
  </tr>
  <tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_startdate">기간1</label></td>
			<td><input type="date" id="pg_startdate" name="pg_startdate" class="chk" title="기간을 입력하세요."/></td>
<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_enddate">기간2</label></td>
			<td><input type="date" id="pg_enddate" name="pg_enddate" class="chk" title="기간을 입력하세요."/>
  </td>
  </tr>
  <tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_bstartdate">예약 시작일</label></td>
			<td><input type="date" id="pg_bstartdate" name="pg_bstartdate" class="chk" title="기간을 입력하세요."/></td>
<tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_benddate">예약 종료일</label></td>
			<td><input type="date" id="pg_benddate" name="pg_benddate" class="chk" title="기간을 입력하세요."/>
  </td>
  </tr>
 <!-- <tr>
   <td>
    <ul id='pg_time'></ul>
  <label for="pg_time">프로그램 시간</label><input type="time" id="pg_time" name="pg_time" class="chk"/>
      <input type='button' value='추가' onclick='addList()' />
  </td> 
  </tr> -->
  <tr style="border-bottom: 1px solid #ccc; height: 70px;"><td style="width: 30%;">
			&nbsp;&nbsp;
  <label for="pg_time">프로그램 시간</label></td>
  <td>
  <div class="buttons">            
        <input type="time" name="pg_time"> <input type="button" class="btnAdd" value="Add"><br>        
  </div> 
  </td>
  </tr>
  <tr>
  <td></td>
  <td style="text-align: right;"><br>
  <button class="write_btn" type="submit" style="background-color: #45489a; color: white; border-color: #45489a;">작성</button>
  </td>
  </tr>
 </c:if> 

</table>
</form>
</div>
</div>
</div>
<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>