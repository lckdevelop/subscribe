<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">

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
	<link rel="stylesheet" href="${context}/resources/custom/css/sidebar.css" type="text/css">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
            <a href="#" class="search-switch"><img src="${context}/resources/img/icon/search.png" alt=""></a>
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
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>MY 현대 </h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>MY 현대</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="custom-menu">
	          <i class="fa fa-bars"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
				<div class="p-4 pt-5">
	        <ul class="list-unstyled components mb-5">
	          <li>
	           <a href="orderedlist" style="color: #8C8C8C; margin-left: 30px">주문 확인 / 배송 조회</a>
	          </li>
	          <li>
              <a href="like" style="color: #8C8C8C; margin-left: 30px">내가 찜한 상품</a>
	          </li>
	          <li>
              <a href="coupon" style="color: #8C8C8C; margin-left: 30px">쿠폰</a>
	          </li>
	          <li>
              <a href="hpoint" style="color: #8C8C8C; margin-left: 30px">H.Point</a>
	          </li>
	        </ul>
	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5" style="background-color: white">
			 <div class="container-fluid my-5 d-sm-flex justify-content-center">
			    <div class="card px-2">
			        <div class="card-header bg-white">
			            <div class="row justify-content-between">
			                <div class="col">
			                    <p class="text-muted"> Order ID <span class="font-weight-bold text-dark">1222528743</span></p>
			                    <p class="text-muted"> Place On <span class="font-weight-bold text-dark">12,March 2019</span> </p>
			                </div>
			                <div class="flex-col my-auto">
			                    <h6 class="ml-auto mr-3"> <a href="#">View Details</a> </h6>
			                </div>
			            </div>
			        </div>
			        <div class="card-body">
			            <div class="media flex-column flex-sm-row">
			                <div class="media-body ">
			                    <h5 class="bold">Blade High Heels Sandals</h5>
			                    <p class="text-muted"> Qt: 1 Pair</p>
			                    <h4 class="mt-3 mb-4 bold"> <span class="mt-5">&#x20B9;</span> 1,500 <span class="small text-muted"> via (COD) </span></h4>
			                    <p class="text-muted">Tracking Status on: <span class="Today">11:30pm, Today</span></p> <button type="button" class="btn btn-outline-primary d-flex">Reached Hub, Delhi</button>
			                </div><img class="align-self-center img-fluid" src="https://i.imgur.com/bOcHdBa.jpg" width="180 " height="180">
			            </div>
			        </div>
			        <div class="row px-3">
			            <div class="col">
			                <ul id="progressbar">
			                    <li class="step0 active " id="step1">PLACED</li>
			                    <li class="step0 active text-center" id="step2">SHIPPED</li>
			                    <li class="step0 text-muted text-right" id="step3">DELIVERED</li>
			                </ul>
			            </div>
			        </div>
			        <div class="card-footer bg-white px-sm-3 pt-sm-4 px-0">
			            <div class="row text-center ">
			                <div class="col my-auto border-line ">
			                    <h5>Track</h5>
			                </div>
			                <div class="col my-auto border-line ">
			                    <h5>Cancel</h5>
			                </div>
			                <div class="col my-auto border-line ">
			                    <h5>Pre-pay</h5>
			                </div>
			                <div class="col my-auto mx-0 px-0 "><img class="img-fluid cursor-pointer" src="https://img.icons8.com/ios/50/000000/menu-2.png" width="30" height="30"></div>
			            </div>
			        </div>
			    </div>
			</div>
      </div>
		</div>
	

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

    <!-- Js Plugins -->
    <script src="${context}/resources/theme/js/jquery-3.3.1.min.js"></script>
    <script src="${context}/resources/theme/js/bootstrap.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.nice-select.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.nicescroll.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.magnific-popup.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.countdown.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.slicknav.js"></script>
    <script src="${context}/resources/theme/js/mixitup.min.js"></script>
    <script src="${context}/resources/theme/js/owl.carousel.min.js"></script>
    <script src="${context}/resources/theme/js/main.js"></script>
    <script src="${context}/resources/theme/js/jquery.min.js"></script>
    <script src="${context}/resources/theme/js/popper.js"></script>
    <script src="${context}/resources/theme/js/sidebar.js"></script>
</body>

</html>