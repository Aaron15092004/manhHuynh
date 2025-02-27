<%-- 
    Document   : contact
    Created on : Feb 21, 2025, 12:12:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	
<!-- Mirrored from jthemes.net/themes/html/harmony-event/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:04:10 GMT -->
<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">

		<title>Harmoni - Contact Us</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png">

		<!-- fraimwork - css include -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

		<!-- icon css include -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/flaticon.css">

		<!-- carousel css include -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick-theme.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/owl.theme.default.min.css">

		<!-- others css include -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/calendar.css">

		<!-- color switcher css include -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/colors/style-switcher.css">
		<link id="color_theme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/colors/default.css">

		<!-- custom css include -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
		

	</head>


	<body class="default-header-p">




		
		<!-- backtotop - start -->
		<div id="thetop" class="thetop"></div>
		<div class='backtotop'>
			<a href="#thetop" class='scroll'>
				<i class="fas fa-angle-double-up"></i>
			</a>
		</div>
		<!-- backtotop - end -->

		<!-- preloader - start -->
		<div id="preloader"></div>
		<!-- preloader - end -->




		<!-- header-section - start
		================================================== -->
		<header id="header-section" class="header-section default-header-section auto-hide-header clearfix">

			<!-- header-top - start -->
			<jsp:include page="common/header-top.jsp"></jsp:include>
			<!-- header-top - end -->

			<!-- header-bottom - start -->
			<jsp:include page="common/header-bottom.jsp"></jsp:include>   
			<!-- header-bottom - end -->

		</header>
		<!-- header-section - end
		================================================== -->





		<!-- altranative-header - start
		================================================== -->
		<jsp:include page="common/altranative-header.jsp"></jsp:include>
		<!-- altranative-header - end
		================================================== -->





		<!-- breadcrumb-section - start
		================================================== -->
		<section id="breadcrumb-section" class="breadcrumb-section clearfix">
			<div class="jarallax" style="background-image: url('${pageContext.request.contextPath}/assets/images/breadcrumb/0.breadcrumb-bg.jpg');">
				<div class="overlay-black">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-6 col-md-12 col-sm-12">

								<!-- breadcrumb-title - start -->
								<div class="breadcrumb-title text-center mb-50">
									<span class="sub-title">contact us now</span>
									<h2 class="big-title">keep <strong>in touch</strong></h2>
								</div>
								<!-- breadcrumb-title - end -->

								<!-- breadcrumb-list - start -->
								<div class="breadcrumb-list">
									<ul>
										<li class="breadcrumb-item"><a href="home.jsp" class="breadcrumb-link">Home</a></li>
										<li class="breadcrumb-item active" aria-current="page">contact us</li>
									</ul>
								</div>
								<!-- breadcrumb-list - end -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- breadcrumb-section - end
		================================================== -->





		<!-- contact-section - start
		================================================== -->
		<section id="contact-section" class="contact-section sec-ptb-100 clearfix">
			<div class="container">

				<!-- section-title - start -->
				<div class="section-title mb-50">
					<small class="sub-title">contact us</small>
					<h2 class="big-title">Keep in touch <strong>with harmoni</strong></h2>
				</div>
				<!-- section-title - end -->

				<!-- contact-form - start -->
				<div class="contact-form form-wrapper text-center">
					<form action="https://jthemes.net/themes/html/harmony-event/contact.php" method="post">
						<div class="row">

							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="form-item">
									<input type="text" placeholder="Your Name" required>
								</div>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="form-item">
									<input type="email" placeholder="Email Address" required>
								</div>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="form-item">
									<input type="text" placeholder="Your Country" required>
								</div>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="form-item">
									<input type="tel" placeholder="Phone Number" required>
								</div>
							</div>

							<div class="col-lg-12 col-md-12 col-sm-12">
								<textarea placeholder="Your Message" required></textarea>
								<button type="submit" class="custom-btn">send mail</button>
							</div>
							
						</div>
					</form>
				</div>
				<!-- contact-form - end -->

			</div>
		</section>
		<!-- contact-section - end
		================================================== -->





		<!-- google map - start
		================================================== -->
		<jsp:include page="common/google map.jsp"></jsp:include>
		<!-- google map - end
		================================================== -->





		<!-- default-footer-section - start
		================================================== -->
		<jsp:include page="common/default-footer-section.jsp"></jsp:include>
		<!-- default-footer-section - end
		================================================== -->










		<!-- fraimwork - jquery include -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

		<!-- carousel jquery include -->
		<script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>

		<!-- map jquery include -->
		<script src="${pageContext.request.contextPath}/assets/js/gmap3.min.js"></script>
		<script src="http://maps.google.com/maps/api/js?key=AIzaSyC61_QVqt9LAhwFdlQmsNwi5aUJy9B2SyA"></script>

		<!-- calendar jquery include -->
		<script src="${pageContext.request.contextPath}/assets/js/atc.min.js"></script>

		<!-- others jquery include -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/isotope.pkgd.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jarallax.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>

		<!-- gallery img loaded - jqury include -->
		<script src="${pageContext.request.contextPath}/assets/js/imagesloaded.pkgd.min.js"></script>

		<!-- multy count down - jqury include -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.countdown.js"></script>

		<!-- color panal - jqury include -->
		<script src="${pageContext.request.contextPath}/assets/js/style-switcher.js"></script>

		<!-- custom jquery include -->
		<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>





	</body>

<!-- Mirrored from jthemes.net/themes/html/harmony-event/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:04:10 GMT -->
</html>