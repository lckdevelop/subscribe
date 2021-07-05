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
    <!-- js -->
    <script type="text/javascript" src="${context}/resources/index/js/jquery-3.6.0.min.js" ></script>
</head>
<body>
<script type="text/javascript">
$(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".subCategory").click(function(){
        alert($(".subCategory").text());
    });
    
});
</script>
<div class="container">
	<div class="row">
	    <div class="col-lg-3 col-md-3">
	        <div class="header__logo">
	            <a href="${context}"><img src="${context}/resources/index/images/mainLogo.PNG" alt=""></a>
	        </div>
	    </div>
	    <div class="col-lg-9 col-md-9">
	        <nav class="header__menu mobile-menu">
	            <ul>
	                <li class="active"><a href="./index.html">홈</a></li>
	                <li><a href="#">여성패션</a>
	                    <ul class="dropdown">
	                        <li><a href="./about.html">아우터</a></li>
	                        <li><a href="./shop-details.html">상의</a></li>
	                        <li><a href="./shopping-cart.html">하의</a></li>
	                        <li><a href="./checkout.html">정장/원피스</a></li>
	                        <li><a href="./blog-details.html">가죽/모피</a></li>
	                        <li><a href="./blog-details.html">언더웨어/이지웨어</a></li>
	                    </ul>
	                </li>
	                <li><a href="#">남성패션</a>
	                    <ul class="dropdown">
	                        <li><a href="./about.html">정장/수트</a></li>
	                        <li><a href="./shop-details.html">아우터</a></li>
	                        <li><a href="./shopping-cart.html">상의</a></li>
	                        <li><a href="./checkout.html">하의</a></li>
	                        <li><a href="./blog-details.html">남성 언더웨어</a></li>
	                    </ul>
	                </li>
	                <li><a href="#">진/이지</a>
	                    <ul class="dropdown">
	                        <li class="subCategory"><a href="#">티셔츠/셔츠/블라우스</a></li>
	                        <li><a href="./shop-details.html">원피스/니트/가디건</a></li>
	                        <li><a href="./shopping-cart.html">팬츠/스커트</a></li>
	                        <li><a href="./checkout.html">데님팬츠</a></li>
	                        <li><a href="./blog-details.html">자켓/점퍼/코트</a></li>
	                    </ul>
	                </li>
	                <li><a href="#">스포츠/레저</a>
	                    <ul class="dropdown">
	                        <li><a href="./sports">스포츠/레저</a></li>
	                        <li><a href="./shop-details.html">Shop Details</a></li>
	                        <li><a href="./shopping-cart.html">Shopping Cart</a></li>
	                        <li><a href="./checkout.html">Check Out</a></li>
	                        <li><a href="./blog-details.html">Blog Details</a></li>
	                    </ul>
	                </li>
	                <li><a href="#">브랜드</a>
	                    <ul class="dropdown">
	                        <li><a href="./about.html">스포츠/레저</a></li>
	                        <li><a href="./shop-details.html">Shop Details</a></li>
	                        <li><a href="./shopping-cart.html">Shopping Cart</a></li>
	                        <li><a href="./checkout.html">Check Out</a></li>
	                        <li><a href="./blog-details.html">Blog Details</a></li>
	                    </ul>
	                </li>
	            </ul>
	        </nav>
	    </div>
	    <%-- <div class="col-lg-3 col-md-3">
	        <div class="header__nav__option">
	            <a href="#" class="search-switch"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a>
	            <a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a>
	            <a href="#"><img src="${context}/resources/theme/img/icon/cart.png" alt=""> <span>0</span></a>
	            <div class="price">$0.00</div>
	        </div>
	    </div> --%>
	</div>
	<div class="canvas__open"><i class="fa fa-bars"></i></div>
</div>
</body>
</html>