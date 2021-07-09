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
    $("ul li a").click(function(){
    	var t = $(this).html();
    	alert($(this).parent(li).text());
        alert(t);
    });
    
});

function test(ths){
    var hello = $(ths).text();
    alert(ths);
}
</script>
<div class="container">
	<div class="row">
	    <div class="col-lg-2 col-md-2">
	        <div class="header__logo">
	            <a href="${context}"><img src="${context}/resources/index/images/mainLogo.PNG" alt=""></a>
	        </div>
	    </div>
	    <div class="col-lg-9 col-md-9">
	        <nav class="header__menu mobile-menu">
	            <ul>
	                <li><a href="${context}">홈</a></li>
	                <li class="mainCategory"><a href="${context}/product/category?main=여성패션&sub=&page=1">여성패션</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main=여성패션&sub=아우터&page=1">아우터</a></li>
	                        <li><a href="${context}/product/category?main='여성패션'&sub='상의'">상의</a></li>
	                        <li><a href="${context}/product/category?main='여성패션'&sub='하의'">하의</a></li>
	                        <li><a href="${context}/product/category?main='여성패션'&sub='정장'">정장</a></li>
	                        <li><a href="${context}/product/category?main='여성패션'&sub='신발'">신발</a></li>
	                        <li><a href="${context}/product/category?main='여성패션'&sub='기타잡화'">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/product/category?main='남성패션'&sub=''">남성패션</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main='남성패션'&sub='아우터'">아우터</a></li>
	                        <li><a href="${context}/product/category?main='남성패션'&sub='상의'">상의</a></li>
	                        <li><a href="${context}/product/category?main='남성패션'&sub='하의'">하의</a></li>
	                        <li><a href="${context}/product/category?main='남성패션'&sub='정장'">정장</a></li>
	                        <li><a href="${context}/product/category?main='남성패션'&sub='신발'">신발</a></li>
	                        <li><a href="${context}/product/category?main='남성패션'&sub='기타잡화'">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/product/category?main='진/캐주얼'&sub=''">진/캐주얼</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main='진/캐주얼'&sub='아우터'">아우터</a></li>
	                        <li><a href="${context}/product/category?main='진/캐주얼'&sub='상의'">상의</a></li>
	                        <li><a href="${context}/product/category?main='진/캐주얼'&sub='하의'">하의</a></li>
	                        <li><a href="${context}/product/category?main='진/캐주얼'&sub='정장'">정장</a></li>
	                        <li><a href="${context}/product/category?main='진/캐주얼'&sub='신발'">신발</a></li>
	                        <li><a href="${context}/product/category?main='진/캐주얼'&sub='기타잡화'">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/product/category?main='스포츠/레저'&sub=''">스포츠/레저</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main='스포츠/레저'&sub='아우터'">아우터</a></li>
	                        <li><a href="${context}/product/category?main='스포츠/레저'&sub='상의'">상의</a></li>
	                        <li><a href="${context}/product/category?main='스포츠/레저'&sub='하의'">하의</a></li>
	                        <li><a href="${context}/product/category?main='스포츠/레저'&sub='정장'">정장</a></li>
	                        <li><a href="${context}/product/category?main='스포츠/레저'&sub='신발'">신발</a></li>
	                        <li><a href="${context}/product/category?main='스포츠/레저'&sub='기타잡화'">기타잡화</a></li>
	                    </ul>
	                </li>
	                <li><a href="${context}/product/category?main='브랜드'&sub=''">브랜드</a>
	                    <ul class="dropdown">
	                        <li><a href="${context}/product/category?main='브랜드'&sub='아우터'">아우터</a></li>
	                        <li><a href="${context}/product/category?main='브랜드'&sub='상의'">상의</a></li>
	                        <li><a href="${context}/product/category?main='브랜드'&sub='하의'">하의</a></li>
	                        <li><a href="${context}/product/category?main='브랜드'&sub='정장'">정장</a></li>
	                        <li><a href="${context}/product/category?main='브랜드'&sub='신발'">신발</a></li>
	                        <li><a href="${context}/product/category?main='브랜드'&sub='기타잡화'">기타잡화</a></li>
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