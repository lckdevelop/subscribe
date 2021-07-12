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
    //1로 표시된 파라미터 값(memberNo) 이후에 수정
    
    $(document).ready(function(){
		selectContent();
		selectTotal();
		saveCheckoutInfo();
	});
	
    function selectTotal() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/cart/totalinfo', 
		}).done(function( data ) {
			var mytable = '<ul><li>Total <span>' + data + '</span></li>';
			$('#displayTotal').html(mytable);
		});
	}
	
	function selectContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/cart/cartinfo', 
		}).done(function( data ) {
		 	displayContentList(data);
		});
	}
	
	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	    	mytable += '<tr><td class="product__cart__item">';
	    	mytable += '<div class="product__cart__item__pic"><img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/'+ val['brandengname'] +'/'+ val['categoryproductNo'] +'/'+ val['thumbnail'] +'.jpg" style="width: 200px; height: 200px"><div>';
	    	mytable += '<div class="product__cart__item__text"><h6>' + val['name'] + '</h6><p>사이즈: ' + val['productsize'] + '</p></div></td>';
	    	mytable += '<td class="quantity__item"><div class="quantity"><div class="pro-qty-2">';
	    	mytable += '<span class="fa fa-angle-left decqtybtn" myval ="'+ val['productNo'] +'"></span>';
	    	mytable += '<input type="text" value="' + val['qty'] + '">';
	    	mytable += '<span class="fa fa-angle-right incqtybtn" myval ="'+ val['productNo'] +'"></span></div></div></td>';
	    	mytable += '<td class="cart__price">' + val['memberPrice'] + '원</td>';
	    	mytable += '<td class="cart__close"><i class="deletebtn fa fa-close" myval ="'+ val['productNo'] +'"></i></td></tr>';
			});
	 
			$('#contentdisplay').html(mytable);
			selectTotal();
			changedecQTY();
			changeincQTY();
			deleteProduct();
	}
	
	function deleteProduct(){
		$(".deletebtn").click(function () {
			$.ajax({
				method : 'DELETE',
				url : '${pageContext.request.contextPath}/cart/deletepro/'+ $(this).attr('myval')
			}).done(function( data ) {
				displayContentList(data);
			});
		});
	}
	
	function changedecQTY(){
		$(".decqtybtn").click(function () {
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/cart/decqty/'+ $(this).attr('myval')
			}).done(function( data ) {
				displayContentList(data);
			});
		});
	}
	
	function changeincQTY(){
		$(".incqtybtn").click(function () {
			$.ajax({
				method : 'POST',
				url : '${pageContext.request.contextPath}/cart/incqty/'+ $(this).attr('myval')
			}).done(function( data ) {
				displayContentList(data);
			});
		});
	}
	
	function saveCheckoutInfo() {
		$("#saveCheckout").click(function () {
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/cart/savecheckout', 
			});
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
                        <h4>장바구니</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>상품</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id = "contentdisplay">
                            
                                
                             
                            </tbody>
                        </table>
                    </div>
                    <div style="text-align : center">
                            <div class="continue__btn">
                                <a href="#">쇼핑 계속하기</a>
                            </div>
                    </div>
                </div>
                <div class="col-lg-4" style="margin-top: 60px">
                    <div class="cart__total">
                        <h6>총 상품 금액</h6>
                        <div id="displayTotal">
                       
                        </div>
                        <a href="/subscribe/checkout" id="saveCheckout" class="primary-btn">결제하러 가기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

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
    
</body>

</html>