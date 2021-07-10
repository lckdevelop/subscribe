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
	<link rel="stylesheet" href="${context}/resources/custom/css/table.css" type="text/css">
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
           <!-- 브랜드 사진들 띄우기 : hover 하면 구독 가능 -->
      		<section class="ftco-section">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="table-wrap">
								<table class="table table-responsive-xl">
								  <thead>
								    <tr>
								    	<th>쿠폰명</th>
								    	<th>브랜드</th>
	                                    <th>할인 금액</th>
	                                    <th>할인율</th>
	                                    <th>할인 기간</th>
	                                    <th>사용 현황</th>
	                                    <th>사용일</th>
								    </tr>
								  </thead>
								  <tbody>
								  <c:forEach items="${couponlist}" var="dto">
								    <tr class="alert" role="alert">
								      <td>${dto.title}</td>
								      <td>${dto.brandname} ${dto.brandengname}</td>
<c:choose>
	<c:when test="${dto.type eq 0}">
								      <td></td>
								      <td>${dto.amount}%</td>
    </c:when>
    <c:otherwise>			
                                      <td>${dto.amount}원</td>
								      <td></td>	
	</c:otherwise>
</c:choose>							      			      
								      <td>~ ${dto.duetime}</td>
<c:choose>
	<c:when test="${dto.classification eq 0}">
								      <td class="status"><span class="active">사용 가능</span></td>
	</c:when>
    <c:otherwise>
    								  <td class="status border-bottom-0"><span class="waiting">사용 불가</span></td>
	</c:otherwise>
</c:choose>	    
								      <td>${dto.useddate}</td>
								    </tr>
								    </c:forEach>
								  </tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="breadcrumb-option" style="background-color: #F9F9F9">
				        <div class="container">
				            <div class="row">
				                <div class="col-lg-8">
				                    <div class="breadcrumb__text">
										<div class="cont" style="user-select: auto;">
											<ul style="user-select: auto; font-size: 12px; margin-left: 50px; color: #777">
												<li style="user-select: auto;">쿠폰마다 사용기간이 있습니다.</li>
												<li style="user-select: auto;">취소/반품 시 유효기간이 만료된 쿠폰은 재발행 되지 않습니다.</li>
												<li style="user-select: auto;">도서/음반, 서비스/상품권 등 일부 브랜드 및 일부 상품은 제외됩니다.</li>
												<li style="user-select: auto;">쿠폰은 타결제수단과 혼합결제가 가능하며 한 상품에 한개의 쿠폰만 사용하실 수 있습니다.<br style="user-select: auto;">(동일쿠폰 간, 혹은 할인쿠폰과 적립쿠폰은 동시에 사용이 불가능합니다.)</li>
												<li style="user-select: auto;">더현대닷컴에서 발행하는 쿠폰은 인터넷 주문에만 사용하실 수 있습니다.</li>
											</ul>
										</div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </section>
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