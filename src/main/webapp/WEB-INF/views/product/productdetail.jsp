<%@page import="dev.department.subscribe.dto.BrandDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dev.department.subscribe.dto.ProductDTO"%>
<%@page import="dev.department.subscribe.dto.MemberDTO"%>
<%@page import="dev.department.subscribe.dto.PagingDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="main" value="${main}" />
<c:set var="sub" value="${sub}" />
<c:set var="productInfo" value="${productInfo}" />
<c:set var="brandInfo" value="${brandInfo}" />
<c:set var="sizeInfo" value="${sizeInfo}" />

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
    <link rel="stylesheet" href="${context}/resources/custom/css/modal2.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/productdetail/css/productdetail.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/2.0.0/toastui-editor.min.css" />
    
     <!-- Js Plugins -->
    <script src="${context}/resources/theme/js/jquery-3.3.1.min.js"></script>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
	
	$(document).ready(function(){
		addCart();
		addZZim();
	});
	
	function addCart() {
		$('.btn-cart').click(function(){
			var selected = $("input[type='radio'][name='size_no']:checked");
			console.log($(selected.val()));
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/product/detail/addcart/' + ${productInfo.no} + '/' + ${productInfo.price} + '/' + selected.val()
			});
		});
	}
	
	function addZZim() {
		$('.btn-zzim').click(function(){
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/product/detail/addzzim/' + ${productInfo.no}
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

	<section class="shop spad" style="padding-top: 15px">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-6 col-sm-12">
					<img
						src="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${brandInfo.engname}/${productInfo.categoryproductNo}/${productInfo.thumbnail}.jpg">
				</div>
				<div class="col-lg-6 col-sm-12" align="left">
					<div class="detail-brand">
						<a href="#">${brandInfo.name}</a>
					</div>
					<div class="detail-info">
						<p class="product-name">${productInfo.name}</p>
						<p class="product-price">
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${productInfo.price}" />원</p>
					</div>
					<hr>
					<div class="detail-size">
						<div class="row" style="margin-left: 0px; margin-right: 0px;">
							<c:forEach items="${sizeInfo}" var="size">
								<div class="form_radio_btn">
									<input id="${size.no}" type="radio" name="size_no"
										value="${size.no}"> <label for="${size.no}">${size.productSize}</label>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="detail-button">
						<div class="row">
							<div class="col-lg-5 col-sm-5" style="padding-right: 0px;">
								<button class="btn-buy"
									style="margin-left: 0px; margin-right: 0px;">바로구매</button>
							</div>
							<div class="col-lg-5 col-sm-5" style="padding-left: 0px;">
								<button class="btn-cart" data-toggle="modal" data-target="#addcartbtn"
									style="margin-left: 0px; margin-right: 0px; padding-left: 0px;">장바구니</button>
							</div>
							<div class="col-lg-2 col-sm-2">
								<button class="btn-zzim" data-toggle="modal" data-target="#addzzimbtn"
									style="margin-left: 0px; margin-right: 0px;">찜</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 장바구니 추가 모달 -->
	<div class="modal fade" id="addcartbtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		 <div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content rounded-0">
				 <div class="modal-body p-4 px-5">
					<div class="main-content text-center">
						 <div class="warp-icon mb-4">
							   <img src="${context}/resources/custom/img/cart.png" style="height: 50px; width: 50px; margin-top: 15px" class="img-fluid">
						</div>
							   <label>장바구니에 추가되었습니다.</label>
							    <div class="d-flex">
							          <div class="mx-auto">
							          <button class="btn btn-outline-dark" data-dismiss="modal">확인</button>
							           </div>
							       </div>
							</div>
						</div>
					</div>
				 </div>
		    </div>
							    
	<!-- 찜 추가 모달 -->
	<div class="modal fade" id="addzzimbtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		 <div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content rounded-0">
				 <div class="modal-body p-4 px-5">
					<div class="main-content text-center">
						 <div class="warp-icon mb-4">
							   <img src="${context}/resources/custom/img/like.png" style="height: 50px; width: 50px; margin-top: 15px" class="img-fluid">
						</div>
							   <label>나의 찜에 추가되었습니다.</label>
							    <div class="d-flex">
							          <div class="mx-auto">
							          <button class="btn btn-outline-dark" data-dismiss="modal">확인</button>
							           </div>
							       </div>
							</div>
						</div>
					</div>
				 </div>
		    </div>
		    
	<!-- Banner Section Begin -->
	<div class=container>
		<img src="${context}/resources/productdetail/ad.jpg">
	</div>
	<!-- Banner Section End -->
	
	<!-- Toast UI editor Viewer Section Begin -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div id="viewer">

				</div>
				<script src="https://uicdn.toast.com/editor/2.0.0/toastui-editor-all.min.js"></script>
    
    <script>
    	const content = "<h1>제목</h1>";
    	const viewer = toastui.Editor.factory({
        	el: document.querySelector('#viewer'),
        	viewer: true,
        	height: '500px',
        	initialValue: content
    	});
    	
    </script>
			</div>
		</div>	
	</div>
	<!-- Toast UI editor Viewer Section End -->

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
   
</body>

</html>