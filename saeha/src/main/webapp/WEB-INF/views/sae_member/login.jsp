<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>로그인 페이지</title>

<style type="text/css">
body {
	justify-content: center;
	margin: 0 auto;
	width: 100%;
}

.user-wrap {
	background-image: url(/resources/img/login_bnr.jpeg);
	height: 300px;
	background-size: cover;
	background-position: 50% 50%;
}

.login_text {
	position: absolute;
	top: 35%;
	left: 50%;
	width: 100%;
	transform: translate(-50%, -50%);
	font-size: 48px;
	text-align: center;
	color: white;
}
</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 위에 2개가 카카오 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>

</head>

<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "/sae_member/logout";
		})

		$("#registerBtn").on("click", function() {
			location.href = "/sae_member/register";
		})

		$("#memberUpdateBtn").on("click", function() {
			location.href = "/sae_member/memberUpdateView";
		})

		$("#findPassBtn").on("click", function() {
			location.href = "/sae_member/findPass";
		});
	});
</script>
<!-- 카카오 로그인 스크립트 -->
<script type="text/javascript">
	function unlinkApp() {
		Kakao.API.request({
			url : '/v1/user/unlink',
			success : function(res) {
				alert('success: ' + JSON.stringify(res))
			},
			fail : function(err) {
				alert('fail: ' + JSON.stringify(err))
			},
		})
	}
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						Kakao.init('046f95da86241f89ff0763a299108c86');
						console.log(Kakao.isInitialized());

						Kakao.Auth
								.createLoginButton({
									container : '#kakao-login-btn',
									success : function(authObj) {
										Kakao.API
												.request({
													url : '/v2/user/me',
											success : function(result) {

														id = result.id
														connected_at = result.connected_at
														kakao_account = result.kakao_account

														email = "";
														birthday = "";
														age_range = "";
														profile_nickname = "";
														if (typeof kakao_account != 'undefined') {
															email = kakao_account.email;
															birthday = kakao_account.birthday;
															age_range = kakao_account.age_range;
															profile_nickname = kakao_account.profile.nickname;
														}

														location.href = "/sae_member/kakao?userId="
																+ profile_nickname
																+ "&&email="
																+ email
																+ "&&birthday="
																+ birthday;

													},
													fail : function(error) {
														alert('login success, but failed to request user information: '
																+ JSON
																		.stringify(error))
													},
												})
									},
									fail : function(err) {
										alert('failed to login: '
												+ JSON.stringify(err))
									},
								});
					});
</script>
<body>

	<%@include file='../include/nav.jsp'%>


	<div class="user-wrap">
		<div class="login_text">
			<p>로그인</p>
		</div>
	</div>

	<div style="padding: 60px 20px; height: 100%;">

		<div
			style="width: 1100px; height: 450px; background-color: #f8f8f8; padding: 60px 0; text-align: center; line-height: center;">

			<div
				style="width: 400px; height: 320px; margin: 0; display: inline-block;">
				<p>
					<span>새하마노</span><br> <span>로그인 정보를 입력해 주세요.</span>
				</p>
				<img src="<spring:url value='/resources/img/login_visual.png'/>"
					style="width: 200px;">
			</div>

			<div
				style="width: 370px; height: 320px; margin: 0; display: inline-block;">
				<form name='homeForm' method="post" action="/sae_member/login">
					<c:if test="${member == null }">
						<div>
							<label for="userId"></label> <input type="text" id="userId"
								name="userId" placeholder="  아이디"
								style="width: 100%; height: 65px; line-height: 65px; border-color: lightgrey;">
						</div>
						<div style="margin-top: 5px;">
							<label for="userPass"></label> <input type="password"
								id="userPass" name="userPass" placeholder="  비밀번호"
								style="width: 100%; height: 60px; line-height: 60px; border-color: lightgrey;">
						</div>
						<div>
							<button type="submit"
								style="width: 100%; height: 60px; line-height: 60px; margin-top: 5px; background-color: #202020; color: white;">로그인</button>
						</div>
						<div
							style="display: flex; justify-content: space-between; margin-top: 5px;">
							<button id="registerBtn" type="button"
								style="width: 190px; height: 50px;">회원가입</button>
							&nbsp;
							<button id="findPassBtn" type="button"
								style="width: 190px; height: 50px;">비밀번호 찾기</button>
						</div>

						<div>
							<!-- kakao 로그인 버튼 -->
							<a id="kakao-login-btn"><img
								src="<spring:url value='/resources/img/kakao.login.samll.png'/>"></a>
							<!-- kakao 로그인 버튼 -->
							<!-- 네이버 로그인 버튼 노출 영역 -->
							<div id="naver_id_login"></div>
							<!-- //네이버 로그인 버튼 노출 영역 -->
					</c:if>
					<c:if test="${member != null }">
						<div>
							<p>${member.userId}님환영합니다.</p>
							<c:if test="${loginlogin == null }">
								<button id="memberUpdateBtn" type="button">회원정보수정</button>
								<button id="logoutBtn" type="button">로그아웃</button>
							</c:if>

							<c:if test="${loginlogin != null }">
								<button id="logoutBtn" type="button">로그아웃</button>
							</c:if>
						</div>
						<div id="naver_id_login" style="display: none"></div>
					</c:if>

					<c:if test="${msg == false}">
						<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요</p>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("haN0bJqB_tJg0j83ohZ2",
				"http://localhost:8080/sae_member/callback");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("http://localhost:8080/");
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
	</script>
</body>
</html>
