<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/css/util.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/login/css/main.css">
<title>현대백화점 | 로그인</title>
</head>
<body>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	window.Kakao.init("c719163c8a3ae97ac6453318e9396038");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile_nickname, account_email, gender, birthday',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
						$("#name").val(res.kakao_account.profile.nickname);
						$("#email").val(res.kakao_account.email);
						$("#kakaoConfirm").text("kakao계정으로 인증 하셨습니다.");
					}
				});
			}
		});
	}
	</script>
	
	<header class="header">
    	<jsp:include page="/WEB-INF/views/home/header1.jsp" flush="false" />
 	</header>
	<div class="limiter">
		<div class="container-login100">
<%-- 		<div class="container-login100" style="background-image: url('${context}/resources/login/images/bg-01.jpg');"> --%>
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form action="loginAction" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						<a href="${context}"><img src="${context}/resources/index/images/mainLogo.PNG" alt=""></a>
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="id" placeholder="아이디를 입력하세요.">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" placeholder="비밀번호를 입력하세요.">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<c:if test="${param.fail == 'true'}">
						<p class="mt-3" style="text-align:center;color:'red';"><strong>아이디와 암호가 일치하지 않습니다.</strong></p>
					</c:if>
					<div class="text-right p-t-15 p-b-31">
						<a href="#">
							Forgot password?
						</a>
					</div>
					<!-- csrf 토큰 설정 -->
					<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%> 
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								로그인
							</button>
						</div>
					</div>
					
					<div class="flex-c-m p-t-20">
						<!-- <a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a> -->

						

						<!-- <a href="javascript:kakaoLogin();" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a> -->
					</div>
					
					<div class="text-center p-t-40 p-b-20">
						<a href="signup" class="txt2">
							<strong>회원가입</strong>
						</a>
					</div>
					
					<div class="flex-col-c p-t-100">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<footer class="footer">
        <jsp:include page="/WEB-INF/views/home/footer.jsp" flush="false" />
    </footer>
	<script src="${context}/resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${context}/resources/login/vendor/animsition/js/animsition.min.js"></script>
	<script src="${context}/resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="${context}/resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${context}/resources/login/vendor/select2/select2.min.js"></script>
	<script src="${context}/resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="${context}/resources/login/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="${context}/resources/login/vendor/countdowntime/countdowntime.js"></script>
	<script src="${context}/resources/login/js/main.js"></script>
</body>
</html>