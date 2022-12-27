<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("haN0bJqB_tJg0j83ohZ2", "http://localhost:8080/");
  // 접근 토큰 값 출력
  console.log(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    
    location.href = "/sae_member/naver?userId="
		+ naver_id_login.getProfileData('nickname')
		+ "&&email="
		+ naver_id_login.getProfileData('email')
		+ "&&birthday="
		+ naver_id_login.getProfileData('birthday');
  }
</script>
</body>
</html>