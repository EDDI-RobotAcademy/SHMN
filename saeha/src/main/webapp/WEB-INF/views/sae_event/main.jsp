<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>
</head>
<script>
        function popup(){
            var url = "/sae_event/recruit";
            var name = "popup test";
            var option = "width = 615, height = 470, top = 100, left = 200"
            window.open(url, name, option);
        }
    </script>
<body>
	<div style="width: 100%; height: 400px">배너(사진 넣어주세요)</div>
	<div style="display: flex">
		<div><input onclick="popup()" type="button" value="응모방법"></div>
		<div>
			<a href="/sae_event/register">응모하기</a>
		</div>
	</div>
	<div style="display: flex">
		<div style="width: 10%"></div>
		<c:forEach var="popular" items="${popular }">
			<div style="width: 21%">
				<a href="/sae_event/detail?bno=${popular.et_bno }"><img
					style="width:100%; height: 300px" src="/resources/eventimg/${popular.et_file}" /></a>
				<div>${popular.et_memberid }님</div>
				<div>
					투표수 ${popular.et_vote } <a
						href="/sae_event/upvote?bno=${popular.et_bno }&resultvote=${popular.et_vote}">투표하기</a>
				</div>
			</div>
			<div style="width:8%"></div>
		</c:forEach>
		<div style="width: 10%"></div>
	</div>
	<div style="display: flex;flex-flow:wrap">
		<c:forEach var="recently" items="${recently }">
			<div style="width: 28%;">
				<a href="/sae_event/detail?bno=${recently.et_bno }"><img
					style="width:100%; height:300px" src="/resources/eventimg/${recently.et_file}" /></a>
				<div>${recently.et_memberid }님</div>
				<div>
					투표수 ${recently.et_vote } <a
						href="/sae_event/upvote?bno=${recently.et_bno }&resultvote=${recently.et_vote}">투표하기</a>
				</div>
			</div>
			<div style="width:8%"></div>
		</c:forEach>
	</div>
</body>
</html>