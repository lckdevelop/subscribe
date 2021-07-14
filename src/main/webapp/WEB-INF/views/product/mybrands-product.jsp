<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${context}/resources/theme/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/style.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/brands/css/brands.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/brands/css/pagination.css" type="text/css">
    
     <!-- Js Plugins -->
    <script src="${context}/resources/theme/js/jquery-3.3.1.min.js"></script>
    
    <script>
    	$(document).ready(function(){
	  	 	document.getElementById('subs').className += 'active';
		});
    	
    	window.userNo = ${userNo};
    	window.brandNo = 0;
    	window.pg = 1;
    	window.context = '${context}';
    	window.subspg = 1;
    </script>


</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

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

    <!-- Header Section Begin -->
    <header class="header">
    	<jsp:include page="/WEB-INF/views/home/header1.jsp" flush="false" />
    	<jsp:include page="/WEB-INF/views/home/header2.jsp" flush="false" />
    </header>
    <!-- Header Section End -->
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-blog set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-background/jillstuartnewyork.jpg">
    </section>
    <!-- Breadcrumb Section End -->
    
    
    <div class="container mt-5">
	    <div class="row">
	        <div class="col-lg-12">
	            <ul class="filter__controls">
	                <li class="active" onclick="location.href='./product'">구독 브랜드 제품</li>
	                <li onclick="location.href='./window'">브랜드 윈도우</li>
	            </ul>
	        </div>
	    </div>
    </div>
    
	<div class="row">
		<div class="col-lg-12">
			<div class="pagination2 center">
				<ul class="mysubs">
					<li class="active"><a>전체</a></li>
					<li class="page-block"><a>질스튜어트 뉴욕</a></li>
				</ul>
			</div>
		</div>
	</div>
    
    
    <!-- Shop Section Begin -->
    <section class="shop spad" style="padding-top: 15px">
        <div class="container">
            <div class="row">
				<div class="col-lg-12">
					<div class="shop__product__option">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__left">
									<p>총 0 개의 상품</p>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__right">
									<select>
										<option value="new">신상품순</option>
										<option value="high-price">높은 가격순</option>
										<option value="low-price">낮은 가격순</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div id="product-list-section" class="row" >
					
					</div>
					
					<div class="row">
						<div class="col-lg-12">
							<div class="pagination center">
								<ul class="page-num">
									<li class="active"><a>1</a></li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>
			</div>
        </div>
    </section>
    <!-- Shop Section End -->


    <!-- Footer Section Begin -->
    <footer class="footer">
        <jsp:include page="/WEB-INF/views/home/footer.jsp" flush="false" />
    </footer>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

    <script src="${context}/resources/theme/js/bootstrap.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.nice-select.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.nicescroll.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.magnific-popup.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.countdown.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.slicknav.js"></script>
    <script src="${context}/resources/theme/js/mixitup.min.js"></script>
    <script src="${context}/resources/theme/js/owl.carousel.min.js"></script>
    <script src="${context}/resources/theme/js/main.js"></script>
    
    <script src="${context}/resources/product/mybrands-product.js"></script>
   
</body>

</html>