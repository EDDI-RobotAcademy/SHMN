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
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Golos+Text&family=Hahmlet:wght@300&display=swap')
	;
</style>
<script>
	function popup() {
		var url = "/sae_event/recruit";
		var name = "popup test";
		var option = "width = 615, height = 470, top = 100, left = 200"
		window.open(url, name, option);
	}
</script>
<body>
	<%@include file="../include/nav.jsp"%>
	<!-- 	<div style="width: 70%; height: 400px">
		<img src="/resources/img/bnr2.jpg">
	</div> -->
	<div class="page-content" style="margin-top: 60px">
		<div style="width: 90%">
			<div class="section-heading" style="margin-bottom: 0px">
				<h1>
					SAE-HA<br> <em>Event</em>
				</h1>
				<p>
					Apply for a photo exhibition in Saehamano. 
					<br>Please show off your Saehamano.
				</p>
				<hr style="border: 3px solid #b4c3ff">
				<br>
			</div>
			<!-- <div style="padding: 10px 0; height: 100%;"> -->
			<div style="display: flex; height: 70px">
				<div style="width: 2%"></div>
				<div
					style="width: 45%; height: 70%; background-color: #cccccc; border-radius: 10px; font-family: 'Golos Text', sans-serif;">
					<input
						style="width: 100%; height: 100%; background-color: #cccccc; border: 0px; font-size: 23px; border-radius: 10px; font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif;"
						onclick="popup()" type="button" value="응모방법">
				</div>
				<div style="width: 2%"></div>
				<a href="/sae_event/register"
					style="width: 45%; height: 70%; font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif; border: 0px; font-size: 23px; line-height: 50px; text-align: center; background-color: #333399; color: #ffffff; border-radius: 10px;">
					<b>응모하기</b> </a>
				<div style="width: 4%"></div>
			</div>
			<br>
			<div style="display: flex;">
				<c:forEach var="popular" items="${popular }" varStatus="status">
					<div style="width: 30%">
						<div
							style="width: 100%; height: 270px; font-size: 16px; font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif;">
							<img src="/resources/img/11111.png"
								style="width: 100px; position: absolute;" /> <a
								href="/sae_event/detail?bno=${popular.et_bno }"> <img
								style="width: 100%; border: 4px solid #b4c3ff"
								src="/resources/eventimg/${popular.et_file}" /></a>
							<div style="display: flex; justify-content: space-between;">
								<div>${popular.et_title }</div>
								<div style="font-size: 16px">
									투표수 ${popular.et_vote } <a
										href="/sae_event/upvote?bno=${popular.et_bno }&resultvote=${popular.et_vote}">투표하기</a>
								</div>
							</div>
						</div>

					</div>
					<div style="width: 3%"></div>
				</c:forEach>
			</div>
			<div style="display: flex; flex-flow: wrap">
				<c:forEach var="recently" items="${recently }">
					<div
						style="width: 30%; font-size: 16px; font-family: 'Golos Text', sans-serif; font-family: 'Hahmlet', serif;">
						<div style="width: 100%; height: 270px">
							<a href="/sae_event/detail?bno=${recently.et_bno }"> <img
								style="width: 100%;"
								src="/resources/eventimg/${recently.et_file}" />
							</a>
							<div style="display: flex; justify-content: space-between;">
								<div>${recently.et_title }</div>
								<div style="font-size: 16px">
									투표수 ${recently.et_vote } <a
										href="/sae_event/upvote?bno=${recently.et_bno }&resultvote=${recently.et_vote}">투표하기</a>
								</div>
							</div>
						</div>

					</div>
					<div style="width: 3%"></div>
				</c:forEach>
			</div>
			<!-- </div> -->
		</div>
	</div>
	<footer class="footer">
		<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
	</footer>

</body>
</html>