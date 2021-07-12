<%@page import="dev.department.subscribe.dto.MemberDTO"%>
<%@page import="dev.department.subscribe.dto.PagingDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="brandInfo" value="${brandInfo}" />
<c:set var="pagingDTO" value="${pagingDTO}" />
<c:set var="categoryNo" value="${categoryNo}" />
<c:set var="categoryProductInfo" value="${categoryProductInfo}" />
<c:set var="productInfo" value="${productInfo}" />
<!DOCTYPE html>
<%
	PagingDTO pagingDTO = (PagingDTO)pageContext.getAttribute("pagingDTO");
	
	int pageSize = pagingDTO.getPageSize();
	long pagenum = pagingDTO.getPage();
	if(pagenum==0){
		pagenum=1;
	}
	
	
	long productStart = pageSize*(pagenum-1)+1;
	long productEnd = pageSize*pagenum;
%>
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
    		makePage(${pagingDTO.page}, ${pagingDTO.pageSize}, ${pagingDTO.pageBlock}, ${pagingDTO.startPage}, ${pagingDTO.endPage}, ${pagingDTO.totalPage});
    		if(${pagingDTO.page}!=0){
    			moveScroll();
    		}
    	});
    	
    	function movePage(categoryNo, page){
    		location.href="${context}/brands/brandpage/${brandInfo.no}/${categoryNo}/"+page;
    	}
    	
    	function makePage(page, pageSize, pageBlock, startPage, endPage, totalPage){
    		
    		if(page==0){
    			page=1;
    		}
    		
    		let select_page='';
    		
    		if(endPage!=0){
    		if (startPage == 1 && page==1) {
    			select_page += '';
			} else {
				select_page += '<li class="prev"><a onclick="movePage(${categoryNo}, '+(page-1)+')">< 이전</a></li>';
			}
			
			for (let i = startPage; i < endPage + 1; i++) {
				if (page == i) {
					select_page += '<li class="active page-block"><a onclick="movePage(${categoryNo}, '+i+')">'+i+'</a></li>';
				} else {
					select_page += '<li class="page-block"><a onclick="movePage(${categoryNo}, '+i+')">'+i+'</a></li>';
				}
			}
			
			if (endPage == totalPage && page == totalPage) {
				select_page += '';
			} else {
				select_page += '<li class="next"><a onclick="movePage(${categoryNo}, '+(page+1)+')">다음 ></a></li>';
			} 	
			
			$('.page-num').html(select_page);
    		}
    	}
    	
    	function moveScroll(){
    		let location = document.querySelector('.product-category').offsetTop;
    		window.scrollTo({top:location, behavior:'smooth'});
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
    </header>
    <!-- Header Section End -->
    
    <!-- Brand logo IMG Begin -->
    <div class="brandpage-logo text-center">
    	<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-logo/${brandInfo.engname}.jpg">
    </div>
    <!-- Brand logo IMG End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-blog set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-background/${brandInfo.engname}.jpg">
        <div class="brandpage-buttons">
        	<button class="brandpage-button"><a href="/subscribe/brands/reservationform/${brandInfo.no}" style="color: white">방문예약</a></button>
        	<button class="brandpage-button ml-3"><a href="/subscribe/brands/brandnewscrawl/${brandInfo.no}" style="color: white">브랜드 뉴스</a></button>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Product Category Begin -->
	<div class="container">
		<div id="product-category" class="product-category text-center">
			<ul>
				<li><a href="${context}/brands/brandpage/${brandInfo.no}/all/1">전체</a></li>
				<c:forEach items="${categoryProductInfo}" var="categoryProduct">
					<li><a href="${context}/brands/brandpage/${brandInfo.no}/${categoryProduct.no}/1">${categoryProduct.name}</a></li>
				</c:forEach>
			</ul>
			<hr>
		</div>
	</div>

	<!-- Product Category End -->

    <!-- Shop Section Begin -->
    <section class="shop spad" style="padding-top: 15px">
        <div class="container">
            <div class="row">
				<div class="col-lg-12">
					<div class="shop__product__option">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__left">
									<c:if test="${pagingDTO.recordCount == 0}">
										<p>총 ${pagingDTO.recordCount} 개의 상품</p>
									</c:if>
									<c:if test="${pagingDTO.recordCount != 0}">
										<p>총 ${pagingDTO.recordCount} 개의 상품 중 <%=productStart %>번 - <%=productEnd %>번 상품</p>
									</c:if>
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
					<div class="row">

						<c:forEach items="${productInfo}" var="product">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${brandInfo.engname}/${product.categoryproductNo}/${product.thumbnail}.jpg">
										<ul class="product__hover">
											<li><a href="#"><img
													src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
											<li><a href="#"><img
													src="${context}/resources/theme/img/icon/compare.png"
													alt=""> <span>Compare</span></a></li>
											<li><a href="#"><img
													src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
										</ul>
									</div>
									<div class="product__item__text">
										<h6>${product.name}</h6>
										<a href="#" class="add-cart">+ 장바구니에 담기</a>

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
   
</body>

</html>