<%@page import="SmartKa.Constants.Constant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Urdan - Minimal eCommerce HTML Template</title>
<meta name="robots" content="noindex, follow" />
<meta name="description"
	content="Urdan Minimal eCommerce Bootstrap 5 Template is a stunning eCommerce website template that is the best choice for any online store.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="https://gmpg.org/xfn/11">
<link rel="canonical"
	href="https://htmldemo.hasthemes.com/urdan/index.html" />

<!-- Open Graph (OG) meta tags are snippets of code that control how URLs are displayed when shared on social media  -->
<meta property="og:locale" content="en_US" />
<meta property="og:type" content="website" />
<meta property="og:title"
	content="Urdan - Minimal eCommerce HTML Template" />
<meta property="og:url"
	content="https://htmldemo.hasthemes.com/urdan/index.html" />
<meta property="og:site_name"
	content="Urdan - Minimal eCommerce HTML Template" />
<!-- For the og:image content, replace the # with a link of an image -->
<meta property="og:image" content="#" />
<meta property="og:description"
	content="Urdan Minimal eCommerce Bootstrap 5 Template is a stunning eCommerce website template that is the best choice for any online store." />
<!-- Add site Favicon -->
<link rel="icon" href="assets/images/favicon/cropped-favicon-32x32.png"
	sizes="32x32" />
<link rel="icon"
	href="assets/images/favicon/cropped-favicon-192x192.png"
	sizes="192x192" />
<link rel="apple-touch-icon"
	href="assets/images/favicon/cropped-favicon-180x180.png" />
<meta name="msapplication-TileImage"
	content="assets/images/favicon/cropped-favicon-270x270.png" />

<!-- All CSS is here
		============================================ -->
<link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/vendor/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="assets/css/vendor/themify-icons.css" />
<link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/plugins/animate.css" />
<link rel="stylesheet" href="assets/css/plugins/aos.css" />
<link rel="stylesheet" href="assets/css/plugins/magnific-popup.css" />
<link rel="stylesheet" href="assets/css/plugins/swiper.min.css" />
<link rel="stylesheet" href="assets/css/plugins/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/plugins/nice-select.css" />
<link rel="stylesheet" href="assets/css/plugins/select2.min.css" />
<link rel="stylesheet" href="assets/css/plugins/easyzoom.css" />
<link rel="stylesheet" href="assets/css/plugins/slinky.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<style type="text/css">
.imgAvt {
	width: 22%;
	position: absolute;
	top: 16%;
	left: 39%;
	border-radius: 50%;
	z-index: 1;
}

.formAvt {
	z-index: 2;
	position: absolute;
	left: 47%;
	top: 88%;
	border-radius: 50%;
}

.divUpdate {
	visibility: hidden;
}

.formAvt:hover .divUpdate {
	visibility: visible;
}

.lblUpdate {
	border: 2px solid #000000;
	padding: 5px;
	border-radius: 5px;
	background-color: #ffffff
}
</style>
<style>
.button-a-hover:hover {
	color: white
}

#countries-list, #states-list {
	padding: 2px 16px;
	height: 52px;
}

#countries-list>option, #states-list>option {
	height: 52px;
}

.input-checkout {
	padding: 2px 16px;
	height: 52px;
	border: none;
	outline: none;
	height: 52px;
}

.input-checkout:focus {
	border: none;
	outline: none;
}
</style>
</head>
<body>
	<div class="main-wrapper main-wrapper-2">
		<header class="header-area header-responsive-padding header-height-1">
			<div class="header-top d-none d-lg-block bg-gray">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-6 col-6">
							<div class="welcome-text">
								<%
								String helloMessage = null;
								if (session.getAttribute("username") != null) {
									helloMessage = "Hello " + session.getAttribute("username");
								} else {
									helloMessage = "Welcome to our website";
								}
								%>
								<p><%=helloMessage%></p>
							</div>
						</div>
						<div class="col-lg-6 col-6">
							<div class="language-currency-wrap">
								<div class="currency-wrap border-style">
									<a class="currency-active" href="#">$ Dollar (US) <i
										class=" ti-angle-down "></i></a>
									<div class="currency-dropdown">
										<ul>
											<li><a href="#">Taka (BDT) </a></li>
											<li><a href="#">Riyal (SAR) </a></li>
											<li><a href="#">Rupee (INR) </a></li>
										</ul>
									</div>
								</div>
								<div class="language-wrap">
									<a class="language-active" href="#"><img
										src="assets/images/icon-img/flag.png" alt=""> English <i
										class=" ti-angle-down "></i></a>
									<div class="language-dropdown">
										<ul>
											<li><a href="#"><img
													src="assets/images/icon-img/flag.png" alt="">English
											</a></li>
											<li><a href="#"><img
													src="assets/images/icon-img/spanish.png" alt="">Spanish</a></li>
											<li><a href="#"><img
													src="assets/images/icon-img/arabic.png" alt="">Arabic
											</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="header-bottom sticky-bar">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-3 col-md-6 col-6">
							<div class="logo">
								<a href='<c:url value="/home" />'><img
									src="assets/images/logo/logo.png" alt="logo"></a>
							</div>
						</div>
						<div class="col-lg-6 d-none d-lg-block">
							<div class="main-menu text-center">
								<nav>
									<ul>
										<li><a href='<c:url value="/home" />'>HOME</a>
										<li><a href='<c:url value="/shop" />'>SHOP</a>
										<li><a href='<c:url value="/blog" />'>BLOG</a></li>
										<li><a href='<c:url value="/aboutus" />'>ABOUT</a></li>
										<li><a href='<c:url value="/contactus" />'>CONTACT US</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-6">
							<div class="header-action-wrap">
								<div class="header-action-style header-search-1">
									<a class="search-toggle" href="#"> <i
										class="pe-7s-search s-open"></i> <i
										class="pe-7s-close s-close"></i>
									</a>
									<div class="search-wrap-1">
										<form action="#">
											<input placeholder="Search products" type="text">
											<button class="button-search">
												<i class="pe-7s-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="header-action-style">
									<a
										title="
										<c:choose>
										    <c:when test="${sessionScope.username==null}">
										         Login Register
										    </c:when>    
										    <c:otherwise>
										        Profile
										    </c:otherwise>
										</c:choose>
									"
										href="
									<c:choose>
										    <c:when test="${sessionScope.username==null}">
										         <c:url value="/auth" />
										    </c:when>    
										    <c:otherwise>
										        <c:url value="/info" />
										    </c:otherwise>
										</c:choose>
									"><i
										class="pe-7s-user"></i></a>
								</div>
								<div class="header-action-style">
									<a title="Wishlist" href="wishlist.html"><i
										class="pe-7s-like"></i></a>
								</div>
								<div class="header-action-style header-action-cart">
									<a class="cart-active" href="#"><i class="pe-7s-shopbag"></i>
										<span id="totalCart"></span> </a>
								</div>
								<div class="header-action-style d-block d-lg-none">
									<a class="mobile-menu-active-button" href="#"><i
										class="pe-7s-menu"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- mini cart start -->
		<div class="sidebar-cart-active">
			<div class="sidebar-cart-all">
				<a class="cart-close" href="#"><i class="pe-7s-close"></i></a>
				<div class="cart-content">
					<h3>Shopping Cart</h3>
					<ul id="shoppingCart">
					</ul>
					<div class="cart-total">
						<h4>
							Subtotal: <span class="subTotal"></span>
						</h4>
					</div>
					<div class="cart-btn btn-hover">
						<a class="theme-color" href="<c:url value="/viewCart"/>">view
							cart</a>
					</div>
					<div class="checkout-btn btn-hover">
						<a class="theme-color" href="checkout.html">checkout</a>
					</div>
				</div>
			</div>
		</div>

		<decorator:body />

		<footer class="footer-area">
			<div class="bg-gray-2">
				<div class="container">
					<div class="footer-top pt-80 pb-35">
						<div class="row">
							<div class="col-lg-3 col-md-6 col-sm-6 col-12">
								<div class="footer-widget footer-about mb-40">
									<div class="footer-logo">
										<a href="index.html"><img
											src="assets/images/logo/logo.png" alt="logo"></a>
									</div>
									<p>Welcome to the Smartka smart home store, where you'll
										find great prices on a variety of smart products to automate
										your home?</p>
									<div class="payment-img">
										<a href="#"><img src="assets/images/icon-img/payment.png"
											alt="logo"></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-12">
								<div
									class="footer-widget footer-widget-margin-1 footer-list mb-40">
									<h3 class="footer-title">Page</h3>
									<ul>
										<li><a href='<c:url value="/home" />'>Home</a></li>
										<li><a href='<c:url value="/shop" />'>Shop</a></li>
										<li><a href='<c:url value="/blog" />'>Blog</a></li>
										<li><a href='<c:url value="/aboutus" />'>About us</a></li>
										<li><a href='<c:url value="/contactus" />'>Contact</a></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-2 col-md-6 col-sm-6 col-12">
								<div class="footer-widget footer-list mb-40">
									<h3 class="footer-title">My Accound</h3>
									<ul>
										<li><a href='<c:url value="/info" />'>My account</a></li>
										<li><a href='<c:url value="/info" />'>My information</a></li>
										<li><a href='<c:url value="/cart" />'>My cart</a></li>
										<li><a href='<c:url value="/checkout" />'> Checkout</a></li>
										<li><a href='<c:url value="/info" />'>Order history</a></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-sm-6 col-12">
								<div
									class="footer-widget footer-widget-margin-2 footer-address mb-40">
									<h3 class="footer-title">Get in touch</h3>
									<ul>
										<li><span>Address: </span>Da Nang city</li>
										<li><span>Telephone Enquiry:</span> (012) 345 6789</li>
										<li><span>Email: </span>Smartka@gmail.com</li>
									</ul>
									<div class="open-time">
										<p>
											Open : <span>8:00 AM</span> - Close : <span>22:00 PM</span>
										</p>
										<p>Always Open</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>


		<!-- Mobile Menu start -->
		<div class="off-canvas-active">
			<a class="off-canvas-close"><i class=" ti-close "></i></a>
			<div class="off-canvas-wrap">
				<div class="welcome-text off-canvas-margin-padding">
					<p>Welcome SmartKa!</p>
				</div>
				<div class="mobile-menu-wrap off-canvas-margin-padding-2">
					<div id="mobile-menu" class="slinky-mobile-menu text-left">
						<ul>
							<li><a href='<c:url value="/home" />'>HOME</a></li>
							<li><a href='<c:url value="/shop" />'>SHOP</a></li>
							<li><a href='<c:url value="/blog" />'>BLOG </a></li>
							<li><a href='<c:url value="/aboutus" />'>ABOUT US</a></li>
							<li><a href='<c:url value="/contactus" />'>CONTACT US</a></li>
						</ul>
					</div>
				</div>
				<div class="language-currency-wrap language-currency-wrap-modify">
					<div class="currency-wrap border-style">
						<a class="currency-active" href="#">$ Dollar (US) <i
							class=" ti-angle-down "></i></a>
						<div class="currency-dropdown">
							<ul>
								<li><a href="#">Taka (BDT) </a></li>
								<li><a href="#">Riyal (SAR) </a></li>
								<li><a href="#">Rupee (INR) </a></li>
							</ul>
						</div>
					</div>
					<div class="language-wrap">
						<a class="language-active" href="#"><img
							src="assets/images/icon-img/flag.png" alt=""> English <i
							class=" ti-angle-down "></i></a>
						<div class="language-dropdown">
							<ul>
								<li><a href="#"><img
										src="assets/images/icon-img/flag.png" alt="">English </a></li>
								<li><a href="#"><img
										src="assets/images/icon-img/spanish.png" alt="">Spanish</a></li>
								<li><a href="#"><img
										src="assets/images/icon-img/arabic.png" alt="">Arabic </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- All JS is here -->
	<script src="assets/js/vendor/modernizr-3.11.2.min.js"></script>
	<script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
	<script src="assets/js/vendor/jquery-migrate-3.3.2.min.js"></script>
	<script src="assets/js/vendor/popper.min.js"></script>
	<script src="assets/js/vendor/bootstrap.min.js"></script>
	<script src="assets/js/plugins/wow.js"></script>
	<script src="assets/js/plugins/scrollup.js"></script>
	<script src="assets/js/plugins/aos.js"></script>
	<script src="assets/js/plugins/magnific-popup.js"></script>
	<script src="assets/js/plugins/jquery.syotimer.min.js"></script>
	<script src="assets/js/plugins/swiper.min.js"></script>
	<script src="assets/js/plugins/imagesloaded.pkgd.min.js"></script>
	<script src="assets/js/plugins/isotope.pkgd.min.js"></script>
	<script src="assets/js/plugins/jquery-ui.js"></script>
	<script src="assets/js/plugins/jquery-ui-touch-punch.js"></script>
	<script src="assets/js/plugins/jquery.nice-select.min.js"></script>
	<script src="assets/js/plugins/waypoints.min.js"></script>
	<script src="assets/js/plugins/counterup.min.js"></script>
	<script src="assets/js/plugins/select2.min.js"></script>
	<script src="assets/js/plugins/easyzoom.js"></script>
	<script src="assets/js/plugins/slinky.min.js"></script>
	<script src="assets/js/plugins/ajax-mail.js"></script>
	<!-- Main JS -->
	<script src="assets/js/main.js"></script>
	<!-- SweetAlert JS -->
	<%-- <link rel='stylesheet'
		href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'> --%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="assets/js/userCart.js"></script>
	<script src="assets/js/auth.js"></script>
	<script src="assets/js/checkout.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			//update avt ajax
			function preview(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) { 
                    console.log(reader.result)
                    var img = new Image;
                    img.onload = function() {$('#img').attr({'src':e.target.result,'width':img.width});};
                    img.src = reader.result;
                                            }
                    reader.readAsDataURL(input.files[0]);    
                    }
                    
            }
			$("#uploadAvt").change(function(event) {
				preview(this);
				
				var avt = $("#uploadAvt").val();
				avt = avt.substring(12, avt.length);
				$.ajax({
			        type: "post",
			        url: '/SmartKa/update-avatar',
			        data: {
			            avt
			        },
			        success: function (data) {
						if (data.success) {
							swal("Success", data.message, "success");
						} else {
							swal("Failed", data.message, "error");
						}
					}
			    });
				
			});
			
			//send feedback ajax
			$('#sendFeedback').click(function() {
				/* swal("Success", "hello", "success") */
                var content = $('.spMess').val();
                $.ajax({
                    type: "get",
                    url: '/SmartKa/sendFeedback',
                    data: {
                    	content
                    },
                    dataType: "json",
                    success: function (data1) {
                    	if (data1.success) {
							swal("Success", data1.message, "success");
						} else {
							swal("Failed", data1.message, "error");
							
						}
					},
					
                }); 
            });
		});
	</script>
</body>
</html>
