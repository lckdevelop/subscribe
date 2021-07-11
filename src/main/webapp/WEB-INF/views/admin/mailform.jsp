<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>현대백화점 브랜드 관리자 메일 전송</title>

    <!-- Custom fonts for this template-->
    <link href="${context}/resources/theme/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" 
          rel="stylesheet">
    <link href="${context}/resources/theme/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${context}/resources/theme/css/mailform.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/2.0.0/toastui-editor.min.css" />
	<link rel="stylesheet"
    	  href="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight.min.css"/>
	<link href="https:////cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

</head>

<body id="page-top">
    <header class="header">
    	<jsp:include page="/WEB-INF/views/home/header1.jsp" flush="false" />
    </header>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./">
                <div class="sidebar-brand-text mx-3">${brandInfo.engname}</div>
            </a>

            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="./">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>매출 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="./sales">매출 관리</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-gift"></i>
                    <span>상품 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="#">상품 관리</a>
                    </div>
                </div>
            </li>
            
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSubscribe"
                    aria-expanded="true" aria-controls="collapseSubscribe">
                    <i class="fas fa-fw fa-bookmark"></i>
                    <span>구독 관리</span>
                </a>
                <div id="collapseSubscribe" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="./coupon">쿠폰 관리</a>
                        <a class="collapse-item" href="./mailform">메일 발송</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseReservation"
                    aria-expanded="true" aria-controls="collapseReservation">
                    <i class="fas fa-fw fa-calendar-alt"></i></i>
                    <span>예약 관리</span>
                </a>
                <div id="collapseReservation" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="./reserve">예약 관리</a>
                        <a class="collapse-item" href="./pickup">픽업 관리</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form action="reserve" method="POST"
                          class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="예약 현황 검색..."
                                aria-label="search" aria-describedby="basic-addon2" id="searchbar" name="search" value="${search}">
                            <div class="input-group-append">
                                <button class="btn btn-secondary" type="submit">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">구독자 대상 메일 발송</h1>
                        <p><i class="fas fa-address-book"></i> 구독자 <b>${subsCnt}명</b>에게 발송</p>
                    </div>

                    <div class="row">
						<form method="POST" id="email-form">
							<input type="text" id="subject" name="subject" placeholder="제목을 입력해주세요." required="required"/>
							<textarea id="submit-content" name="content" style="display:none"></textarea>
						</form>
						<div id="editor"></div>
						<button id="submit-btn" 
						        class="btn btn-success align1" 
						        data-toggle="modal" 
						        data-target="#submitCompleteModal">전송</button>
						
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; KOSA 현대IT&E 채용 확정형 교육 2021</span><br><br>
                        <span>강현구, 윤예빈, 이채경, 홍민석</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    <!-- Submit Complete Modal-->
    <div class="modal fade" id="submitCompleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">메일을 전송합니다!</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">부적절하거나 방침에 어긋나는 내용의 메일 발송시 처벌 받을 수 있습니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <button class="btn btn-success" onclick="clickSubmit()">전송</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Core plugin JavaScript-->
    <script src="${context}/resources/theme/js/jquery-3.3.1.min.js"></script>
    <script src="${context}/resources/theme/js/bootstrap.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.easing.min.js"></script>
    <script src="${context}/resources/theme/js/sb-admin-2.min.js"></script>
    <script src="https://uicdn.toast.com/editor/2.0.0/toastui-editor-all.min.js"></script>
    <script src="${context}/resources/theme/js/mailform.js"></script>
    <script src="${context}/resources/theme/js/receive-notice.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</body>

</html>