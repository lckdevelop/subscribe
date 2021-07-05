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
	    <div class="col-lg-3 col-md-3">
	        <div class="header__logo">
	            <a href="${context}"><img src="${context}/resources/index/images/mainLogo.PNG" alt=""></a>
	        </div>
	    </div>
	    <div class="col-lg-6 col-md-6">
	        <nav class="header__menu mobile-menu">
	            <ul>
	                <li class="active"><a href="./index.html">Home</a></li>
	                <li><a href="./shop.html">Shop</a></li>
	                <li><a href="#">Pages</a>
	                    <ul class="dropdown">
	                        <li><a href="./about.html">About Us</a></li>
	                        <li><a href="./shop-details.html">Shop Details</a></li>
	                        <li><a href="./shopping-cart.html">Shopping Cart</a></li>
	                        <li><a href="./checkout.html">Check Out</a></li>
	                        <li><a href="./blog-details.html">Blog Details</a></li>
	                    </ul>
	                </li>
	                <li><a href="./blog.html">Blog</a></li>
	                <li><a href="./contact.html">Contacts</a></li>
	            </ul>
	        </nav>
	    </div>
	    <div class="col-lg-3 col-md-3">
	        <div class="header__nav__option">
	            <a href="#" class="search-switch"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a>
	            <a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a>
	            <a href="#"><img src="${context}/resources/theme/img/icon/cart.png" alt=""> <span>0</span></a>
	            <div class="price">$0.00</div>
	        </div>
	    </div>
	</div>
	<div class="canvas__open"><i class="fa fa-bars"></i></div>
</div>
</body>
</html>