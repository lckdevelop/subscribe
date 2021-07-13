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
    <link rel="stylesheet" href="${context}/resources/brands/css/form.css" type="text/css">
     <!-- Js Plugins -->
    <script src="${context}/resources/theme/js/jquery-3.3.1.min.js"></script>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
                              
                                <style>

.container-fluid {
    padding-top: 120px !important;
    padding-bottom: 120px !important
}

.card {
    box-shadow: 0px 4px 8px 0px #7986CB
}

input {
    padding: 10px 20px !important;
    border: 1px solid #000 !important;
    border-radius: 10px;
    box-sizing: border-box;
    background-color: #616161 !important;
    color: #fff !important;
    font-size: 16px;
    letter-spacing: 1px;
    width: 180px
}

input:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #512DA8;
    outline-width: 0
}

::placeholder {
    color: #fff;
    opacity: 1
}

:-ms-input-placeholder {
    color: #fff
}

::-ms-input-placeholder {
    color: #fff
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0
}

.datepicker {
    background-color: #000 !important;
    color: #fff !important;
    border: none;
    padding: 10px !important
}

.datepicker-dropdown:after {
    border-bottom: 6px solid #000
}

thead tr:nth-child(3) th {
    color: #fff !important;
    font-weight: bold;
    padding-top: 20px;
    padding-bottom: 10px
}

.dow,
.old-day,
.day,
.new-day {
    width: 40px !important;
    height: 40px !important;
    border-radius: 0px !important
}

.old-day:hover,
.day:hover,
.new-day:hover,
.month:hover,
.year:hover,
.decade:hover,
.century:hover {
    border-radius: 6px !important;
    background-color: #eee;
    color: #000
}

.active {
    border-radius: 6px !important;
    background-image: linear-gradient(#90CAF9, #64B5F6) !important;
    color: #000 !important
}

.disabled {
    color: #616161 !important
}

.prev,
.next,
.datepicker-switch {
    border-radius: 0 !important;
    padding: 20px 10px !important;
    text-transform: uppercase;
    font-size: 20px;
    color: #fff !important;
    opacity: 0.8
}

.prev:hover,
.next:hover,
.datepicker-switch:hover {
    background-color: inherit !important;
    opacity: 1
}

.cell {
    border: 1px solid #BDBDBD;
    margin: 2px;
    cursor: pointer
}

.cell:hover {
    border: 1px solid #3D5AFE
}

.cell.select {
    background-color: #3D5AFE;
    color: #fff
}

.fa-calendar {
    color: #fff;
    font-size: 30px;
    padding-top: 8px;
    padding-left: 5px;
    cursor: pointer
}</style>
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
    
	    <div class="container">
	      <div class="row align-items-stretch no-gutters contact-wrap">
	        <div class="col-md-8">
	          <div class="form h-100">
	            <h3>브랜드 방문 예약</h3>
	            <form class="mb-5" method="post" id="contactForm" name="contactForm">
	              <div class="row">
	                <div class="col-md-12 form-group mb-5">
	                  <label for="message" class="col-form-label">지점 선택</label><br>
	                  <select id="deptselect">
				            <option value="1">더현대 서울</option>
				            <option value="2">압구정 본점</option>
				            <option value="3">판교점</option>
				            <option value="4">무역센터점</option>
				            <option value="5">중동점</option>
				            <option value="6">신촌점</option>
				            <option value="7">킨텍스점</option>
				            <option value="8">천호점</option>
				      </select>
	                </div>
	              </div>
	              <div class="row">
	                <div class="col-md-12 form-group mb-5">
	                  <label for="message" class="col-form-label">메모</label>
	                  <textarea class="form-control" name="message" id="message" cols="30" rows="4"  placeholder="방문 사유를 입력하세요."></textarea>
	                </div>
	              </div>
	              <div class="row">
	                <div class="col-md-12 form-group mb-5">
	                  <label for="message" class="col-form-label">예약 날짜 / 시간 선택</label><br><br>
					    <div class="row justify-content-center mx-0">
					        <div class="col-lg-12">
					            <div class="card border-0">
					                <form autocomplete="off">
					                    <div class="card-header bg-dark">
					                        <div class="mx-0 mb-0 row justify-content-sm-center justify-content-start px-1"> <input type="text" id="dp1" class="datepicker" placeholder="방문 날짜 선택" name="date" readonly><span class="fa fa-calendar"></span> </div>
					                    </div>
					                    <div class="card-body p-3 p-sm-5">
					                        <div class="row text-center mx-0">
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">09:00</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">09:30</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">09:45</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">10:00</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">10:30</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">10:45</div>
					                            </div>
					                        </div>
					                        <div class="row text-center mx-0">
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">11:00</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">11:30</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">11:45</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">12:00</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">12:30</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">12:45</div>
					                            </div>
					                        </div>
					                        <div class="row text-center mx-0">
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">13:00</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">13:30</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">13:45</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">14:00</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">14:30</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">14:45</div>
					                            </div>
					                        </div>
					                        <div class="row text-center mx-0">
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">15:00</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">15:30</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">16:15</div>
					                            </div>
					                            <div class="col-md-2 col-4 my-1 px-2">
					                                <div class="cell py-1">17:00</div>
					                            </div>
					                        </div>
					                    </div>
					                </form>
					            </div>
					        </div>
					    </div>
					</div>
	                </div>
	              <div  class="col-md-12 form-group mb-5">
	              <div class="row justify-content-center mx-0">
	                <div style="text-align: center">
	                   <button class="btn btn-outline-dark" data-toggle="modal" data-target="#reservebtn" onclick="sendToAdminReserve()">예약하기</button>
	                </div>
	              </div>
	              </div>
	              <div class="modal fade" id="reservebtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							      <div class="modal-dialog modal-dialog-centered" role="document">
							        <div class="modal-content rounded-0">
							          <div class="modal-body p-4 px-5">
							
							            
							            <div class="main-content text-center">
							                
							                <div class="warp-icon mb-4">
							                  <img src="${context}/resources/custom/img/checkicon.png" style="height: 50px; width: 50px; margin-top: 15px" class="img-fluid">
							                </div>
							                  <label>방문 예약이 확인되었습니다.</label>
							                  <div class="d-flex">
							                    <div class="mx-auto">
							                    <button class="btn btn-outline-dark"><a href="/subscribe/brands/brandpage/${brandInfo.no}/all" style="color: black">확인</a></button>
							                    </div>
							                  </div>
							            </div>
							
							          </div>
							        </div>
							      </div>
							    </div>
	            </form>
	          </div>
	        </div>
	        <div class="col-md-4">
	          <div class="contact-info h-100">
	            <ul class="list-unstyled">
	              <li class="d-flex">
	                <span class="wrap-icon icon-room mr-3"></span>
	                <span class="text"><img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand-logo/${brandInfo.engname}.jpg" ></span>
	              </li>
	            </ul>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	     
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
    <input type="hidden" id="brandNo" name="brandNo" value="${brandInfo.no}">

<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
<script type='text/javascript'>
$(document).ready(function(){
$('.datepicker').datepicker({
format: 'yyyy-mm-dd',
autoclose: true,
startDate: '0d'
});

$('.cell').click(function(){
$('.cell').removeClass('select');
$(this).addClass('select');
console.log($('#deptselect').val());
console.log($('#message').val());
console.log(${brandInfo.no});
let datetime = $('#dp1').val() + " " + $(this).text();
console.log($('#dp1').val() + " " + $(this).text());
$.ajax({
	method : 'GET',
	url : '${pageContext.request.contextPath}/brands/reservationform/action/'+ $('#deptselect').val() + '/' + $('#message').val() + '/' + datetime + '/' + ${brandInfo.no}
});
});
});</script>
	<script src="${context}/resources/theme/js/bootstrap.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.nice-select.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.nicescroll.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.magnific-popup.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.countdown.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.slicknav.js"></script>
    <script src="${context}/resources/theme/js/mixitup.min.js"></script>
    <script src="${context}/resources/theme/js/owl.carousel.min.js"></script>
    <script src="${context}/resources/theme/js/main.js"></script>
    <script src="${context}/resources/theme/js/send-notice.js"></script>
</body>
</html>