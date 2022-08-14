<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="<c:url value = "asset/plugins/fontawesome-free/css/all.min.css"/>">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="asset/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="asset/footer.css">
    <link rel="stylesheet" type="asset/text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body class="hold-transition dark-mode sidebar-mini">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-dark navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i
                            class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="{{route('Adhome')}}" class="nav-link">Home</a>
                </li>
                
            </ul>
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search -->
                <li class="nav-item">
                    <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                        <i class="fas fa-search"></i>
                    </a>
                    <div class="navbar-search-block">
                        <form class="form-inline">
                            <div class="input-group input-group-sm">
                                <input class="form-control form-control-navbar" type="search" placeholder="Search"
                                    aria-label="Search">
                                <div class="input-group-append">
                                    <button class="btn btn-navbar" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                    <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>

                <!-- Messages Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="far fa-comments"></i>
                        <span class="badge badge-danger navbar-badge">${sessionScope.support.size()}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <c:forEach var="item" items="${sessionScope.support }" >	

                        <a href="#" class="dropdown-item">
                            <!-- Message Start -->
                            <div class="media">
                                <img src="asset/images/avatar/${item.img}" alt="User Avatar"
                                    class="img-size-50 mr-3 img-circle">
                                <div class="media-body">
                                    <h3 class="dropdown-item-title">
                                        ${item.user_name}
                                        <span class="float-right text-sm text-danger"><i
                                                class="fas fa-star"></i></span>
                                    </h3>
                                    <p class="text-sm">${item.mess}</p>
                                    <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i>${item.date}</p>
                                </div>
                            </div>
                            <!-- Message End -->
                        </a>
                        <div class="dropdown-divider"></div>
                        </c:forEach>
                        
                        <a href="#" class="dropdown-item dropdown-footer">View all messages</a>
                    </div>
                </li>
                <!-- Notifications Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="far fa-bell"></i>
                        <span class="badge badge-warning navbar-badge">${sessionScope.support.size()}</span>
                    </a>
                    
                </li> 

            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="{{route('login')}}" class="brand-link"
                style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <img id="logoutImg" src="asset/dist/img/team.png" style="width: 100px; ">
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex"
                    style="display: flex; flex-direction: column; justify-content: center; align-items: center;">

                    <img src="asset/dist/img/ad.jpg" style="width: 50px; border-radius: 50%;">


                    <a href="#" style="margin-top: 5px; margin-bottom: -10px;">Admin Kiet<i
                            style="color: #00A7FB; font-size: 13px; position: absolute; top: 61px; left: 157px;"
                            class="far fa-check-circle"></i></a>

                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
                   with font-awesome or any other icon font library -->
                        <li class="nav-item menu-open">
                     
							<c:if test="${page == 'quanli1' && page == 'quanli2'}" var="condition">
							    <a href="#" class="nav-link active">
							</c:if>
							<c:if test="${!condition}">
							    <a href="#" class="nav-link">
							</c:if>
							
                            <!-- @if ($page == 'quanli1' && $page == 'quanli2')
                                <a href="#" class="nav-link active">
                                @else
                                    <a href="#" class="nav-link">
                            @endif -->

                            <i class="nav-icon fab fa-accusoft"></i>
                            <p>
                                Information Manage
                                <i class="right fas fa-angle-left"></i>
                            </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <c:if test="${page == 'quanli1'}" var="condition">                              
                                        <a href="<c:url value="/admin/usermng" />" class="nav-link"
                                            style="margin-left: 20px; width: 214px; color: rgba(46, 255, 255, 1);">
                                    </c:if>
									<c:if test="${!condition}">
                                        <a href="<c:url value="/admin/usermng" />" class="nav-link"
                                            style="margin-left: 20px; width: 214px;">
                                    </c:if>

                                    <i class="nav-icon fas fa-user-graduate"></i>
                                    <p>User</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <c:if test="${page == 'quanli2'}" var="condition">  
                                    <a href="<c:url value="/admin/revenuemng" />" class="nav-link"
                                        style="margin-left: 20px; width: 214px; color: rgba(46, 255, 255, 1);">
                                    </c:if>
									<c:if test="${!condition}">
                                    <a href="<c:url value="/admin/revenuemng" />" class="nav-link"
                                        style="margin-left: 20px; width: 214px;">
                                    </c:if>
                                        <i class="nav-icon fas fa-coins"></i>
                                        <p>Revenue</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <c:if test="${page == 'qlproduct'}" var="condition">
                            	<a href="<c:url value="/admin/product" />" class="nav-link active">
                            </c:if>
							<c:if test="${!condition}">
                            <a href="<c:url value="/admin/product" />" class="nav-link">
                            </c:if>
                                <i class="nav-icon fas fa-book-open"></i>
                                <p>Product Manager</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            
                            <c:if test="${page == 'qlstaff'}" var="condition">
                            <a href="<c:url value="/admin/staff" />" class="nav-link active">
                            </c:if>
							<c:if test="${!condition}">
                            <a href="<c:url value="/admin/staff" />" class="nav-link">
                            </c:if>
                                <i class="nav-icon far fa-paper-plane"></i>
                                <p>Staff Manager</p>
                            </a>
                        </li>

                        <li class="nav-item">
                        
                            <c:if test="${page == 'qlblog'}" var="condition">
                            <a href="<c:url value="/admin/blog" />" class="nav-link active">
                            </c:if>
							<c:if test="${!condition}">
                            <a href="<c:url value="/admin/blog" />" class="nav-link">
                            </c:if>
                                <i class="nav-icon fas fa-copy"></i>
                                <p>
                                    Blog Manager
                                </p>
                            </a>

                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>



        <decorator:body />



        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->

        <!-- Main Footer -->
        <!-- <footer class="main-footer">
    
  </footer> -->
        <footer class="footer">
            <div class="container">
                <div class="row">

                    <div class="footer-col">

                        <h4>STeam</h4>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Service</a></li>
                            <li><a href="#">Security</a></li>
                            <li><a href="#">Link</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Sponsor</h4>
                        <ul>
                            <li><a href="#"><img style="width: 50px" src="asset/footer/vku.png"></a>
                            </li>
                            <li><a href="#"><img style="width: 50px" src="asset/footer/fpt.png"></a>
                            </li>
                            <li><a href="#"><img style="width: 50px" src="asset/footer/apple.png"></a>
                            </li>
                            <li><a href="#"><img style="width: 50px" src="asset/footer/nasa.png"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Product</h4>
                        <ul>
                            <li><a href="#">Camera</a></li>
                            <li><a href="#">Lights</a></li>
                            <li><a href="#">Air Conditioning</a></li>
                            <li><a href="#">Fridge</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Follow</h4>
                        <div class="social-links">
                            <a href="#"><i style="color:  #0067EE" class="fab fa-facebook-f"></i></a>
                            <a href="#"><i style="color:  #009523" class="fab fa-twitter"></i></a>
                            <a href="#"><i style="color:  #FF0000" class="fab fa-instagram"></i></a>
                            <a href="#"><i style="color:  #D87205" class="fab fa-youtube"></i></a>
                        </div>

                        <img src="asset/team.png" style="width: 100px; margin-top: 20px">

                    </div>
                </div>
            </div>
        </footer><!-- End Footer -->
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED SCRIPTS -->

    <!-- jQuery -->
    <script src="asset/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="asset/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="asset/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="asset/dist/js/adminlte.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- PAGE PLUGINS -->
    <!-- jQuery Mapael -->
    <script src="asset/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
    <script src="asset/plugins/raphael/raphael.min.js"></script>
    <script src="asset/plugins/jquery-mapael/jquery.mapael.min.js"></script>
    <script src="asset/plugins/jquery-mapael/maps/usa_states.min.js"></script>
    <!-- ChartJS -->
    <script src="asset/plugins/chart.js/Chart.min.js"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="asset/dist/js/demo.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="asset/dist/js/pages/dashboard2.js"></script>
    <script src="asset/dist/js/pages/dashboard3.js"></script>
	<script src="asset/dist/js/staff.js"></script>
	<script src="asset/dist/js/auth.js"></script>
	
	
    
</body>

</html>
