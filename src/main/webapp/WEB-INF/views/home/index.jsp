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
    <script src="https://kit.fontawesome.com/fd670bf7a0.js"></script>
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
	        		$(".subtext"+brandNo).html('<i class="fas fa-paper-plane"></i><strong>빠른구독</strong>');
	        		$("#flag"+brandNo).val("0");
		        	alert(data);
	        	} else if (data == "구독완료") {
	        		$(".subtext"+brandNo).html('<i class="fas fa-paper-plane"></i><strong>구독완료</strong>');
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
						<div class="brand-image brand-list" >
							<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand/${branSubsList[i].engname}.jpg" />
							<input id="flag${branSubsList[i].no}" value="${branSubsList[i].subsed}" type="hidden"/> <!-- 구독 여부 flag -->
							<c:choose>
						         <c:when test = "${branSubsList[i].subsed == 1}">
						         	<div class="subtextBox1">
						            	<a id="${branSubsList[i].no}" class="subtext${branSubsList[i].no} brand_action1" onClick="subBtn(${branSubsList[i].no}, flag${branSubsList[i].no}.value)">
						            		<i class="fas fa-paper-plane"></i><strong>구독완료</strong>
						            	</a>
						            </div>
						            <div class="subtextBox2">
						            	<a href="${context}/brands/brandpage/${branSubsList[i].no}" class="brand_action2">
						            		<i class="fas fa-home"></i><strong>방문하기</strong>
					            		</a>
						            </div>
						            
						         </c:when>
						         <c:otherwise>
							         <div class="subtextBox1">
							            <a id="${branSubsList[i].no}" class="subtext${branSubsList[i].no} brand_action1" onClick="subBtn(${branSubsList[i].no}, flag${branSubsList[i].no}.value)">
							            	<i class="fas fa-paper-plane"></i><strong>빠른구독</strong>
						            	</a>
						            </div>
						            <div class="subtextBox2">
						            	<a href="${context}/brands/brandpage/${branSubsList[i].no}" class="brand_action2">
						            		<i class="fas fa-home"></i><strong>방문하기</strong>
					            		</a>
						            </div>
						         </c:otherwise>
						    </c:choose>
						</div>
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
						<div class="brand-image brand-list" >
							<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand/${branSubsList[i].engname}.jpg" />
							<input id="flag${branSubsList[i].no}" value="${branSubsList[i].subsed}" type="hidden"/> <!-- 구독 여부 flag -->
							<c:choose>
						         <c:when test = "${branSubsList[i].subsed == 1}">
						         	<div class="subtextBox1">
										<a id="${branSubsList[i].no}" class="subtext${branSubsList[i].no} brand_action1"  onClick="subBtn(${branSubsList[i].no}, flag${branSubsList[i].no}.value)">
						            		<i class="fas fa-paper-plane"></i><strong>구독완료</strong>
						            	</a>
						            </div>
						            <div class="subtextBox2">
										<a href="${context}/brands/brandpage/${branSubsList[i].no}" class="brand_action2">
						            		<i class="fas fa-home"></i><strong>방문하기</strong>
						            	</a>
						            </div>
						         </c:when>
						         <c:otherwise>
						         	<div class="subtextBox1">
										<a id="${branSubsList[i].no}" class="subtext${branSubsList[i].no} brand_action1"  onClick="subBtn(${branSubsList[i].no}, flag${branSubsList[i].no}.value)">
						            		<i class="fas fa-paper-plane"></i><strong>빠른구독</strong>
						            	</a>
						            </div>
						            <div class="subtextBox2">
										<a href="${context}/brands/brandpage/${branSubsList[i].no}" class="brand_action2">
						            		<i class="fas fa-home"></i><strong>방문하기</strong>
						            	</a>
						            </div>
						            
						         </c:otherwise>
						    </c:choose>	
						
						
						
						</div>
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
	                        <div class="blog__item__pic set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-news/${news.engname}.jpg"></div>
	                        <div class="blog__item__text">
	                            <span><img src="${context}/resources/theme/img/icon/calendar.png" alt=""><fmt:formatDate value="${news.uploaddate}" pattern="yyyy-MM-dd"/></span>
	                            <h5>${news.name}</h5>
	                            <h6 class="mt-4 newstitle">${news.title}</h6>
	                            <c:choose>
								        <c:when test="${fn:length(news.content) gt 26}">
								        <h6 class="mt-3 mb-4 newscontent">
								        	<c:out value="${fn:substring(news.content, 0, 50)}"/>...
								        </h6></c:when>
								        <c:otherwise>
								        <h6 class="mt-3 mb-4 newscontent"><c:out value="${news.content}" />
								        </h6></c:otherwise>
								</c:choose>
	                            <%-- <h6 class="mt-3 mb-4 newscontent">${news.content}</h6> --%>
	                            <a href="${context}/brands/brandpage/${news.no}">자세히보기</a>
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
                        <li class="active" data-filter="*">Brands All</li>
                        <li data-filter=".best-seller">Best Sellers</li>
                        <li data-filter=".new-arrivals">New Arrivals</li>
                    </ul>
                </div>
            </div>
            
            <div class="row product__filter">
            	<c:forEach var="item" items="${bestList}">
					<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix best-seller">
                    	<div class="product__item">
            				<div class="product__item__pic set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${item.engname}/${item.categoryproductNo}/${item.thumbnail}.jpg">
	                            <span class="label">Best</span>
	                            <ul class="product__hover">
	                                <li><a href="${context}/mypage/like"><img src="${context}/resources/theme/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
	                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>상품비교</span></a></li>
	                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""><span>상세보기</span></a></li>
	                            </ul>
                        	</div>
            				<div class="product__item__text">
	                            <h6>${item.name}</h6>
	                            <a href="#" class="add-cart">+ 장바구니에 담기</a>
	                            <div class="rating">
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                            </div>
	                            <h5><fmt:formatNumber value="${item.price}" pattern="#,###" />원</h5>
	                        </div>
            			</div>
                	</div>
            	</c:forEach>
            	
            	<c:forEach var="item" items="${newProList}">
					<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    	<div class="product__item">
            				<div class="product__item__pic set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${item.engname}/${item.categoryproductNo}/${item.thumbnail}.jpg">
	                            <span class="label">New</span>
	                            <ul class="product__hover">
	                                <li><a href="${context}/mypage/like"><img src="${context}/resources/theme/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
	                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>상품비교</span></a></li>
	                                <li><a href="#"><img src="${context}/resources/theme/img/icon/search.png" alt=""><span>상세보기</span></a></li>
	                            </ul>
                        	</div>
            				<div class="product__item__text">
	                            <h6>${item.name}</h6>
	                            <a href="#" class="add-cart">+ 장바구니에 담기</a>
	                            <div class="rating">
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                            </div>
	                            <h5><fmt:formatNumber value="${item.price}" pattern="#,###" />원</h5>
	                        </div>
            			</div>
                	</div>
            	</c:forEach>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Categories Section Begin -->
    <%-- <section class="categories spad">
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
    </section> --%>
    <!-- Categories Section End -->

    <!-- Instagram Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <a href="#" class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-1.jpg"></a>
                        <a href="#" class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-2.jpg"></a>
                        <a href="#" class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-3.jpg"></a>
                        <a href="#" class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-4.jpg"></a>
                        <a href="#" class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-5.jpg"></a>
                        <a href="#" class="instagram__pic__item set-bg" data-setbg="${context}/resources/theme/img/instagram/instagram-6.jpg"></a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="instagram__text">
                    	<div class="row">
                        	<img src="${context}/resources/index/images/instaLogo.png" style="width:70px;object-fit:cover"/><h2 class="mt-3">Instagram</h2>
                        </div>
                        <p></p>
                        <a href="https://www.instagram.com/the_hyundai/" style="color:red"># 현대백화점 공식 계정 바로가기</a><i class="far fa-hand-point-left"></i>
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



