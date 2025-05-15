<%-- 
    Document   : gallery
    Created on : Feb 21, 2025, 12:11:37 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	
<!-- Mirrored from jthemes.net/themes/html/harmony-event/gallery.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:04:10 GMT -->
<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">

		<title>Harmoni - Gallery</title>
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
			<jsp:include page="../common/homepage-common/header-top.jsp"></jsp:include>
			<!-- header-top - end -->

			<!-- header-bottom - start -->
			<jsp:include page="../common/homepage-common/header-bottom.jsp"></jsp:include>   
			<!-- header-bottom - end -->

		</header>
		<!-- header-section - end
		================================================== -->





		<!-- altranative-header - start
		================================================== -->
		<jsp:include page="../common/homepage-common/altranative-header.jsp"></jsp:include>
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
									<span class="sub-title">event gallery</span>
									<h2 class="big-title">harmoni <strong>gallery</strong></h2>
								</div>
								<!-- breadcrumb-title - end -->

								<!-- breadcrumb-list - start -->
								<div class="breadcrumb-list">
									<ul>
										<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="breadcrumb-link">Home</a></li>
										<li class="breadcrumb-item active" aria-current="page">harmoni gallery</li>
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





		<!-- event-gallery-section - start
		================================================== -->
		<section id="event-gallery-section" class="event-gallery-section sec-ptb-100 clearfix">
			<div class="container">

				<div class="button-group filters-button-group mb-30">
					<button class="button is-checked" data-filter="*">
						<i class="fas fa-star"></i>
						<strong>all</strong> gallery
					</button>
					<button class="button" data-filter=".video-gallery">
						<i class="fas fa-play-circle"></i>
						<strong>video</strong> gallery
					</button>
					<button class="button" data-filter=".photo-gallery">
						<i class="far fa-image"></i>
						<strong>photo</strong> gallery
					</button>
				</div>

				<div class="grid zoom-gallery clearfix mb-80" data-isotope="{ &quot;masonry&quot;: { &quot;columnWidth&quot;: 0 } }">
				<div class="grid-item grid-item--height2 photo-gallery " data-category="photo-gallery">
					<a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/1.image.jpg">
						<img src="${pageContext.request.contextPath}/assets/images/gallery/1.image.jpg" alt="Image_not_found">
					</a>
					<div class="item-content">
						<h3>John Doe Wedding day</h3>
						<span>Wedding Party, 24 June 2016</span>
					</div>
				</div>
				<div class="grid-item grid-item--width2 video-gallery " data-category="video-gallery">
					<a class="popup-youtube" href="https://youtu.be/-haiaZ011OM">
						<img src="${pageContext.request.contextPath}/assets/images/gallery/2.image.jpg" alt="Image_not_found">
					</a>
					<div class="item-content">
						<h3>Business Conference in Dubai</h3>
						<span>Food Festival, 24 June 2016</span>
					</div>
				</div>
				<div class="grid-item photo-gallery " data-category="photo-gallery">
					<a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/3.image.jpg">
						<img src="${pageContext.request.contextPath}/assets/images/gallery/3.image.jpg" alt="Image_not_found">
					</a>
					<div class="item-content">
						<h3>Envato Author Fun Hiking</h3>
						<span>Food Festival, 24 June 2016</span>
					</div>
				</div>

				<div class="grid-item photo-gallery " data-category="photo-gallery">
					<a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/4.image.jpg">
						<img src="${pageContext.request.contextPath}/assets/images/gallery/4.image.jpg" alt="Image_not_found">
					</a>
					<div class="item-content">
						<h3>John Doe Wedding day</h3>
						<span>Wedding Party, 24 June 2016</span>
					</div>
				</div>
				<div class="grid-item grid-item--width2 video-gallery " data-category="video-gallery">
					<a class="popup-youtube" href="https://youtu.be/-haiaZ011OM">
						<img src="${pageContext.request.contextPath}/assets/images/gallery/5.image.jpg" alt="Image_not_found">
					</a>
					<div class="item-content">
						<h3>New Year Celebration</h3>
						<span>Food Festival, 24 June 2016</span>
					</div>
				</div>

				<div class="grid-item grid-item--width2 photo-gallery " data-category="photo-gallery">
					<a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/6.image.jpg">
						<img src="${pageContext.request.contextPath}/assets/images/gallery/6.image.jpg" alt="Image_not_found">
					</a>
					<div class="item-content">
						<h3>John Doe Wedding day</h3>
						<span>Wedding Party, 24 June 2016</span>
					</div>
				</div>
				<div class="grid-item video-gallery " data-category="video-gallery">
					<a class="popup-youtube" href="https://youtu.be/-haiaZ011OM">
						<img src="${pageContext.request.contextPath}/assets/images/gallery/7.image.jpg" alt="Image_not_found">
					</a>
					<div class="item-content">
						<h3>New Year Celebration</h3>
						<span>Food Festival, 24 June 2016</span>
					</div>
				</div>
				<div class="grid-item photo-gallery " data-category="photo-gallery">
					<a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/8.image.jpg">
						<img src="${pageContext.request.contextPath}/assets/images/gallery/8.image.jpg" alt="Image_not_found">
					</a>
					<div class="item-content">
						<h3>Envato Author Fun Hiking</h3>
						<span>Food Festival, 24 June 2016</span>
					</div>
				</div>
			</div>

				<div class="pagination ul-li clearfix">
					<ul>
						<li class="page-item prev-item">
							<a class="page-link" href="#">Prev</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">01</a></li>
						<li class="page-item active"><a class="page-link" href="#">02</a></li>
						<li class="page-item"><a class="page-link" href="#">03</a></li>
						<li class="page-item"><a class="page-link" href="#">04</a></li>
						<li class="page-item"><a class="page-link" href="#">05</a></li>
						<li class="page-item next-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</div>

			</div>
		</section>
		<!-- event-gallery-section - end
		================================================== -->





		<!-- special-offer-section - start
		================================================== -->
		<section id="special-offer-section" class="special-offer-section clearfix" style="background-image: url('${pageContext.request.contextPath}/assets/images/special-offer-bg.png');">
			<div class="container">
				<div class="row">

					<!-- special-offer-content - start -->
					<div class="col-lg-9 col-md-12 col-sm-12">
						<div class="special-offer-content">
							<h2><strong>30%</strong> Off in June~July for <span>Birthday Events</span></h2>
							<p class="m-0">
								Contact us now and we will make your event unique & unforgettable
							</p>
						</div>
					</div>
					<!-- special-offer-content - end -->

					<!-- event-makeing-btn - start -->
					<div class="col-lg-3 col-md-12 col-sm-12">
						<div class="event-makeing-btn">
							<a href="#!">make an event now</a>
						</div>
					</div>
					<!-- event-makeing-btn - end -->

				</div>
			</div>
		</section>
		<!-- special-offer-section - end
		================================================== -->





		<!-- google map - start
		================================================== -->
		<jsp:include page="../common/homepage-common/google map.jsp"></jsp:include>
		<!-- google map - end
		================================================== -->





		<!-- default-footer-section - start
		================================================== -->
		<jsp:include page="../common/homepage-common/default-footer-section.jsp"></jsp:include>
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

<!-- Mirrored from jthemes.net/themes/html/harmony-event/gallery.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:04:10 GMT -->
</html>