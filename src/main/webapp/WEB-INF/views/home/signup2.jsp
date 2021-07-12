<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${context}/resources/index/css/singup.css">
<script type="text/javascript" src="${context}/resources/index/js/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="${context}/resources/theme/js/bootstrap.min.js" ></script>
<title>현대백화점 | 회원가입</title>
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
	<script type="text/javascript">
	$(function(){
		$('#btnIdDupl').click(function(){
			var loginid = $("#id").val();
			
			if (loginid == '') {
				$('#idCheckMessage').text("아이디를 입력하세요");
				$('#idCheckMessage').attr('color', '#e64343');
				return;
			}
			$.ajax({
				type:'post',
				url: "idcheck",
				dataType: "text",
				data: {id: loginid},
				success: function (data, textStatus) {
					if (data == 'usable') {
						$('.form-group1').addClass("has-success");
						$('.idCon').attr('style', "display:visible;");
						/* $('#inputSuccess2Status').removeClass("sr-only"); */
						$('#idCheckMessage').html("사용할 수 있는 아이디입니다.");
						$('#idCheckMessage').attr('color', '#365df7');
					} else {
						$('#idCheckMessage').html("사용할 수 없는 아이디입니다.");
						$('#idCheckMessage').attr('color', '#e64343');
					}
				}
			})
		});
		
	    $('#password').keyup(function(){
	      $('#ckNotice').html('');
	    });

	    $('#pwck').keyup(function(){
	        if($('#password').val() != $('#pwck').val()){
	          $('#ckNotice').html('비밀번호 일치하지 않음<br><br>');
	          $('#ckNotice').attr('color', '#f82a2aa3');
	        } else{
	          $('#ckNotice').html('비밀번호 일치함<br><br>');
	          $('#ckNotice').attr('color', '#199894b3');
	        }

	    });

	});
	</script>
<script>
$(function(){
	$('#btnIdDupl').click(function(){
		$('.idCon').attr('style', "display:visible;");
		/* $('#inputSuccess2Status').removeClass("sr-only"); */
		$('.form-group1').addClass("has-success");
	});
});
</script>
	<jsp:include page="/WEB-INF/views/home/header1.jsp" flush="false" />
<div class="container">
<div class="container">
	<h2>선택적 아이콘 사용(With optional icons)</h2>
	

	<div class="form-group has-success has-feedback" style="width:300px;">
	  <label class="control-label" for="inputSuccess2">Input with success</label>
	  <input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
	  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
	  <span id="inputSuccess2Status" class="sr-only">(success)</span>
	</div>
	<div class="form-group has-warning has-feedback">
	  <label class="control-label" for="inputWarning2">Input with warning</label>
	  <input type="text" class="form-control" id="inputWarning2" aria-describedby="inputWarning2Status">
	  <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
	  <span id="inputWarning2Status" class="sr-only">(warning)</span>
	</div>
	<div class="form-group has-error has-feedback">
	  <label class="control-label" for="inputError2">Input with error</label>
	  <input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status">
	  <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
	  <span id="inputError2Status" class="sr-only">(error)</span>
	</div>
</div>



<!-- 아이디 -->
			    	<div class="form-group1 has-feedback">
						<label class="control-label" for="inputSuccess2">아이디</label>
					  	<!-- <div class="row"> -->
							<input type="text" class="form-control" id="id" name="id" placeholder='아이디' required="required" aria-describedby="inputSuccess2Status">
						  	<span class="idCon glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="display:none"></span>
						  	<input id="btnIdDupl" class="favorite styled" type="button" value="중복확인">
						<!-- </div> -->
					  	<font id="idCheckMessage" size="2"></font>
					</div>
</div>
</body>
</html>