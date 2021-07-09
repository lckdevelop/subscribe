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
	                <script>
	                    document.write(new Date().getFullYear());
	                </script>
	                <a href="" class="disable">hyundai team4</a> <br> - All rights reserved 
	            </p>
	            <%-- <a href="#"><img src="${context}/resources/theme/img/payment.png" alt=""></a> --%>
	        </div>
	    </div>
	    <!-- <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
	        <div class="footer__widget">
	            <h6>Category</h6>
	            <ul>
	                <li><a href="#">여성패션</a></li>
	                <li><a href="#">남성패션</a></li>
	                <li><a href="#">남여공용</a></li>
	                <li><a href="#">진/캐주얼</a></li>
	                <li><a href="#">스포츠/레저</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="col-lg-2 col-md-3 col-sm-6">
	        <div class="footer__widget">
	            <h6>Brands</h6>
	            <ul>
	                <li><a href="#">Contact Us</a></li>
	                <li><a href="#">Payment Methods</a></li>
	                <li><a href="#">Delivary</a></li>
	                <li><a href="#">Return & Exchanges</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
	        <div class="footer__widget">
	            <h6>NewLetter</h6>
	            <div class="footer__newslatter">
	                <p>Be the first to know about new arrivals, look books, sales & promos!</p>
	                <form action="#">
	                    <input type="text" placeholder="Your email">
	                    <button type="submit"><span class="icon_mail_alt"></span></button>
	                </form>
	            </div>
	        </div>
	    </div> -->
	</div>
	<div class="row">
	    <div class="col-lg-12 text-center">
	        <div class="footer__copyright__text">
	            <p>
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