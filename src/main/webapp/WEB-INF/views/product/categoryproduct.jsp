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
<c:set var="brandInfo" value="${brandInfo}" />
<c:set var="pagingDTO" value="${pagingDTO}" />
<c:set var="main" value="${main}" />
<c:set var="sub" value="${sub}" />
<c:set var="productInfo" value="${productInfo}" />
<c:set var="brandInfo" value="${brandInfo}" />

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
    <link rel="stylesheet" href="${context}/resources/brands/css/mybrands-product.css" type="text/css">
    
     <!-- Js Plugins -->
    <script src="${context}/resources/theme/js/jquery-3.3.1.min.js"></script>
	<script src="https://kit.fontawesome.com/fd670bf7a0.js"></script>
	<script>
    	$(document).ready(function(){
    		makePage(${pagingDTO.page}, ${pagingDTO.pageSize}, ${pagingDTO.pageBlock}, ${pagingDTO.startPage}, ${pagingDTO.endPage}, ${pagingDTO.totalPage});
    	
    	    if('${main}'=='????????????'){
    	    	document.getElementById('women').className += 'active';
    	    }
    	    if('${main}'=='????????????'){
    	    	document.getElementById('men').className += 'active';
    	    }
    	    if('${main}'=='????????????'){
    	    	document.getElementById('unisex').className += 'active';
    	    }
    	    if('${main}'=='???/?????????'){
    	    	document.getElementById('jean').className += 'active';
    	    }
    	    if('${main}'=='?????????/??????'){
    	    	document.getElementById('sport').className += 'active';
    	    }
    		
    	});
    	
    	function moveProductDetail(brandNo, productNo){
    		location.href="${context}/product/detail/"+brandNo+"/"+productNo;
    	}
    	
    	function movePage(page){
    		location.href="${context}/product/category?main=${main}&sub=${sub}&page="+page;
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
				select_page += '<li class="prev"><a onclick="movePage('+(page-1)+')">< ??????</a></li>';
			}
			
			for (let i = startPage; i < endPage + 1; i++) {
				if (page == i) {
					select_page += '<li class="active page-block"><a onclick="movePage('+i+')">'+i+'</a></li>';
				} else {
					select_page += '<li class="page-block"><a onclick="movePage('+i+')">'+i+'</a></li>';
				}
			}
			
			if (endPage == totalPage && page == totalPage) {
				select_page += '';
			} else {
				select_page += '<li class="next"><a onclick="movePage('+(page+1)+')">?????? ></a></li>';
			} 	
			
			$('.page-num').html(select_page);
    		}
    	}
    	
    	function moveScroll(){
    		let location = document.querySelector('.product-category').offsetTop;
    		window.scrollTo({top:location, behavior:'smooth'});
    	}
    	
    	$(function(){
    		  $('.zzimBtn').click(function(){
    		    $('.heartbox').show();
    		  });
    		});
    	
    	function zzimBtn(productNo, productName) {
        	$.ajax({
    	        type:"get",
    	        url:"${context}/zzimAction/"+productNo,
    	        success:function (data){
    	        	if (data == "??????") {
    		        	/* alert(productName + " ??? ???????????????."); */
    		        	$(".heart"+productNo).fadeIn("slow");
    		        	setTimeout(function() {
    		        		  console.log('Works!');
    	        		}, 10000);
    		        	$(".heart"+productNo).fadeOut("slow");
    	        	} else if (data == "?????? ??????") {
    	        		alert(productName + "\n\n?????? ??? ????????????????????????.");
    	        	}
    	        	
    	       },
    	      error:function(data,textStatus){
    	         alert("???????????? ???????????????.");
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
    
   
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-blog set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-background/jillstuartnewyork.jpg">
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Product Category Begin -->
	<div class="container">
		<div id="product-category" class="product-category text-center">
			<ul>
				<li><a href="${context}/product/category?main=${main}&sub=${sub}&page=1">??????</a></li>
				<c:forEach items="${categoryProductInfo}" var="categoryProduct">
					<li><a href="${context}/product/category?main=${main}&sub=${categoryProduct.name}&page=1">${categoryProduct.name}</a></li>
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
										<p>??? ${pagingDTO.recordCount} ?????? ??????</p>
									</c:if>
									<c:if test="${pagingDTO.recordCount != 0}">
										<p>??? ${pagingDTO.recordCount} ?????? ?????? ??? <%=productStart %>??? - <%=productEnd %>??? ??????</p>
									</c:if>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__right">
									<select>
										<option value="new">????????????</option>
										<option value="high-price">?????? ?????????</option>
										<option value="low-price">?????? ?????????</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row" >
						<c:if test="${fn:length(productInfo)==0}">
						<div class="col-md-12 text-center">
							<img src="${context}/resources/product/noitem.png">
						</div>
						</c:if>
						<c:forEach items="${productInfo}" var="product">
							<%
								ProductDTO productInfo = (ProductDTO)pageContext.getAttribute("product");
								ArrayList<BrandDTO> brandsInfo= (ArrayList<BrandDTO>)pageContext.getAttribute("brandInfo");
								int brandNo = productInfo.getBrandNo();
								String brandName = brandsInfo.get(brandNo-1).getEngname();
							%>
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/<%=brandName%>/${product.categoryproductNo}/${product.thumbnail}.jpg">
										<h3 class="heart${product.no} text-center" style="display:none; color: #ffb3e8; font-size: 60px; line-height: 1; padding-top:100px;">???</h3>
										<ul class="product__hover">
											<li style="cursor:pointer"><a onClick="zzimBtn(${product.no}, '${product.name}')"><img src="${context}/resources/theme/img/icon/heart.png" alt=""><span>?????????</span></a></li>
											<li><a href="#"><img
													src="${context}/resources/theme/img/icon/compare.png"
													alt=""> <span>????????????</span></a></li>
											<li><a href="${context}/product/detail/${product.brandNo}/${product.no}"><img
													src="${context}/resources/theme/img/icon/search.png" alt=""><span>????????????</span></a></li>
										</ul>
									</div>
									<div class="product__item__text">
										<h6>${product.name}</h6>
										<h5>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${product.price}" />
											&nbsp;???
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