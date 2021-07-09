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
    <link rel="stylesheet" href="${context}/resources/index/css/header.css" type="text/css">
    
    <!-- js -->
    <script type="text/javascript" src="${context}/resources/index/js/jquery-3.6.0.min.js" ></script>
</head>
<body>
<div class="container">
	<div class="row">
	    <div class="col-lg-1 col-md-2">
	        <%-- <div class="header__logo">
	            <a href="${context}"><img src="${context}/resources/index/images/mainLogo.PNG" alt=""></a>
	        </div> --%>
	    </div>
	    <div class="col-lg-9 col-md-9 mt-1">
	        <nav class="header__menu mobile-menu">
	            <ul>
	                <li><a href="${context}">홈</a></li>
	                <li><a href="${context}/product/category?main=여성패션&sub=''&pg=1">여성패션</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main=여성패션&sub=아우터&pg=1">아우터</a></li>
	                        <li><a href="${context}/product/category?main=여성패션&sub=상의&pg=1">상의</a></li>
	                        <li><a href="${context}/product/category?main=여성패션&sub=하의&pg=1">하의</a></li>
	                        <li><a href="${context}/product/category?main=여성패션&sub=정장&pg=1">정장</a></li>
	                        <li><a href="${context}/product/category?main=여성패션&sub=신발&pg=1">신발</a></li>
	                        <li><a href="${context}/product/category?main=여성패션&sub=기타잡화&pg=1">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/product/category?main=남성패션&sub=''&pg=1">남성패션</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main=남성패션&sub=아우터&pg=1">아우터</a></li>
	                        <li><a href="${context}/product/category?main=남성패션&sub=상의&pg=1">상의</a></li>
	                        <li><a href="${context}/product/category?main=남성패션&sub=하의&pg=1">하의</a></li>
	                        <li><a href="${context}/product/category?main=남성패션&sub=정장&pg=1">정장</a></li>
	                        <li><a href="${context}/product/category?main=남성패션&sub=신발&pg=1">신발</a></li>
	                        <li><a href="${context}/product/category?main=남성패션&sub=기타잡화&pg=1">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/product/category?main=공용&sub=''&pg=1">유니섹스</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main=공용&sub=아우터">아우터</a></li>
	                        <li><a href="${context}/product/category?main=공용&sub=상의">상의</a></li>
	                        <li><a href="${context}/product/category?main=공용&sub=하의">하의</a></li>
	                        <li><a href="${context}/product/category?main=공용&sub=정장">정장</a></li>
	                        <li><a href="${context}/product/category?main=공용&sub=신발">신발</a></li>
	                        <li><a href="${context}/product/category?main=공용&sub=기타잡화">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/product/category?main=진/캐주얼&sub=''&pg=1">진/캐주얼</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main=진/캐주얼&sub=아우터&pg=1">아우터</a></li>
	                        <li><a href="${context}/product/category?main=진/캐주얼&sub=상의&pg=1">상의</a></li>
	                        <li><a href="${context}/product/category?main=진/캐주얼&sub=하의&pg=1">하의</a></li>
	                        <li><a href="${context}/product/category?main=진/캐주얼&sub=정장&pg=1">정장</a></li>
	                        <li><a href="${context}/product/category?main=진/캐주얼&sub=신발&pg=1">신발</a></li>
	                        <li><a href="${context}/product/category?main=진/캐주얼&sub=기타잡화&pg=1">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/product/category?main=스포츠/레저&sub=''&pg=1">스포츠/레저</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main=스포츠/레저&sub=아우터&pg=1">아우터</a></li>
	                        <li><a href="${context}/product/category?main=스포츠/레저&sub=상의&pg=1">상의</a></li>
	                        <li><a href="${context}/product/category?main=스포츠/레저&sub=하의&pg=1">하의</a></li>
	                        <li><a href="${context}/product/category?main=스포츠/레저&sub=정장&pg=1">정장</a></li>
	                        <li><a href="${context}/product/category?main=스포츠/레저&sub=신발&pg=1">신발</a></li>
	                        <li><a href="${context}/product/category?main=스포츠/레저&sub=기타잡화&pg=1">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/mybrands/product?pg=1">구독브랜드</a>

	                </li>
	            </ul>
	        </nav>
	    </div>
		<div class="col-lg-2 col-md-2">
			
				<!-- <div class="box mt-4">
					<div class="container-3">
					    <span class="icon"><i class="fa fa-search"></i></span>
					    <input type="search" id="search" placeholder="검색어를 입력하세요." />
					</div>
				</div> -->
			
			<form action="${context}/product/search" method="get">
				<div class="search-box">
			      <input type="text" class="search-txt" name="search" id="search" placeholder="검색어를 입력하세요.">
			      <Button class="search-btn">
			        <i class="fas fa-search"></i>
			      </Button>
			    </div>
		    </form>
		</div>
    </div>
	
	<div class="canvas__open"><i class="fa fa-bars"></i></div>
</div>
</body>
</html>