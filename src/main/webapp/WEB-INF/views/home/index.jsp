<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="branSubsList" value="${branSubsList}" />
<c:set var="newsList" value="${newsList}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>현대백화점 | 구독서비스</title>

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
    <link rel="stylesheet" href="${context}/resources/index/css/index.css" type="text/css">
    
    <!-- js -->
    <script type="text/javascript" src="${context}/resources/index/js/jquery-3.6.0.min.js" ></script>
	<script type="text/javascript">
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".brand_spread").click(function(){
            var submenu = $("#brand_no_show");
 			
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
                $(".brand_spread").html("<strong>브랜드 더보기</strong>");
            }else{
                submenu.slideDown();
                $(".brand_spread").html("<strong>브랜드 접기</strong>");
            }
            
        });
        
    });
    
    function subBtn(brandNo, subsed) {
    	$.ajax({
	        type:"get",
	        url:"${context}/simplesubs/"+brandNo+"/"+subsed,
	        success:function (data){
	        	if (data == "취소완료") {
	        		$(".subtext"+brandNo).html("<strong>빠른구독</strong>");
	        		$("#flag"+brandNo).val("0");
		        	alert(data);
	        	} else if (data == "구독완료") {
	        		$(".subtext"+brandNo).html("<strong>구독완료</strong>");
	        		$("#flag"+brandNo).val("1");
		        	alert(data);
	        	}
	        	
	       },
	      error:function(data,textStatus){
	         alert("에러가 발생했습니다.");
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

    <!-- Header Section Begin -->
    <header class="header">
    	<jsp:include page="/WEB-INF/views/home/header1.jsp" flush="false" />
        <jsp:include page="/WEB-INF/views/home/header2.jsp" flush="false" />
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="${context}/resources/theme/img/hero/hero-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Summer Collection</h6>
                                <h2>Fall - Winter Collections 2030</h2>
                                <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="${context}/resources/theme/img/hero/hero-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Summer Collection</h6>
                                <h2>Fall - Winter Collections 2030</h2>
                                <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
	
	<!-- 브랜드 아이콘 Start-->
	<sec:authorize access="isAuthenticated()">
		<div class="container">
			<div class="row  mt-3 mb-4">
				<div class="col-md-1"></div>
				<h2 class="col-md-8">BRAND STORE</h2>
				<a href="./brands" style="margin-top:10px;" class="col-md-3">브랜드스토어 전체보기</a>
			</div>
			
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10 text-center">
					<c:forEach var="i" begin="0" end="6">
						<a class="brand-image brand-list" id="${branSubsList[i].no}" onClick="subBtn(${branSubsList[i].no}, flag${branSubsList[i].no}.value)">
							<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand/${branSubsList[i].engname}.jpg" />
							<input id="flag${branSubsList[i].no}" value="${branSubsList[i].subsed}" type="hidden"/> <!-- 구독 여부 flag -->
							<c:choose>
						         <c:when test = "${branSubsList[i].subsed == 1}">
						         	<div class="subtextBox">
						            	<h6 class="subtext${branSubsList[i].no}"><strong>구독완료</strong></h6>
						            </div>
						         </c:when>
						         <c:otherwise>
							         <div class="subtextBox">
							            <h6 class="subtext${branSubsList[i].no}"><strong>빠른구독</strong></h6>
						            </div>
						         </c:otherwise>
						    </c:choose>
						</a>
						<!-- </div> -->
					</c:forEach>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-md-1"></div>
				<div class="col-md-10 text-center">
					<c:forEach var="i" begin="0" end="6">
						<img class="brand_logo" src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-logo/${branSubsList[i].engname}.jpg" />
					</c:forEach>
				</div>
			</div>
			<c:set var="line" value="7"/>
			<div id="brand_no_show" style="display:none;">
			<c:forEach var="j" begin="0" end="1">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10 text-center">
					<c:forEach var="i" begin="${line}" end="${line  + 6}">
						<a class="brand-image brand-list" id="${branSubsList[i].no}" onClick="subBtn(${branSubsList[i].no}, flag${branSubsList[i].no}.value)">
							<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand/${branSubsList[i].engname}.jpg" />
							<input id="flag${branSubsList[i].no}" value="${branSubsList[i].subsed}" type="hidden"/> <!-- 구독 여부 flag -->
							<c:choose>
						         <c:when test = "${branSubsList[i].subsed == 1}">
						         	<div class="subtextBox">
						            	<h6 class="subtext${branSubsList[i].no}"><strong>구독완료</strong></h6>
						            </div>
						         </c:when>
						         <c:otherwise>
							         <div class="subtextBox">
							            <h6 class="subtext${branSubsList[i].no}"><strong>빠른구독</strong></h6>
						            </div>
						         </c:otherwise>
						    </c:choose>	
						</a>
					</c:forEach>
				</div>
			</div>
			<div class="row  mb-3">
				<div class="col-md-1"></div>
				<div class="col-md-10 text-center">
					<c:forEach var="i" begin="${line}" end="${line  + 6}">
						<img class="brand_logo" src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-logo/${branSubsList[i].engname}.jpg" />
					</c:forEach>
				</div>
			</div>
			<c:set var="line" value="14"/>
			</c:forEach>
			</div>
			<div class="col-md-12 text-center mt-5">
				<a class="brand_spread"><strong>브랜드 더보기</strong></a>
			</div>
		</div>
	</sec:authorize>
	<!-- 브랜드 아이콘 end-->
	
	<!-- Latest Blog Section Begin -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Latest News</span>
                        <h2>브랜드 소식</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="news" items="${newsList}">
					<div class="col-lg-4 col-md-6 col-sm-6">
	                    <div class="blog__item">
	                        <div class="blog__item__pic set-bg" data-setbg="${context}/resources/theme/img/blog/blog-2.jpg"></div>
	                        <div class="blog__item__text">
	                            <span><img src="${context}/resources/theme/img/icon/calendar.png" alt=""><fmt:formatDate value="${news.uploaddate}" pattern="yyyy-MM-dd"/></span>
	                            <h5>${news.name}</h5>
	                            <h6>${news.title}</h6>
	                            <a href="${context}/brands/brandpage/${news.no}">Read More</a>
	                        </div>
	                    </div>
	                </div>	
				</c:forEach>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->
    
    <!-- Banner Section Begin -->
    <section class="banner spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <img src="${context}/resources/theme/img/banner/banner-1.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Clothing Collections 2030</h2>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img src="${context}/resources/theme/img/banner/banner-2.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Accessories</h2>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="banner__item banner__item--last">
                        <div class="banner__item__pic">
                            <img src="${context}/resources/theme/img/banner/banner-3.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Shoes Spring 2030</h2>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->
    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">Best Sellers</li>
                        <li data-filter=".new-arrivals">New Arrivals</li>
                        <li data-filter=".hot-sales">Hot Sales</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${context}/resources/theme/img/product/product-1.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>PiquÃ© Biker Jacket</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$67.24</h5>
                            <div class="product__color__select">
                                <label for="pc-1">
                                    <input type="radio" id="pc-1">
                                </label>
                                <label class="active black" for="pc-2">
                                    <input type="radio" id="pc-2">
                                </label>
                                <label class="grey" for="pc-3">
                                    <input type="radio" id="pc-3">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${context}/resources/theme/img/product/product-2.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>PiquÃ© Biker Jacket</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$67.24</h5>
                            <div class="product__color__select">
                                <label for="pc-4">
                                    <input type="radio" id="pc-4">
                                </label>
                                <label class="active black" for="pc-5">
                                    <input type="radio" id="pc-5">
                                </label>
                                <label class="grey" for="pc-6">
                                    <input type="radio" id="pc-6">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item sale">
                        <div class="product__item__pic set-bg" data-setbg="${context}/resources/theme/img/product/product-3.jpg">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Multi-pocket Chest Bag</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$43.48</h5>
                            <div class="product__color__select">
                                <label for="pc-7">
                                    <input type="radio" id="pc-7">
                                </label>
                                <label class="active black" for="pc-8">
                                    <input type="radio" id="pc-8">
                                </label>
                                <label class="grey" for="pc-9">
                                    <input type="radio" id="pc-9">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${context}/resources/theme/img/product/product-4.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Diagonal Textured Cap</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$60.9</h5>
                            <div class="product__color__select">
                                <label for="pc-10">
                                    <input type="radio" id="pc-10">
                                </label>
                                <label class="active black" for="pc-11">
                                    <input type="radio" id="pc-11">
                                </label>
                                <label class="grey" for="pc-12">
                                    <input type="radio" id="pc-12">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${context}/resources/theme/img/product/product-5.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Lether Backpack</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$31.37</h5>
                            <div class="product__color__select">
                                <label for="pc-13">
                                    <input type="radio" id="pc-13">
                                </label>
                                <label class="active black" for="pc-14">
                                    <input type="radio" id="pc-14">
                                </label>
                                <label class="grey" for="pc-15">
                                    <input type="radio" id="pc-15">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item sale">
                        <div class="product__item__pic set-bg" data-setbg="${context}/resources/theme/img/product/product-6.jpg">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Ankle Boots</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$98.49</h5>
                            <div class="product__color__select">
                                <label for="pc-16">
                                    <input type="radio" id="pc-16">
                                </label>
                                <label class="active black" for="pc-17">
                                    <input type="radio" id="pc-17">
                                </label>
                                <label class="grey" for="pc-18">
                                    <input type="radio" id="pc-18">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${context}/resources/theme/img/product/product-7.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>T-shirt Contrast Pocket</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$49.66</h5>
                            <div class="product__color__select">
                                <label for="pc-19">
                                    <input type="radio" id="pc-19">
                                </label>
                                <label class="active black" for="pc-20">
                                    <input type="radio" id="pc-20">
                                </label>
                                <label class="grey" for="pc-21">
                                    <input type="radio" id="pc-21">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${context}/resources/theme/img/product/product-8.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Basic Flowing Scarf</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$26.28</h5>
                            <div class="product__color__select">
                                <label for="pc-22">
                                    <input type="radio" id="pc-22">
                                </label>
                                <label class="active black" for="pc-23">
                                    <input type="radio" id="pc-23">
                                </label>
                                <label class="grey" for="pc-24">
                                    <input type="radio" id="pc-24">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Categories Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="categories__text">
                        <h2>Clothings Hot <br /> <span>Shoe Collection</span> <br /> Accessories</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="${context}/resources/theme/img/product-sale.png" alt="">
                        <div class="hot__deal__sticker">
                            <span>Sale Of</span>
                            <h5>$29.99</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>Deal Of The Week</span>
                        <h2>Multi-pocket Chest Bag Black</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <p>Days</p>
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                                <p>Hours</p>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                                <p>Minutes</p>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Seconds</p>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">Shop now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Instagram Section Begin -->
    <section class="instagram spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <div class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-1.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-2.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-3.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-4.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-5.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-6.jpg"></div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="instagram__text">
                        <h2>Instagram</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore et dolore magna aliqua.</p>
                        <h3>#Male_Fashion</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Instagram Section End -->

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



