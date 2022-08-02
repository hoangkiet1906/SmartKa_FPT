<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="slider-area">
	<div class="slider-active swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div
					class="intro-section slider-height-1 slider-content-center bg-img single-animation-wrap slider-bg-color-2"
					style="background-image: url(assets/images/slider/nen1.jpg)">
					<div class="container">
						<div class="row">
							<div class="col-12 hm2-slider-animation">
								<div
									class="slider-content-2 slider-content-2-wrap slider-animated-2">
									<h3 class="animated">Up To 40% Off</h3>
									<h1 class="animated">
										Summer <br>Collection
									</h1>
									<div class="slider-btn-2 btn-hover">
										<a href="product-details.html"
											class="btn hover-border-radius theme-color animated">
											Shop Now </a>
									</div>
									<h2 class="animated">Furnirtre</h2>
									<img class="animated" src="assets/images/icon-img/chair.png"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div
					class="intro-section slider-height-1 slider-content-center bg-img single-animation-wrap slider-bg-color-2"
					style="background-image: url(assets/images/slider/nen3.jpg)">
					<div class="container">
						<div class="row">
							<div class="col-12 hm2-slider-animation">
								<div
									class="slider-content-2 slider-content-2-wrap slider-animated-2">
									<h3 class="animated">Up To 40% Off</h3>
									<h1 class="animated">
										Summer <br>Collection
									</h1>
									<div class="slider-btn-2 btn-hover">
										<a href="product-details.html"
											class="btn hover-border-radius theme-color animated">
											Shop Now </a>
									</div>
									<h2 class="animated">Furnirtre</h2>
									<img class="animated" src="assets/images/icon-img/chair.png"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="home-slider-prev2 main-slider-nav2">
				<i class="fa fa-angle-left"></i>
			</div>
			<div class="home-slider-next2 main-slider-nav2">
				<i class="fa fa-angle-right"></i>
			</div>
		</div>
	</div>
</div>
<div class="category-area bg-gray-4 pt-95 pb-100">
	<div class="container">
		<div class="section-title-2 st-border-center text-center mb-75"
			data-aos="fade-up" data-aos-delay="200">
			<h2>Products Category</h2>
		</div>
		<div class="category-slider-active-2 swiper-container">
			<div class="swiper-wrapper">
				<c:forEach var="cate" items="${cateList}">
					<div class="swiper-slide">
						<div class="single-category-wrap-2 text-center" data-aos="fade-up"
							data-aos-delay="200">
							<div class="category-img-2">
								<a href="shop.html"> <img class="category-normal-img"
									src="<c:url value="assets/images/product/${cate.image}" />"
									alt=""> <img class="category-hover-img"
									src="<c:url value="assets/images/product/${cate.image}" />"
									alt="icon">
								</a>
							</div>
							<div class="category-content-2 category-content-2-black">
								<h4>
									<a href="shop.html">${cate.tag}</a>
								</h4>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div class="product-area pt-95 pb-60">
	<div class="container">
		<div class="section-title-tab-wrap mb-75" data-aos="fade-up"
			data-aos-delay="200">
			<div class="section-title-2">
				<h2>Hot Products</h2>
			</div>
			<div class="tab-style-1 nav">
				<a class="active" href="#pro-1" data-bs-toggle="tab">New
					Arrivals </a> <a href="#pro-2" data-bs-toggle="tab" class=""> Best
					Sellers </a> <a href="#pro-3" data-bs-toggle="tab" class=""> Sale
					Items </a>
			</div>
		</div>
		<div class="tab-content jump">
			<div id="pro-1" class="tab-pane active">
				<div class="row">
					<!--  -->
					<c:forEach items="${productNews}" var="pro">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product-wrap mb-35" data-aos="fade-up"
								data-aos-delay="200">
								<div class="product-img img-zoom mb-25">
									<a href='/SmartKa/product?id=${pro.id }&&tag=${pro.tag}'> <img
										src="<c:url value="assets/images/product/${pro.image}" />"
										alt="">
									</a>
									<div class="product-action-wrap">
										<button class="product-action-btn-1" title="Wishlist">
											<i class="pe-7s-like"></i>
										</button>
										<button class="product-action-btn-1" title="Quick View"
											data-bs-toggle="modal" data-bs-target="#Modal${pro.id}">
											<i class="pe-7s-look"></i>
										</button>
									</div>
									<div class="product-action-2-wrap">
										<button data-productid="${pro.id }"
											class="product-action-btn-2" title="Add To Cart">
											<i class="pe-7s-cart"></i> Add to cart
										</button>
									</div>
								</div>
								<div class="product-content">
									<h3>
										<a href="product-details.html"> ${pro.name} </a>
									</h3>
									<div class="product-price">
										<span class="new-price">$${pro.price} </span>
									</div>
								</div>
							</div>
						</div>

						<!-- Product Modal start -->
						<div class="modal fade quickview-modal-style" id="Modal${pro.id}"
							tabindex="-1" role="dialog">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<form class="modal-content modal-product-form"
									data-productid="${pro.id }">
									<div class="modal-header">
										<a href="#" class="close" data-bs-dismiss="modal"
											aria-label="Close"><i class=" ti-close "></i></a>
									</div>
									<div class="modal-body">
										<div class="row gx-0">
											<div class="col-lg-5 col-md-5 col-12">
												<div class="modal-img-wrap">
													<img
														src="<c:url value="assets/images/product/${pro.image}" />"
														alt="">
												</div>
											</div>
											<div class="col-lg-7 col-md-7 col-12">
												<div class="product-details-content quickview-content">
													<h2>${pro.name}</h2>
													<div class="product-details-price">
														<span class="new-price">$${pro.price}</span>
													</div>
													<div class="product-details-review">
														<div class="product-rating">
															<i class=" ti-star"></i> <i class=" ti-star"></i> <i
																class=" ti-star"></i> <i class=" ti-star"></i> <i
																class=" ti-star"></i>
														</div>
														<span>( ${pro.view} Customer Review )</span>
													</div>
													<div
														class="product-color product-color-active product-details-color">
														<span>Color :</span>
														<ul>
															<li><a title="Pink" class="pink" href="#">pink</a></li>
															<li><a title="Yellow" class="active yellow" href="#">yellow</a></li>
															<li><a title="Purple" class="purple" href="#">purple</a></li>
														</ul>
													</div>
													<p>${pro.description}</p>
													<div class="product-details-action-wrap">
														<div class="product-quality">
															<div class="dec updown qtybutton">-</div>
															<input readonly=""
																class="cart-plus-minus-box input-text qty text"
																name="qtybutton" value="1">
															<div class="inc updown qtybutton">+</div>
														</div>
														<button type="submit" style="padding: unset"
															class="single-product-cart btn-hover">
															<a class="">Add to cart</a>
														</button>
														<div class="single-product-wishlist">
															<a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
														</div>
														<div class="single-product-compare">
															<a title="Compare" href="#"><i class="pe-7s-shuffle"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- Product Modal end -->
						<!--  -->
					</c:forEach>
				</div>
			</div>

			<div id="pro-2" class="tab-pane">
				<div class="row">
					<!--  -->
					<c:forEach items="${productBests}" var="pro">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product-wrap mb-35">
								<div class="product-img img-zoom mb-25">
									<a href='/SmartKa/product?id=${pro.id }&&tag=${pro.tag}'> <img
										src="<c:url value="assets/images/product/${pro.image}" />"
										alt="">
									</a>
									<div class="product-action-wrap">
										<button class="product-action-btn-1" title="Wishlist">
											<i class="pe-7s-like"></i>
										</button>
										<button class="product-action-btn-1" title="Quick View"
											data-bs-toggle="modal" data-bs-target="#Modal${pro.id}">
											<i class="pe-7s-look"></i>
										</button>
									</div>
									<div class="product-action-2-wrap">
										<button data-productid="${pro.id }"
											class="product-action-btn-2" title="Add To Cart">
											<i class="pe-7s-cart"></i> Add to cart
										</button>
									</div>
								</div>
								<div class="product-content">
									<h3>
										<a href="product-details.html">${pro.name}</a>
									</h3>
									<div class="product-price">
										<span class="new-price">$${pro.price} </span>
									</div>
								</div>
							</div>
						</div>

						<!-- Product Modal start -->
						<div class="modal fade quickview-modal-style" id="Modal${pro.id}"
							tabindex="-1" role="dialog">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<form class="modal-content modal-product-form"
									data-productid="${pro.id }">
									<div class="modal-header">
										<a href="#" class="close" data-bs-dismiss="modal"
											aria-label="Close"><i class=" ti-close "></i></a>
									</div>
									<div class="modal-body">
										<div class="row gx-0">
											<div class="col-lg-5 col-md-5 col-12">
												<div class="modal-img-wrap">
													<img
														src="<c:url value="assets/images/product/${pro.image}" />"
														alt="">
												</div>
											</div>
											<div class="col-lg-7 col-md-7 col-12">
												<div class="product-details-content quickview-content">
													<h2>${pro.name}</h2>
													<div class="product-details-price">
														<span class="new-price">$${pro.price}</span>
													</div>
													<div class="product-details-review">
														<div class="product-rating">
															<i class=" ti-star"></i> <i class=" ti-star"></i> <i
																class=" ti-star"></i> <i class=" ti-star"></i> <i
																class=" ti-star"></i>
														</div>
														<span>( ${pro.view} Customer Review )</span>
													</div>
													<div
														class="product-color product-color-active product-details-color">
														<span>Color :</span>
														<ul>
															<li><a title="Pink" class="pink" href="#">pink</a></li>
															<li><a title="Yellow" class="active yellow" href="#">yellow</a></li>
															<li><a title="Purple" class="purple" href="#">purple</a></li>
														</ul>
													</div>
													<p>${pro.description}</p>
													<div class="product-details-action-wrap">
														<div class="product-quality">
															<input class="cart-plus-minus-box input-text qty text"
																name="qtybutton" value="1">
														</div>
														<button type="submit" style="padding: unset"
															class="single-product-cart btn-hover">
															<a class="button-a-hover">Add to cart</a>
														</button>
														<div class="single-product-wishlist">
															<a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
														</div>
														<div class="single-product-compare">
															<a title="Compare" href="#"><i class="pe-7s-shuffle"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- Product Modal end -->

						<!--  -->
					</c:forEach>

				</div>
			</div>
			<div id="pro-3" class="tab-pane">
				<div class="row">
					<!--  -->
					<c:forEach items="${productSales}" var="pro">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product-wrap mb-35">
								<div class="product-img img-zoom mb-25">
									<a href='/SmartKa/product?id=${pro.id }&&tag=${pro.tag}'> <img
										src="<c:url value="assets/images/product/${pro.image}" />"
										alt="">
									</a>
									<div class="product-badge badge-top badge-right badge-pink">
										<span>-10%</span>
									</div>
									<div class="product-action-wrap">
										<button class="product-action-btn-1" title="Wishlist">
											<i class="pe-7s-like"></i>
										</button>
										<button class="product-action-btn-1" title="Quick View"
											data-bs-toggle="modal" data-bs-target="#Modal${pro.id}">
											<i class="pe-7s-look"></i>
										</button>
									</div>
									<div class="product-action-2-wrap">
										<button data-productid="${pro.id }"
											class="product-action-btn-2" title="Add To Cart">
											<i class="pe-7s-cart"></i> Add to cart
										</button>
									</div>
								</div>
								<div class="product-content">
									<h3>
										<a href="product-details.html">${pro.name}</a>
									</h3>
									<div class="product-price">
										<span class="old-price">$${pro.price*10/100+pro.price}
										</span> <span class="new-price">$${pro.price}</span>
									</div>
								</div>
							</div>
						</div>

						<!-- Product Modal start -->
						<div class="modal fade quickview-modal-style" id="Modal${pro.id}"
							tabindex="-1" role="dialog">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<form class="modal-content modal-product-form"
									data-productid="${pro.id }">
									<div class="modal-header">
										<a href="#" class="close" data-bs-dismiss="modal"
											aria-label="Close"><i class=" ti-close "></i></a>
									</div>
									<div class="modal-body">
										<div class="row gx-0">
											<div class="col-lg-5 col-md-5 col-12">
												<div class="modal-img-wrap">
													<img
														src="<c:url value="assets/images/product/${pro.image}" />"
														alt="">
												</div>
											</div>
											<div class="col-lg-7 col-md-7 col-12">
												<div class="product-details-content quickview-content">
													<h2>${pro.name}</h2>
													<div class="product-details-price">
														<span class="new-price">$${pro.price}</span>
													</div>
													<div class="product-details-review">
														<div class="product-rating">
															<i class=" ti-star"></i> <i class=" ti-star"></i> <i
																class=" ti-star"></i> <i class=" ti-star"></i> <i
																class=" ti-star"></i>
														</div>
														<span>( ${pro.view} Customer Review )</span>
													</div>
													<div
														class="product-color product-color-active product-details-color">
														<span>Color :</span>
														<ul>
															<li><a title="Pink" class="pink" href="#">pink</a></li>
															<li><a title="Yellow" class="active yellow" href="#">yellow</a></li>
															<li><a title="Purple" class="purple" href="#">purple</a></li>
														</ul>
													</div>
													<p>${pro.description}</p>
													<div class="product-details-action-wrap">
														<div class="product-quality">
															<input class="cart-plus-minus-box input-text qty text"
																name="qtybutton" value="1">
														</div>
														<button type="submit" style="padding: unset"
															class="single-product-cart btn-hover">
															<a class="button-a-hover">Add to cart</a>
														</button>
														<div class="single-product-wishlist">
															<a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>
														</div>
														<div class="single-product-compare">
															<a title="Compare" href="#"><i class="pe-7s-shuffle"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- Product Modal end -->

						<!--  -->
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="banner-area pb-70">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-12">
				<div class="banner-wrap mb-30" data-aos="fade-up"
					data-aos-delay="200">
					<a href="product-details.html"><img
						src="assets/images/banner/safe.jpg" alt=""></a>
					<div class="banner-content-5">
						<span>Up To 40% Off</span>
						<h2></h2>
						<h2></h2>
						<div class="btn-style-3 btn-hover">
							<a class="btn hover-border-radius" href="product-details.html">Shop
								Now</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-12">
				<div class="banner-wrap mb-30" data-aos="fade-up"
					data-aos-delay="400">
					<a href="product-details.html"><img
						src="assets/images/banner/light.jpg" alt=""></a>
					<div class="banner-content-5">
						<span>Up To 40% Off</span>
						<h2></h2>
						<h2></h2>
						<div class="btn-style-3 btn-hover">
							<a class="btn hover-border-radius" href="product-details.html">Shop
								Now</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="product-area pb-95">
	<div class="container">
		<div class="section-border section-border-margin-1" data-aos="fade-up"
			data-aos-delay="200">
			<div class="section-title-timer-wrap bg-white">
				<div class="section-title-1">
					<h2 class="timer-style-1" style="color: white">Deal Of The Day</h2>
				</div>
			</div>
		</div>
		<div class="product-slider-active-1 swiper-container">
			<div class="swiper-wrapper">

				<c:forEach items="${productSales}" var="pro">
					<div class="swiper-slide">
						<div class="product-wrap">
							<div class="product-img img-zoom mb-25">
								<a href="product-details.html"> <img
									src="<c:url value="assets/images/product/${pro.image}" />"
									alt="">
								</a>
								<div class="product-badge badge-top badge-right badge-pink">
									<span>-10%</span>
								</div>
								<div class="product-action-2-wrap">
									<button data-productid="${pro.id }"
										class="product-action-btn-2" title="Add To Cart">
										<i class="pe-7s-cart"></i> Add to cart
									</button>
								</div>
							</div>
							<div class="product-content">
								<h3>
									<a href="product-details.html">${pro.name}</a>
								</h3>
								<div class="product-price">
									<span class="old-price">$${pro.price*10/100+pro.price} </span>
									<span class="new-price">$${pro.price} </span>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
			<div class="product-prev-1 product-nav-1" data-aos="fade-up"
				data-aos-delay="200">
				<i class="fa fa-angle-left"></i>
			</div>
			<div class="product-next-1 product-nav-1" data-aos="fade-up"
				data-aos-delay="200">
				<i class="fa fa-angle-right"></i>
			</div>
		</div>
	</div>
</div>
<div class="banner-area pb-100">
	<div class="bg-img bg-padding-2"
		style="background-image: url(assets/images/bg/b-2.jpg)">
		<div class="container">
			<div class="banner-content-5 banner-content-5-static">
				<span data-aos="fade-up" data-aos-delay="200">Up To 40% Off</span>
				<h1 data-aos="fade-up" data-aos-delay="400">
					New Devices <br>Light Set
				</h1>
				<div class="btn-style-3 btn-hover" data-aos="fade-up"
					data-aos-delay="600">
					<a class="btn hover-border-radius" href="product-details.html">Shop
						Now</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="brand-logo-area pb-95">
	<div class="container">
		<div class="brand-logo-active swiper-container">
			<div class="swiper-wrapper">

				<c:forEach items="${cateList}" var="cate">
					<div class="swiper-slide">
						<div class="single-brand-logo" data-aos="fade-up"
							data-aos-delay="200">
							<a href="#"><img
								src="<c:url value="assets/images/product/${cate.image}" />"
								alt=""></a>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</div>
<div class="blog-area pb-70">
	<div class="container">
		<div class="section-title-2 st-border-center text-center mb-75"
			data-aos="fade-up" data-aos-delay="200">
			<h2>Latest News</h2>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="blog-wrap mb-30" data-aos="fade-up" data-aos-delay="200">
					<div class="blog-img-date-wrap mb-25">
						<div class="blog-img">
							<a href="blog-details.html"><img
								src="assets/images/blog/blog-1.png" alt=""></a>
						</div>
						<div class="blog-date">
							<h5>
								05 <span>May</span>
							</h5>
						</div>
					</div>
					<div class="blog-content">
						<div class="blog-meta">
							<ul>
								<li><a href="#">Furniture</a>,</li>
								<li>By:<a href="#"> Admin</a></li>
							</ul>
						</div>
						<h3>
							<a href="blog-details.html">Lorem ipsum dolor consectet.</a>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipi elit, sed do
							eiusmod tempor incididunt ut labo et dolore magna aliqua.</p>
						<div class="blog-btn-2 btn-hover">
							<a class="btn hover-border-radius theme-color"
								href="blog-details.html">Read More</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-wrap mb-30" data-aos="fade-up" data-aos-delay="400">
					<div class="blog-img-date-wrap mb-25">
						<div class="blog-img">
							<a href="blog-details.html"><img
								src="assets/images/blog/blog-2.png" alt=""></a>
						</div>
						<div class="blog-date">
							<h5>
								06 <span>May</span>
							</h5>
						</div>
					</div>
					<div class="blog-content">
						<div class="blog-meta">
							<ul>
								<li><a href="#">Furniture</a>,</li>
								<li>By:<a href="#"> Admin</a></li>
							</ul>
						</div>
						<h3>
							<a href="blog-details.html">Duis et volutpat pellentesque.</a>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipi elit, sed do
							eiusmod tempor incididunt ut labo et dolore magna aliqua.</p>
						<div class="blog-btn-2 btn-hover">
							<a class="btn hover-border-radius theme-color"
								href="blog-details.html">Read More</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-wrap mb-30" data-aos="fade-up" data-aos-delay="600">
					<div class="blog-img-date-wrap mb-25">
						<div class="blog-img">
							<a href="blog-details.html"><img
								src="assets/images/blog/blog-3.png" alt=""></a>
						</div>
						<div class="blog-date">
							<h5>
								07 <span>May</span>
							</h5>
						</div>
					</div>
					<div class="blog-content">
						<div class="blog-meta">
							<ul>
								<li><a href="#">Furniture</a>,</li>
								<li>By:<a href="#"> Admin</a></li>
							</ul>
						</div>
						<h3>
							<a href="blog-details.html">Vivamus vitae dolor convallis.</a>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipi elit, sed do
							eiusmod tempor incididunt ut labo et dolore magna aliqua.</p>
						<div class="blog-btn-2 btn-hover">
							<a class="btn hover-border-radius theme-color"
								href="blog-details.html">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>