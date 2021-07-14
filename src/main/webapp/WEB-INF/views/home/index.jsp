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
	$(function(){
	  $('.zzimBtn').click(function(){
	    $('.heartbox').show();
	  });
	});
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".brand_spread").click(function(){
            var submenu = $("#brand_no_show");
 			
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
                $(".brand_spread").html("<strong>| 브랜드 더보기 |</strong>");
            }else{
                submenu.slideDown();
                $(".brand_spread").html("<strong>| 브랜드 접기 |</strong>");
            }
            
        });
        
        document.getElementById('home').className += 'active';
        
    });
    
    function subBtn(brandNo, subsed) {
    	$.ajax({
	        type:"get",
	        url:"${context}/simplesubs/"+brandNo+"/"+subsed,
	        success:function (data){
	        	if (data == "취소완료") {
	        		$(".subtext"+brandNo).html('<i class="fas fa-paper-plane"></i><strong>빠른구독</strong>');
	        		$("#flag"+brandNo).val("0");
		        	/* alert(data); */
	        	} else if (data == "구독완료") {
	        		$(".subtext"+brandNo).html('<i class="fas fa-paper-plane"></i><strong>구독완료</strong>');
	        		$("#flag"+brandNo).val("1");
		        	/* alert(data); */
	        	}
	        	
	       },
	      error:function(data,textStatus){
	         alert("에러가 발생했습니다.");
	      },
	      complete:function(data,textStatus){
	      }
	   });
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
	<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "78f11d8e-bc37-4f72-8788-c1bdd437e0c9"
  });
</script>
<!-- End Channel Plugin -->
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
            <div class="hero__items set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/main-banner/banner1.png">
                <div class="container">
                    <div class="row">
                    	<div class="col-xl-9 col-lg-7 col-md-8"></div>
                        <div class="col-xl-3 col-lg-5 col-md-4">
                            <div class="hero__text">
                                <h6>여름 Cheat-Key</h6>
                                <h2>Summer Collections 2030</h2>
                                <p>이 계절엔 바로 이거지!<br> 선글라스, 라탄백 등 필수 구비 아이템</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/main-banner/banner2.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>24시간 즐기는 캠핑존</h6>
                                <h2>Fall - Winter Collections 2030</h2>
                                <p>트렌디한 아웃도어 매장<br> 온라인 쇼룸으로 만나요</p>
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
						            	<a href="${context}/brands/brandpage/${branSubsList[i].no}/all" class="brand_action2">
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
						            	<a href="${context}/brands/brandpage/${branSubsList[i].no}/all" class="brand_action2">
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
										<a href="${context}/brands/brandpage/${branSubsList[i].no}/all" class="brand_action2">
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
										<a href="${context}/brands/brandpage/${branSubsList[i].no}/all" class="brand_action2">
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
				<a class="brand_spread"><strong>| 브랜드 더보기 |</strong></a>
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
	                            <a href="${context}/brands/brandpage/${news.no}/all">자세히보기</a>
	                        </div>
	                    </div>
	                </div>	
				</c:forEach>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->
    
    <!-- Banner Section Begin -->
    <section class="banner">
        <div class="container">
        	<div class="row text-center">
        		<div class="section-title col-lg-12">
	                <span>Preview</span>
	                <h2><strog>스페셜 브랜드</strog></h2>
                </div>
        	</div> 
            <div class="row">
                <div class="col-lg-7 offset-lg-5">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <%-- <img src="${context}/resources/theme/img/banner/banner-1.jpg" alt=""> --%>
                            <img src="${context}/resources/index/images/special/specialbanner1.PNG" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h3>질 스튜어트 뉴욕</h3>
                            <h5 class="mt-3 mb-3">믹스맥치의 개성있는 룩</h5>
                            <a href="${context}/brands/brandpage/24/all">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <%-- <img src="${context}/resources/theme/img/banner/banner-2.jpg" alt=""> --%>
                            <img src="${context}/resources/index/images/special/specialbanner2.PNG" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h3>폴로랄프로렌</h3>
                            <h5 class="mt-3 mb-3">해외 유명 브랜드부터 신진 디자이너까지<br>젊고 위트있는 트렌디 편집관</h5>
                            <a href="${context}/brands/brandpage/14/all">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="banner__item banner__item--last">
                        <div class="banner__item__pic">
                            <%-- <img src="${context}/resources/theme/img/banner/banner-3.jpg" alt=""> --%>
                            <img src="${context}/resources/index/images/special/specialbanner3.PNG" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h3>솔리드옴므</h3>
                            <h5 class="mt-3 mb-3">모던한 감각을 믹스하는<br>세련된 남성들을 위한 편집숍</h5>
                            <a href="${context}/brands/brandpage/8/all">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->
    
    <!-- Product Section Begin -->
    <section class="product">
        <div class="container spad">
        	<div class="row text-center">
        		<div class="section-title col-lg-12">
	                <span>Preview Products</span>
	                <h3>추천상품 미리보기</h3>
                </div>
        	</div> 
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
            	<c:choose>
					<c:when test="${fn:length(subsBestList) != 0}">
						<c:forEach var="item" items="${subsBestList}">
							<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix best-seller">
		                    	<div class="product__item">
		            				<div class="product__item__pic set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${item.engname}/${item.categoryproductNo}/${item.thumbnail}.jpg">
			                            <h3 class="heart${item.no} text-center" style="display:none; color: #ffb3e8; font-size: 60px; line-height: 1; padding-top:100px;">❤</h3>
			                            <span class="label">Best</span>
			                            <ul class="product__hover">
			                                <li><a onClick="zzimBtn(${item.no}, '${item.name}')"><img src="${context}/resources/theme/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
			                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>상품비교</span></a></li>
			                                <li><a href="${context}/product/detail/${item.mainCategory}/${item.categoryproductNo}/${item.brandNo}/${item.no}"><img src="${context}/resources/theme/img/icon/search.png" alt=""><span>상세보기</span></a></li>
			                            </ul>
		                        	</div>
		            				<div class="product__item__text">
			                            <h6>${item.name}</h6>
			                            <h5><fmt:formatNumber value="${item.price}" pattern="#,###" />원</h5>
			                        </div>
		            			</div>
		                	</div>
		            	</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${bestList}">
							<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix best-seller">
		                    	<div class="product__item">
		            				<div class="product__item__pic set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${item.engname}/${item.categoryproductNo}/${item.thumbnail}.jpg">
			                            <h3 class="heart${item.no} text-center" style="display:none; color: #ffb3e8; font-size: 60px; line-height: 1; padding-top:100px;">❤</h3>
			                            <span class="label">Best</span>
			                            <ul class="product__hover">
			                                <li><a onClick="zzimBtn(${item.no}, '${item.name}')"><img src="${context}/resources/theme/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
			                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>상품비교</span></a></li>
			                                <li><a href="${context}/product/detail/${item.mainCategory}/${item.categoryproductNo}/${item.brandNo}/${item.no}"><img src="${context}/resources/theme/img/icon/search.png" alt=""><span>상세보기</span></a></li>
			                            </ul>
		                        	</div>
		            				<div class="product__item__text">
			                            <h6>${item.name}</h6>
			                            <h5><fmt:formatNumber value="${item.price}" pattern="#,###" />원</h5>
			                        </div>
		            			</div>
		                	</div>
		            	</c:forEach>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${fn:length(subsNewProList) != 0}">
						<c:forEach var="item" items="${subsNewProList}">
							<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
		                    	<div class="product__item">
		            				<div class="product__item__pic set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${item.engname}/${item.categoryproductNo}/${item.thumbnail}.jpg">
			                            <h3 class="heart${item.no} text-center" style="display:none; color: #ffb3e8; font-size: 60px; line-height: 1; padding-top:100px;">❤</h3>
			                            <span class="label">New</span>
			                            <ul class="product__hover">
			                                <li><a onClick="zzimBtn(${item.no}, '${item.name}')"><img src="${context}/resources/theme/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
			                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>상품비교</span></a></li>
			                                <li><a href="${context}/product/detail/${item.mainCategory}/${item.categoryproductNo}/${item.brandNo}/${item.no}"><img src="${context}/resources/theme/img/icon/search.png" alt=""><span>상세보기</span></a></li>
			                            </ul>
		                        	</div>
		            				<div class="product__item__text">
			                            <h6>${item.name}</h6>
			                            <h5><fmt:formatNumber value="${item.price}" pattern="#,###" />원</h5>
			                        </div>
		            			</div>
		                	</div>
		            	</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${newProList}">
							<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
		                    	<div class="product__item">
		            				<div class="product__item__pic set-bg" data-setbg="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${item.engname}/${item.categoryproductNo}/${item.thumbnail}.jpg">
			                            <h3 class="heart${item.no} text-center" style="display:none; color: #ffb3e8; font-size: 60px; line-height: 1; padding-top:100px;">❤</h3>
			                            <span class="label">New</span>
			                            <ul class="product__hover">
			                                <li><a onClick="zzimBtn(${item.no}, '${item.name}')"><img src="${context}/resources/theme/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
			                                <li><a href="#"><img src="${context}/resources/theme/img/icon/compare.png" alt=""> <span>상품비교</span></a></li>
			                                <li><a href="${context}/product/detail/${item.mainCategory}/${item.categoryproductNo}/${item.brandNo}/${item.no}"><img src="${context}/resources/theme/img/icon/search.png" alt=""><span>상세보기</span></a></li>
			                            </ul>
		                        	</div>
		            				<div class="product__item__text">
			                            <h6>${item.name}</h6>
			                            <h5><fmt:formatNumber value="${item.price}" pattern="#,###" />원</h5>
			                        </div>
		            			</div>
		                	</div>
		            	</c:forEach>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
    </section>

    <!-- Instagram Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <a href="#" onclick="return false;" class="instagram__pic__item set-bg" data-setbg="${context}/resources/index/images/insta/instaimg1.jpg"></a>
                        <a href="#" onclick="return false;" class="instagram__pic__item set-bg" data-setbg="${context}/resources/index/images/insta/instaimg2.jpg"></a>
                        <a href="#" onclick="return false;" class="instagram__pic__item set-bg" data-setbg="${context}/resources/index/images/insta/instaimg3.jpg"></a>
                        <a href="#" onclick="return false;" class="instagram__pic__item set-bg" data-setbg="${context}/resources/index/images/insta/instaimg4.jpg"></a>
                        <a href="#" onclick="return false;" class="instagram__pic__item set-bg" data-setbg="${context}/resources/index/images/insta/instaimg5.jpg"></a>
                        <a href="#" onclick="return false;" class="instagram__pic__item set-bg" data-setbg="${context}/resources/index/images/insta/instaimg6.jpg"></a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="instagram__text">
                    	<div class="row">
                        	<img src="${context}/resources/index/images/instaLogo.png" style="width:70px;object-fit:cover"/><h2 class="mt-3">Instagram</h2>
                        </div>
                        <p></p>
                        <a href="https://www.instagram.com/the_hyundai/" style="color:red" target='_blank'># 현대백화점 공식 계정 바로가기</a><i class="far fa-hand-point-left"></i>
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



