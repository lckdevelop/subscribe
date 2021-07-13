<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link rel="stylesheet" href="${context}/resources/custom/css/hpointcard.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/style.css" type="text/css">
	<link rel="stylesheet" href="${context}/resources/custom/css/sidebar.css" type="text/css">
	<link rel="stylesheet" href="${context}/resources/custom/css/table.css" type="text/css">
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
			   <div class="container">
				<div class="row">
				    <div class="col-lg-4">
				        <div class="card2 card-margin">
				            <div class="card-header no-border">
				            </div>
				            <div class="card-body pt-0">
				                <div class="widget-49">
				                    <div class="widget-49-title-wrapper">
				                        <div class="widget-49-date-primary">
				                            <span class="widget-49-date-day">${mycard.productcnt}</span>
				                        </div>
				                        <div class="widget-49-meeting-info">
				                            <span class="widget-49-pro-title">주문 진행 중인 상품</span>
				                            <span class="widget-49-meeting-time">(수령 대기 / 배송 중)</span>
				                        </div>
				                    </div>
				                    <div class="widget-49-meeting-action">
				                        <a href="#" class="btn btn-sm btn-flash-border-primary">바로 가기</a>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				    <div class="col-lg-4">
				        <div class="card2 card-margin">
				            <div class="card-header no-border">
				            </div>
				            <div class="card-body pt-0">
				                <div class="widget-49">
				                    <div class="widget-49-title-wrapper">
				                        <div class="widget-49-date-warning">
				                            <span class="widget-49-date-day">${mycard.couponcnt}</span>
				                        </div>
				                        <div class="widget-49-meeting-info">
				                            <span class="widget-49-pro-title">사용 가능한 쿠폰</span>
				                            <span class="widget-49-meeting-time">브랜드별 쿠폰 모아보기</span>
				                        </div>
				                    </div>
				                    <div class="widget-49-meeting-action">
				                        <a href="#" class="btn btn-sm btn-flash-border-warning">바로 가기</a>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				    <div class="col-lg-4">
			        <div class="card2 card-margin">
			            <div class="card-header no-border">
			            </div>
			            <div class="card-body pt-0">
			                <div class="widget-49">
			                    <div class="widget-49-title-wrapper">
			                        <div class="widget-49-date-success">
			                            <span class="widget-49-date-day">
			                            <fmt:formatNumber type="number" maxFractionDigits="3"
												value="${mycard.pointcnt}"/>P</span>
			                        </div>
			                        <div class="widget-49-meeting-info">
			                            <span class="widget-49-pro-title">당신에게 적립된 포인트</span>
			                            <span class="widget-49-meeting-time">포인트 혜택 사용하기</span>
			                        </div>
			                    </div>
			                    <div class="widget-49-meeting-action">
			                        <a href="#" class="btn btn-sm btn-flash-border-success">바로 가기</a>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
				</div>
				</div><br>
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="table-wrap">
									<table class="table table-responsive-xl">
									  <thead>
									    <tr>
		                                    <th></th>
		                                    <th>상품</th>
		                                    <th>가격</th>
		                                    <th>사이즈</th>
		                                    <th>갯수</th>
		                                    <th>수령 상태</th>
									    </tr>
									  </thead>
									  <tbody>
									  <c:forEach items="${cartlist}" var="dto">
										    <tr class="alert" role="alert">
										      <td><img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${dto.brandengname}/${dto.categoryproductNo}/${dto.thumbnail}.jpg" width="100"> </td>
										      <td>${dto.name}</td>
										      <td>
										      <fmt:formatNumber type="number" maxFractionDigits="3"
												value="${dto.productPrice}"/>원</td>
										      <td>${dto.productsize}</td>
										      <td>${dto.qty}개</td>
							<c:choose>
	                             <c:when test="${dto.status eq 0}">
	                             			<td class="status border-bottom-0"><span class="waiting">대기</span></td>
	                             </c:when>
	                             <c:otherwise>
										    <td class="status"><span class="active">완료</span></td>
	    					     </c:otherwise>
	    					</c:choose>  
										    </tr>
										</c:forEach>
									   </tbody>
									</table>
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