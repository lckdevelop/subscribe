<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- Css Styles -->
    <link rel="stylesheet" href="${context}/resources/theme/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/style.css" type="text/css">
</head>
<body>
<div class="container">
	<div class="row">
	    <div class="col-lg-3 col-md-6 col-sm-6">
	        <div class="footer__about">
	            <div class="footer__logo">
	                <a href="#"><img src="${context}/resources/index/images/mainLogo.PNG" alt=""></a>
	            </div>
	            <p>
	            	서울시 강남구 테헤란로98길 12<br>
					호스팅서비스 : team4<br>
				</p>
				<p>
					Copyright ©
	                 <script>
	                    document.write(new Date().getFullYear());
	                </script>
	                <a href="" class="disable">hyundai team4</a> <br> All rights reserved
	            </p>
	        </div>
	    </div>
	    <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
	        <div class="footer__widget">
	            <h6>Category</h6>
	            <ul>
	                <li><a href="${context}/product/category?main=여성패션&sub=&page=1">여성패션</a></li>
	                <li><a href="${context}/product/category?main=남성패션&sub=&page=1">남성패션</a></li>
	                <li><a href="${context}/product/category?main=유니섹스&sub=&page=1">남여공용</a></li>
	                <li><a href="${context}/product/category?main=진/캐주얼&sub=&page=1">진/캐주얼</a></li>
	                <li><a href="${context}/product/category?main=스포츠/레저&sub=&page=1">스포츠/레저</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="col-lg-2 col-md-3 col-sm-6">
	        <div class="footer__widget">
	            <h6>Brands</h6>
	            <ul>
	            	<li><a href="#">앤아더스토리즈</a></li>
	                <li><a href="#">지컷</a></li>
	                <li><a href="#">이로</a></li>
	                <li><a href="#">시슬리</a></li>
	                <li><a href="#">보브</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
	        <div class="footer__widget">
	            <h6>NewLetter</h6>
	            <div class="footer__newslatter">
	                <p>새로운 세일 & 프로모션, 브로슈어 제공을<br> 제일 먼저 받아보세요!</p>
	                <form action="#">
	                    <input type="text" placeholder="이메일">
	                    <button type="submit"><span class="icon_mail_alt"></span></button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="row">
	    <div class="col-lg-12 text-center">
	        <div class="footer__copyright__text">
	            <p>
	            	Copyright ©
	                <script>
	                    document.write(new Date().getFullYear());
	                </script>
	                <a href="" class="disable">hyundai team4</a> - All rights reserved 
	            </p>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>