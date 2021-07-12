<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
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
    <link rel="stylesheet" href="${context}/resources/custom/css/brandnewsstyle.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/custom/css/colors.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/custom/css/responsive.css" type="text/css">
     <!-- Js Plugins -->
    <script src="${context}/resources/theme/js/jquery-3.3.1.min.js"></script>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
                              
                             
</head>
<body oncontextmenu='return false' class='snippet-body'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
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
    </section>
    <!-- Breadcrumb Section End -->

     
     <div class="content">
    	 <section class="section first-section"><br>
            <div class="container-fluid">
                <div class="masonry-blog clearfix">
                    <div class="left-side">
                        <div class="masonry-box post-media">
                             <img src="${image[0]}" alt="" class="img-fluid">
                             <div class="shadoweffect">
                                <div class="shadow-desc">
                                    <div class="blog-meta">
                                        <span class="bg-aqua"><a href="blog-category-01.html" title="">${date[0]}</a></span><br>
                                        <h4><a href="#" title="">${title[0]}</a></h4>
                                    </div><!-- end meta -->
                                </div><!-- end shadow-desc -->
                            </div><!-- end shadow -->
                        </div><!-- end post-media -->
                    </div><!-- end left-side -->

                    <div class="center-side">
                        <div class="masonry-box post-media">
                             <img src="${image[1]}" alt="" class="img-fluid">
                             <div class="shadoweffect">
                                <div class="shadow-desc">
                                    <div class="blog-meta">
                                        <span class="bg-green"><a href="blog-category-01.html" title="">${date[1]}</a></span>
                                        <h4><a href="#" title="">${title[1]}</a></h4>
                                    </div><!-- end meta -->
                                </div><!-- end shadow-desc -->
                            </div><!-- end shadow -->
                        </div><!-- end post-media -->

                        <div class="masonry-box small-box post-media">
                             <img src="${image[2]}" alt="" class="img-fluid">
                             <div class="shadoweffect">
                                <div class="shadow-desc">
                                    <div class="blog-meta">
                                        <h4><a href="#" title="">${title[2]}</a></h4>
                                    </div><!-- end meta -->
                                </div><!-- end shadow-desc -->
                            </div><!-- end shadow -->
                        </div><!-- end post-media -->

                        <div class="masonry-box small-box post-media">
                             <img src="${image[3]}" alt="" class="img-fluid">
                             <div class="shadoweffect">
                                <div class="shadow-desc">
                                    <div class="blog-meta">
                                        <h4><a href="#" title="">${title[3]}</a></h4>
                                    </div><!-- end meta -->
                                </div><!-- end shadow-desc -->
                            </div><!-- end shadow -->
                        </div><!-- end post-media -->
                    </div><!-- end left-side -->

                    <div class="right-side hidden-md-down">
                        <div class="masonry-box post-media">
                             <img src="${image[4]}" alt="" class="img-fluid">
                             <div class="shadoweffect">
                                <div class="shadow-desc">
                                    <div class="blog-meta">
                                        <span class="bg-aqua"><a href="blog-category-01.html" title="">${date[4]}</a></span>
                                        <h4><a href="#" title="">${title[4]}</a></h4>
                                    </div><!-- end meta -->
                                </div><!-- end shadow-desc -->
                             </div><!-- end shadow -->
                        </div><!-- end post-media -->
                    </div><!-- end right-side -->
                </div><!-- end masonry -->
            </div>
        </section>

        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h3 class="color-aqua"><a href="#" title="">ISSUE</a></h3>
                        </div><!-- end title -->

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="blog-box">
                                    <div class="post-media">
                                            <img src="${image[5]}" alt="" class="img-fluid">
                                            <div class="hovereffect">
                                                <span></span>
                                            </div><!-- end hover -->
                                    </div><!-- end media -->
                                    <div class="blog-meta big-meta">
                                        <h4>${title[5]}</h4>
                                        <p>${content[5]}</p>
                                        <small>${date[5]}</small>
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">

                                <div class="blog-box"><br>
                                    <div class="post-media">
                                            <img src="${image[6]}" alt="" class="img-fluid">
                                            <div class="hovereffect">
                                                <span></span>
                                            </div><!-- end hover -->
                                    </div><!-- end media -->
                                    <div class="blog-meta big-meta">
                                        <h4>${title[6]}</h4>
                                        <p>${content[6]}</p>
                                        <small>${date[6]}</small>
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->
                            </div><!-- end col -->
                        </div><!-- end row -->
                    </div><!-- end col -->

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h3 class="color-pink"><a href="#" title="">Fashion</a></h3>
                        </div><!-- end title -->
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="blog-box">
                                    <div class="post-media">
                                            <img src="${image[7]}" alt="" class="img-fluid">
                                            <div class="hovereffect">
                                                <span></span>
                                            </div><!-- end hover -->
                                    </div><!-- end media -->
                                    <div class="blog-meta">
                                        <h4>${title[7]}</h4>
                                        <p style="font-size: 10px">${content[7]}</p>
                                        <small>${date[7]}</small>
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">

                                <div class="blog-box">
                                    <div class="post-media">
                                            <img src="${image[8]}" alt="" class="img-fluid">
                                            <div class="hovereffect">
                                                <span></span>
                                            </div><!-- end hover -->
                                    </div><!-- end media -->
                                    <div class="blog-meta">
                                        <h4>${title[8]}</h4>
                                        <p style="font-size: 10px">${content[8]}</p>
                                        <small>${date[8]}</small>
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->
                            </div><!-- end col -->

                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="blog-box">
                                    <div class="post-media">
                                            <img src="${image[9]}" alt="" class="img-fluid">
                                            <div class="hovereffect">
                                                <span></span>
                                            </div><!-- end hover -->
                                    </div><!-- end media -->
                                    <div class="blog-meta">
                                        <h4>${title[9]}</h4>
                                        <p style="font-size: 10px">${content[9]}</p>
                                        <small>${date[9]}</small>
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">

                                <div class="blog-box">
                                    <div class="post-media">
                                            <img src="${image[10]}" alt="" class="img-fluid">
                                            <div class="hovereffect">
                                                <span></span>
                                            </div><!-- end hover -->
                                    </div><!-- end media -->
                                    <div class="blog-meta">
                                        <h4>${title[10]}</h4>
                                        <p style="font-size: 10px">${content[10]}</p>
                                        <small>${date[10]}</small>
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->
                            </div><!-- end col -->
                            
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="blog-box"><br>
                                    <div class="post-media">
                                            <img src="${image[11]}" alt="" class="img-fluid">
                                            <div class="hovereffect">
                                                <span></span>
                                            </div><!-- end hover -->
                                    </div><!-- end media -->
                                    <div class="blog-meta">
                                        <h4>${title[11]}</h4>
                                        <p style="font-size: 10px">${content[11]}</p>
                                        <small>${date[11]}</small>
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">
                            </div><!-- end col -->
                        </div><!-- end row -->
                    </div><!-- end col -->
                </div><!-- end row -->

                <hr class="invis1">

                <div class="row">
                    <div class="col-lg-9">
                        <div class="blog-list clearfix">
                            <div class="section-title">
                                <h3 class="color-green"><a href="#" title="">HOT</a></h3>
                            </div><!-- end title -->

                            <div class="blog-box row">
                                <div class="col-md-4">
                                    <div class="post-media">
                                            <img src="${image[12]}" alt="" class="img-fluid">
                                            <div class="hovereffect"></div>
                                    </div><!-- end media -->
                                </div><!-- end col -->

                                <div class="blog-meta big-meta col-md-8">
                                    <h4>${title[12]}</h4>
                                    <p>${content[12]}</p>
                                    <small>${date[12]}</small>
                                </div><!-- end meta -->
                            </div><!-- end blog-box -->

                            <hr class="invis">

                            <div class="blog-box row">
                                <div class="col-md-4">
                                    <div class="post-media">
                                            <img src="${image[13]}" alt="" class="img-fluid">
                                            <div class="hovereffect"></div>
                                    </div><!-- end media -->
                                </div><!-- end col -->

                                <div class="blog-meta big-meta col-md-8">
                                    <h4>${title[13]}</h4>
                                    <p>${content[13]}</p>
                                    <small>${date[13]}</small>
                                </div><!-- end meta -->
                            </div><!-- end blog-box -->

                            <hr class="invis">

                            <div class="blog-box row">
                                <div class="col-md-4">
                                    <div class="post-media">
                                            <img src="${image[14]}" alt="" class="img-fluid">
                                            <div class="hovereffect"></div>
                                    </div><!-- end media -->
                                </div><!-- end col -->

                                <div class="blog-meta big-meta col-md-8">
                                    <h4>${title[14]}</h4>
                                    <p>${content[14]}</p>
                                    <small>${date[14]}</small>
                                </div><!-- end meta -->
                            </div><!-- end blog-box -->
                        </div><!-- end blog-list -->

                        <hr class="invis">
                    </div><!-- end col -->

                    <div class="col-lg-3">
                        <div class="section-title">
                            <h3 class="color-yellow"><a href="#" title="">NEW</a></h3>
                        </div><!-- end title -->

                        <div class="blog-box">
                            <div class="post-media">
                                    <img src="${image[15]}" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span class="videohover"></span>
                                    </div><!-- end hover -->
                            </div><!-- end media -->
                            <div class="blog-meta">
                                <h4>${title[15]}</h4>
                                <small>${date[15]}</small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->

                        <hr class="invis">

                        <div class="blog-box">
                            <div class="post-media">
                                    <img src="${image[16]}" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span class="videohover"></span>
                                    </div><!-- end hover -->
                            </div><!-- end media -->
                            <div class="blog-meta">
                                <h4>${title[16]}</h4>
                                <small>${date[16]}</small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->

                        <hr class="invis">

                        
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>

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