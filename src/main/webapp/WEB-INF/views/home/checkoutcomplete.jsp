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
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function(){
		admitresult();
	});
    
    function admitresult() {
		$('.admitbtn').click(function(){
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/updatestatusFin', 
			});
			location.href="/subscribe/mypage/orderedlist";
		});
	}
    
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
	 <div class="row d-flex justify-content-center" style="margin-top: 40px; margin-bottom: 40px">
        <div class="col-md-8">
            <div class="card">
                <div class="text-left logo p-2 px-5"> <img src="${context}/resources/index/images/mainLogo.PNG" width="150" style="margin-top: 40px"> </div>
                <div class="invoice p-5">
                    <h5>주문이 완료되었습니다!</h5><br><span>주문 접수 후 최대 3일 이내에 배송이 시작됩니다.</span>
                    <div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">주문 날짜</span> <span>${orderedDTO.orderDate}</span> </div>
                                    </td>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">주문 번호</span> <span>${orderedDTO.no}</span> </div>
                                    </td>
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">결제 방식</span> <span><img src="https://img.icons8.com/color/48/000000/mastercard.png" width="20" /></span> </div>
                                    </td>
                         <c:choose>
							<c:when test="${orderedDTO.recieve eq 0}">           
                                    <td>
                                        <div class="py-2"> <span class="d-block text-muted">수령 방법</span> <span>택배 배송</span> </div>
                                    </td>
                            </c:when>
                            <c:otherwise>
                            		<td>
                                        <div class="py-2"> <span class="d-block text-muted">수령 방법</span> <span>직접 수령</span> </div>
                                    </td>
                            </c:otherwise>
                        </c:choose>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="product border-bottom table-responsive">
                        <table class="table table-borderless">
                            <tbody>
                             <c:forEach items="${cartlist}" var="dto">
                                <tr>
                                    <td width="20%"> <img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${dto.brandengname}/${dto.categoryproductNo}/${dto.thumbnail}.jpg" width="90"> </td>
                                    <td width="60%"> <span class="font-weight-bold">${dto.name}</span>
                                        <div class="product-qty"> <span class="d-block">수량 : ${dto.qty}</span> <span>Size: ${dto.productsize}</span> </div>
                                    </td>
                                    <td width="20%">
                                        <div class="text-right"> <span class="font-weight-bold">${dto.memberPrice}원</span> </div>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row d-flex justify-content-end">
                        <div class="col-md-5">
                            <table class="table table-borderless">
                                <tbody class="totals">
                                    <tr>
                                        <td>
                                            <div class="text-left"> <span class="text-muted">포인트 사용</span> </div>
                                        </td>
                                        <td>
                                            <div class="text-right"> <span class="text-success">${orderedDTO.usedPoint}P</span> </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="text-align: center; margin-top: 40px">
					   <button type="button" class="admitbtn btn btn-outline-dark" style="user-select: auto;">주문 확인</button>
		      		</div>
                </div>
                <div class="d-flex justify-content-between footer p-3"> </div>
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