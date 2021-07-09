<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${context}/resources/theme/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${context}/resources/index/css/index.css">
<script type="text/javascript" src="${context}/resources/index/js/jquery-3.6.0.min.js" ></script>
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
						$('#idCheckMessage').text("사용할 수 있는 아이디입니다.");
						$('#idCheckMessage').attr('color', '#365df7');
					} else {
						$('#idCheckMessage').text("사용할 수 없는 아이디입니다.");
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
	<header class="header">
    	<jsp:include page="/WEB-INF/views/home/header1.jsp" flush="false" />
        <%-- <jsp:include page="/WEB-INF/views/home/header2.jsp" flush="false" /> --%>
    </header>
    
    <div class="container">
     	<div class="wrap">
    		<div class="inner_wrap">
			   	<div class="col-md-12 mt-5">
			    	<h3>회원가입</h3>
			    </div>
			    <div class="row">
			    	<h5 class="text_left mt-5 mb-4"><strong>1단계 간편인증</strong></h5>
			    </div>
			    <div class="row mt-5">
			    	<font id="kakaoConfirm" size="2"></font>
			    </div>
			    <div class="row">
			    	<a href="javascript:kakaoLogin();"><img src="${context}/resources/index/images/kakaoLogo.png" class="kakaoLogo"/></a>
			    </div>
			    <div class="mb-5"></div>
		    </div>
	    </div>
	    <hr>
		<form method="post" action="./signaction">
	    <div class="wrap">
    		<div class="inner_wrap">   
			<div class="row">
	    		<h5 class="text_left mt-5 mb-4"><strong>2단계 가입정보 입력</strong></h5>
	    	</div>
			    	<div class="row mt-5">
			    		<div class="mb-1">
			    			<p class="text_left">아이디</p>
			    			<input type="text" id="id" name="id" class="input_box_size" placeholder='아이디' required="required"/>
			    			<input id="btnIdDupl" class="favorite styled" type="button" value="중복확인">
		    			</div>
			    	</div>
			    	<div class="row">
			    		<div class="mb-4">
			    			<font id="idCheckMessage" size="2"></font>
			    		</div>
			    	</div>
			    	<div class="row">
			    		<div class="mb-1">
			    			<p class="text_left">비밀번호</p>
			    			<input type="password" name="password" id="password" class="input_box_size" placeholder='비밀번호'/>
			    		</div>
			    	</div>
			    	<div class="row">
			    		<div class="mb-1">
			    			<input type="password" name="pwck" id="pwck" class="input_box_size" placeholder='비밀번호 확인'/>
			    		</div>
			    	</div>
			    	<div class="row">
			    		<div class="mb-4">
			    			<font id="ckNotice" size="2"></font>
			    		</div>
			    	</div>
			    	<div class="row">
			    		<div class="mb-4">
			    			<p class="text_left">이름</p>
			    			<input type="text" name="name" id="name" class="input_box_size" placeholder='이름'/>
			    		</div>
			    	</div>
			    	<div class="row">
			    		<div class="mb-4">
			    			<p class="text_left">이메일</p>
			    			<input type="text" name="email" id="email" class="input_box_size" placeholder='이메일'/>
			    		</div>
			    	</div>
			    	<div class="row">
			    		<div class="mb-4">
			    			<p class="text_left">생년월일</p>
			    			<input type="text" name="birthdate" id="birthdate" onkeyup="dateFormat(this)" placeholder='생년월일(예:19960803)' class="input_box_size"/>
			    		</div>
			    	</div>
 			    	<div class="row">
			    		<div class="mb-5">
			    			<p class="text_left">휴대폰번호</p>
			    			<input type="text" name="phone" id="phone" placeholder='휴대폰번호(예:010-1111-1111)' class="input_box_size"/>
 			    		</div>
			    	</div>
			    	<div class="row">
			    		<div class="mt-4 mb-5 text-center">
			    			<input type="submit" value="회원가입" />
			    		</div>
			    	</div>
				</div>
			</div>
			
		</form>
    </div>
    
    
    
    
    
    
    <footer class="footer">
        <jsp:include page="/WEB-INF/views/home/footer.jsp" flush="false" />
    </footer>
    
</body>
</html>