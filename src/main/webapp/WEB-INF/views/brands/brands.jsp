<%@page import="dev.department.subscribe.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="notSubscribedBrands" value="${notSubscribedBrands}" />
<c:set var="subscribedBrands" value="${subscribedBrands}" />
<!DOCTYPE html>
<html lang="zxx">
<%
MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
%>

<head>
<script type="text/javascript">
	function brandPage(brandNo){
		location.href="brands/brandpage/"+brandNo+"/all";
	}
	
	function drag(target, brand) { //드래그 시작시 호출 할 함수
		brand.dataTransfer.setData('Text', target.id);
	};
	
	function drop(target, brand) { //드롭시 호출 할 함수
		var id = brand.dataTransfer.getData('Text');
		
		
		if(target.getAttribute('id')=="allBrands"){
			$.ajax({
				url : '${context}/brands/delete/subscribe',
		        type : 'POST',
		        data : 
		        	{
		        	'brandNo' : id
		       		},
		        success : function(data) {
		        	target.appendChild(document.getElementById(id));
		    		brand.preventDefault();
		        }
			});
		}
		
		if(target.getAttribute('id')=="subscribedBrands"){
			$.ajax({
				url : '${context}/brands/insert/subscribe',
		        type : 'POST',
		        data : 
		        	{
		        	'brandNo' : id
		       		},
		        success : function(data) {
		        	target.appendChild(document.getElementById(id));
		    		brand.preventDefault();
		        }
			});
		}
	};
</script>

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

    
    <!-- Product Section Begin -->
	<section class="brands spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="row justify-content-center">
						<span class="h4">전체 브랜드</span>
						<div class="col-lg-12 all-brand mt-3" id="allBrands" ondrop="drop(this, event);" ondragenter="return false;" ondragover="return false;">
								<c:forEach items="${notSubscribedBrands}" var="brand">
									<div class="brand-list" id="${brand.no}" draggable="true" ondragstart="drag(this, event)">
										<div class="brand-image"  onclick="brandPage(${brand.no})">
											<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand/${brand.engname}.jpg">
										</div>	
										<div class="brand-logo">
											<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-logo/${brand.engname}.jpg">
										</div>	
									</div>
								</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="row justify-content-center">
						<span class="h4">구독중</span>
						<div class="col-lg-12 subs-brand mt-3" id="subscribedBrands" ondrop="drop(this, event);" ondragenter="return false;" ondragover="return false;">
							<c:forEach items="${subscribedBrands}" var="brand">
								<div class="brand-list" id="${brand.no}" draggable="true" ondragstart="drag(this, event)">
										<div class="brand-image"  onclick="brandPage(${brand.no})">
											<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand/${brand.engname}.jpg">
										</div>	
										<div class="brand-logo">
											<img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-logo/${brand.engname}.jpg">
										</div>	
									</div>	
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Product Section End -->

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