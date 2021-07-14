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
<c:set var="subsBoardInfo" value="${subsBoardInfo}" />
<c:set var="tagedProductsInfo" value="${tagedProductsInfo}" />
<c:set var="brandName" value="${brandName}" />
<c:set var="brandEngName" value="${brandEngName}" />



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
    
    <script>
    function moveProductDetail(brandNo, productNo){
		location.href="${context}/product/detail/"+brandNo+"/"+productNo;
	}
    
    function zzimBtn(productNo, productName) {
    	$.ajax({
	        type:"get",
	        url:"${context}/zzimAction/"+productNo,
	        success:function (data){
	        	if (data == "성공") {
		        	/* alert(productName + " 찜 하였습니다."); */
		        	$(".heart"+productNo).fadeIn("slow");
		        	setTimeout(function() {
		        		  console.log('Works!');
	        		}, 10000);
		        	$(".heart"+productNo).fadeOut("slow");
	        	} else if (data == "이미 존재") {
	        		alert(productName + "\n\n이미 찜 완료된상품입니다.");
	        	}
	        	
	       },
	      error:function(data,textStatus){
	         alert("로그인이 필요합니다.");
	      },
	      complete:function(data,textStatus){
	      }
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
						src="https://subscribe.s3.ap-northeast-2.amazonaws.com/coordi/${subsBoardInfo.thumbnail}">
				</div>
				<div class="col-lg-6 col-sm-12" align="left">
					<div class="detail-brand">
						<a href="#">${brandName}</a>
					</div>
					<div class="detail-info">
						<p class="product-name">${subsBoardInfo.title}</p>
					</div>
					<hr>
					<div>
						<p class="taged">착용 상품</p>
						
						<c:forEach items="${tagedProductsInfo}" var="product">
							<div class="row align-items-center">
								<div class="col-lg-2">
									<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${brandEngName}/${product.categoryproductNo}/${product.thumbnail}.jpg">
								</div>
								<div class="col-lg-10 ">
									<a class="taged-product-name" href="${context}/product/detail/${product.brandNo}/${product.no}">${product.name}</a>
								</div>
							</div>
							<hr>
						</c:forEach>
						
					</div>
				</div>
			</div>
			<hr>
		</div>
	</section>


	<!-- Banner Section Begin -->
	<div class=container>
		<img src="${context}/resources/productdetail/ad.jpg">
		<textarea style="display:none;" id="content">${subsBoardInfo.content}</textarea>
	</div>
	<!-- Banner Section End -->

	<!-- Toast UI editor Viewer Section Begin -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div id="viewer"></div>
				<hr>
				<script
					src="https://uicdn.toast.com/editor/2.0.0/toastui-editor-all.min.js"></script>
				<script>
					const content = document.getElementById('content');
					const viewer = toastui.Editor.factory({
						el : document.querySelector('#viewer'),
						viewer : true,
						height : '500px',
						initialValue : content.value
					});
				</script>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
			
				<p class="taged mt-2 mb-4">착용 상품 바로가기</p>
				<div class="row">

					<c:forEach items="${tagedProductsInfo}" var="product">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${brandEngName}/${product.categoryproductNo}/${product.thumbnail}.jpg">
									<h3 class="heart${product.no} text-center" style="display:none; color: #ffb3e8; font-size: 60px; line-height: 1; padding-top:100px;">❤</h3>
									<ul class="product__hover">
										<li style="cursor:pointer"><a onClick="zzimBtn(${product.no}, '${product.name}')"><img src="${context}/resources/theme/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
											<li><a href="#"><img
													src="${context}/resources/theme/img/icon/compare.png"
													alt=""> <span>비교하기</span></a></li>
											<li><a href="${context}/product/detail/${product.brandNo}/${product.no}"><img
													src="${context}/resources/theme/img/icon/search.png" alt=""><span>상세보기</span></a></li>
										</ul>
								</div>
								<div class="product__item__text">
									<h6>${product.name}</h6>
									<h5>
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${product.price}" />
										&nbsp;원
									</h5>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

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