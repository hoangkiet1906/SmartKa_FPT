<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="product-details-area pb-100 pt-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="product-details-img-wrap product-details-vertical-wrap"
					data-aos="fade-up" data-aos-delay="200">
					<div class="product-details-small-img-wrap">
						<div
							class="swiper-container product-details-small-img-slider-1 pd-small-img-style">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="product-details-small-img">
										<img src="assets/images/product/${product.image}"
											alt="Product Thumnail">
									</div>
								</div>
							</div>
						</div>
						<div class="pd-prev pd-nav-style">
							<i class="ti-angle-up"></i>
						</div>
						<div class="pd-next pd-nav-style">
							<i class="ti-angle-down"></i>
						</div>
					</div>
					<div
						class="swiper-container product-details-big-img-slider-1 pd-big-img-style">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="easyzoom-style">
									<div class="easyzoom easyzoom--overlay">
										<a href="assets/images/product/${product.image}"> <img
											src="assets/images/product/${product.image}" alt="">
										</a>
									</div>
									<a class="easyzoom-pop-up img-popup"
										href="assets/images/product/${product.image}"> <i
										class="pe-7s-search"></i>
									</a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="product-details-content" data-aos="fade-up"
					data-aos-delay="400">
					<h2>${product.name}</h2>
					<c:if test="${product.status == 'Sale Items'}">
						<div class="product-details-price">
							<span class="old-price">$${product.price * 110 / 100}</span> <span
								class="new-price">$${product.price}</span>
						</div>
					</c:if>
					<c:if test="${product.status != 'Sale Items'}">
						<div class="product-details-price">
							<span class="price" style="font-size: 25px">$${product.price}</span>
						</div>
					</c:if>
					<div class="product-details-review">
						<div class="product-rating">
							<i class=" ti-star"></i> <i class=" ti-star"></i> <i
								class=" ti-star"></i> <i class=" ti-star"></i> <i
								class=" ti-star"></i>
						</div>
						<span>( 1 Customer Review )</span>
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
					<div class="product-details-action-wrap">
						<div class="product-quality">
							<input class="cart-plus-minus-box input-text qty text"
								name="qtybutton" value="1">
						</div>
						<div class="single-product-cart btn-hover">
							<a href="#">Add to cart</a>
						</div>
						<div class="single-product-wishlist">
							<a title="Wishlist" href="wishlist.html"><i
								class="pe-7s-like"></i></a>
						</div>
						<div class="single-product-compare">
							<a title="Compare" href="#"><i class="pe-7s-shuffle"></i></a>
						</div>
					</div>
					<div class="product-details-meta">
						<ul>
							<li><span class="title">SKU:</span> Ch-256xl</li>
							<li><span class="title">Category:</span>
								<ul>
									<li><a href="#">Office</a>,</li>
									<li><a href="#">Home</a></li>
								</ul></li>
							<li><span class="title">Tags:</span>
								<ul class="tag">
									<li><a href="/SmartKa/shop?tag=${product.tag}"
										class="productDetailTag" data-tagname="${product.tag}">${product.tag}</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="social-icon-style-4">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-dribbble"></i></a> <a href="#"><i
							class="fa fa-pinterest-p"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-linkedin"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="description-review-area pb-85">
	<div class="container">
		<div class="description-review-topbar nav" data-aos="fade-up"
			data-aos-delay="200">
			<a class="active" data-bs-toggle="tab" href="#des-details1">
				Description </a> <a data-bs-toggle="tab" href="#des-details2" class="">
				Information </a> <a data-bs-toggle="tab" href="#des-details3" class="">
				Reviews </a>
		</div>
		<div class="tab-content">
			<div id="des-details1" class="tab-pane active">
				<div class="product-description-content text-center">
					<p data-aos="fade-up" data-aos-delay="200">${product.description}</p>
					<p data-aos="fade-up" data-aos-delay="400">${product.details}</p>
				</div>
			</div>
			<div id="des-details2" class="tab-pane">
				<div class="specification-wrap table-responsive">
					<table>
						<tbody>
							<tr>
								<td class="width1">Name</td>
								<td>${product.name}</td>
							</tr>
							<tr>
								<td class="width1">Tag</td>
								<td>${product.tag}</td>
							</tr>
							<tr>
								<td class="width1">Price</td>
								<td>$${product.price}</td>
							</tr>
							<tr>
								<td class="width1">Quantity</td>
								<td>${product.quantity}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<!--  -->
			<div id="des-details3" class="tab-pane">
				<input type="hidden" name="comment_pro_id" id="comment_pro_id"
					value="${id }">


				<div class="review-wrapper" id="showCmtPro">
					<!-- Load cmt here -->
				</div>

				<c:if test="${sessionScope.username != null}">
					<div class="ratting-form-wrapper">
						<div class="your-rating-wrap">
							<span>Your rating</span>
							<div class="your-rating">
								<a href="#"><i class="ti-star"></i></a> <a href="#"><i
									class="ti-star"></i></a> <a href="#"><i class="ti-star"></i></a> <a
									href="#"><i class="ti-star"></i></a> <a href="#"><i
									class="ti-star"></i></a>
							</div>
						</div>
						<div class="ratting-form">
							<form action="">
								<div class="row">
									<div class="col-md-12">
										<div class="rating-form-style mb-15">
											<label>Your review <span>*</span></label>
											<textarea name="Your Review" id="cmtProduct_content"></textarea>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="form-submit">
											<input type="button" value="Submit" id="sendCmtProduct">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</c:if>

				<!--  -->
			</div>
		</div>
	</div>
</div>
<div class="related-product-area pb-95">
	<div class="container">
		<div class="section-title-2 st-border-center text-center mb-75"
			data-aos="fade-up" data-aos-delay="200">
			<h2>Related Products</h2>
		</div>
		<div class="related-product-active swiper-container">
			<div class="swiper-wrapper">
				<c:forEach items="${relatedProduct}" var="relatedProducts">
					<div class="swiper-slide">
						<div class="product-wrap" data-aos="fade-up" data-aos-delay="200">
							<div class="product-img img-zoom mb-25">
								<a href="product-details.html"> <img
									src="assets/images/product/${relatedProducts.image}" alt="">
								</a>
								<c:if test="${relatedProducts.status eq 'Sale Items'}">
									<div class="product-badge badge-top badge-right badge-pink">
										<span>-10%</span>
									</div>
								</c:if>
								<div class="product-action-wrap">
									<button class="product-action-btn-1" title="Wishlist">
										<i class="pe-7s-like"></i>
									</button>
									<button class="product-action-btn-1" title="Quick View"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										<i class="pe-7s-look"></i>
									</button>
								</div>
								<div class="product-action-2-wrap">
									<button class="product-action-btn-2" title="Add To Cart">
										<i class="pe-7s-cart"></i> Add to cart
									</button>
								</div>
							</div>
							<div class="product-content">
								<h3>
									<a
										href="/SmartKa/product?id=${relatedProducts.id}&&tag=${relatedProducts.tag}">${relatedProducts.name}</a>
								</h3>
								<c:if test="${relatedProducts.status eq 'Sale Items'}">
									<div class="product-price">
										<span class="old-price">$${relatedProducts.price * 110
											/ 100}</span> <span class="new-price">$${relatedProducts.price}</span>
									</div>
								</c:if>
								<c:if test="${relatedProducts.status != 'Sale Items'}">
									<div class="product-price">
										<span class="price">$${relatedProducts.price}</span>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Comment handle -->
<script type="text/javascript">
		
	// get cmt
	const getCmtProduct = () => {
		var idpro = $('#comment_pro_id').val();
		$.ajax({
			type: "get",
			url: "/SmartKa/getAllCmtProduct",
			data: {
                   idpro: idpro,
               },
			dataType: "json",
			success: function (data) {
				if (data.success) {
					localStorage.setItem("cmtProduct", JSON.stringify(data.object));
					console.log("success get pro");
				} else {
					localStorage.removeItem("cmtProduct");
					console.log("no get pro");
				}
			}
		});
	}
	getCmtProduct();
	
	
	// Show cmt
	const showCmtProduct = (cmt) => {
		if (cmt != null) {
			cmt.map((item) => {
				const element = 
					"<div class='single-review'>"
		        +	  	"<div class='review-img'>"
		        +			"<img alt='' src='assets/images/avatar/" + item.avt +"'/>"
		        +		"</div>"
		        +		"<div class='review-content'>"
		        +			"<div class='review-rating'>"
		        +				"<a href=''><i class='ti-star'></i></a>"
		        +			    "<a href=''><i class='ti-star'></i></a>"
		        + 			    "<a href='#'><i class='ti-star'></i></a>"
		        +				"<a href='#'><i class='ti-star'></i></a>"
		        +    			"<a href='#'><i class='ti-star'></i></a>"
		        +			"</div>"
				+   	     	"<h5><span>" + item.username +"</span> - " + item.date +"</h5>"
				+    	    "<p>" + item.content +"</p>"
				+        "</div>"
				+    "</div>" ;
				
				
				$("#showCmtPro").append(element);
			})
		}  
	}
	
	// add cmt product into db
	const addCmtProduct = (cmt) => {
		
		var idpro = $('#comment_pro_id').val();
		var content = $('#cmtProduct_content').val();
		$.ajax({
			type: "get",
			url: "/SmartKa/addCmtProduct",
			data: {
                   idpro: idpro,
                   content:content
               },
			dataType: "json",
			success: function (data) {
				if (data.success) {
					const item = data.object;
					if (item != null) {
						cmt.push(item);
						const newElement = 
							"<div class='single-review'>"
				        +	  	"<div class='review-img'>"
				        +			"<img alt='' src='assets/images/avatar/" + item.avt +"'/>"
				        +		"</div>"
				        +		"<div class='review-content'>"
				        +			"<div class='review-rating'>"
				        +				"<a href=''><i class='ti-star'></i></a>"
				        +			    "<a href=''><i class='ti-star'></i></a>"
				        + 			    "<a href='#'><i class='ti-star'></i></a>"
				        +				"<a href='#'><i class='ti-star'></i></a>"
				        +    			"<a href='#'><i class='ti-star'></i></a>"
				        +			"</div>"
						+   	     	"<h5><span>" + item.username +"</span> - " + item.date +"</h5>"
						+    	    "<p>" + item.content +"</p>"
						+        "</div>"
						+    "</div>" ;
						
						
						$("#showCmtPro").append(newElement);
					}  
				} else {
					swal("Error", "OOPS! Somthing went wrong", "error")
				}
			}
		});
		
	}
	
	$(document).ready(function () {
		console.log("dayy")
		const cmtProduct = () => {
			return JSON.parse(localStorage.getItem("cmtProduct"));
		}
		const cmt = cmtProduct();
		showCmtProduct(cmt);
		$("#sendCmtProduct").click(function () {
			addCmtProduct(cmt);
		})
	});
	
	
</script>
