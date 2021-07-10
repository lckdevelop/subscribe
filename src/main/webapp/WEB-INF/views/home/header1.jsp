<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<!-- Css -->
    <link rel="stylesheet" href="${context}/resources/theme/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/style.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/index/css/header.css" type="text/css">
    
    <!-- js -->
    <script src="https://kit.fontawesome.com/fd670bf7a0.js"></script>
</head>
<body>

<!-- <script type="text/javascript">
function btnClick(formName) {
	logoutAskOne.submit();
};
</script> -->
<!-- Offcanvas Menu Begin -->
   <div class="offcanvas-menu-overlay"></div>
   <div class="offcanvas-menu-wrapper">
       <div class="offcanvas__option">
           <div class="offcanvas__links">
               <a href="#">Sign in</a>
               <a href="#">FAQs</a>
           </div>
           <div class="offcanvas__top__hover">
               <span>Usd <i class="arrow_carrot-down"></i></span>
               <ul>
                   <li>USD</li>
                   <li>EUR</li>
                   <li>USD</li>
               </ul>
           </div>
       </div>
       <div class="offcanvas__nav__option">
           <a href="#" class="search-switch"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a>
           <a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a>
           <a href="#"><img src="${context}/resources/theme/img/icon/cart.png" alt=""> <span>0</span></a>
           <div class="price">$0.00</div>
       </div>
       <div id="mobile-menu-wrap"></div>
       <div class="offcanvas__text">
           <p>Free shipping, 30-day return or refund guarantee.</p>
       </div>
   </div>
<!-- Offcanvas Menu End -->
<div class="header__top">
	<div class="container">
	    <div class="row">
	        <div class="col-lg-3 col-md-7">
	            <div class="header__top__left">
	                <a href="${context}">THE HYUNDAI</a>
	            </div>
	        </div>
	        <div class="col-lg-9 col-md-5">
	            <div class="header__top__right">
	                <div class="header__top__links">
                	<sec:authorize access="hasAuthority('ROLE_ADMIN')">
						<a class="disableLink" style="pointer-events: none;">
							<i class="far fa-user pr-2 mt-2" style="color:#fff;"></i><sec:authentication property="principal.brandName" />매니저님 환영합니다
						</a>
						<i class="fas fa-store pr-2 mt-2"></i><a href="${context}/admin">매장관리</a>
						<i class="fas fa-power-off pr-2 mt-2"></i><a href="logout" onclick="javascript:btnClick(logoutAskOne);">로그아웃</a>
					</sec:authorize>
					<sec:authorize access="hasAuthority('ROLE_USER')">
						<i class="far fa-user pr-2 mt-2"></i><a class="disableLink" style="pointer-events: none;color:#fff;"><sec:authentication property="principal.name" />님 환영합니다</a>
						<i class="far fa-file-alt pr-2 mt-2"></i><a href="${context}/mypage/memberInfo">마이페이지</a>
	                    <i class="fas fa-cart-arrow-down pr-2 mt-2"></i><a href="${context}/cart">장바구니</a>
	                    <i class="far fa-paper-plane pr-2 mt-2" style="color:#fff; font-size:12px;"></i><a href="${context}/brands">구독</a>
						<i class="fas fa-power-off pr-2 mt-2"></i><a href="logout" onclick="javascript:btnClick(logoutAskOne);">로그아웃</a>
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						<i class="far fa-user pr-2 mt-2"></i><a href="${context}/login">로그인|회원가입</a>
						<i class="far fa-file-alt pr-2 mt-2"></i><a href="${context}/mypage/memberInfo">마이페이지</a>
	                    <i class="fas fa-cart-arrow-down pr-2 mt-2"></i><a href="${context}/cart">장바구니</a>
	                    <i class="far fa-paper-plane pr-2 mt-2" style="color:#fff; font-size:12px;"></i><a href="${context}/brands">구독</a>
					</sec:authorize>
	                <%-- <sec:authorize access="isAuthenticated()">
						<a href="logout" onclick="javascript:btnClick(logoutAskOne);">로그아웃</a>
					</sec:authorize> --%>    
	                    <!-- <a href="#">마이페이지</a>
	                    <a href="#">장바구니</a>
	                    <a href="#">구독</a> -->
	                </div>
	                <!-- <div class="header__top__hover">
	                    <span>Usd <i class="arrow_carrot-down"></i></span>
	                    <ul>
	                        <li><a href="#">fgfgdgfgdfgdfg</a></li>
	                        <li>EUR</li>
	                        <li>USD</li>
	                    </ul>
	                </div> -->
	            </div>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>