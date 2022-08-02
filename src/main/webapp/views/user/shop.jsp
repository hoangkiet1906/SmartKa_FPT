<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="shop-area shop-page-responsive pt-100 pb-100">
	<div class="container">
		<div class="row flex-row-reverse">
			<div class="col-lg-9">
				<div class="shop-topbar-wrapper mb-40">
					<div class="shop-topbar-left" data-aos="fade-up"
						data-aos-delay="200">
						<div class="showing-item" id="showing"></div>
					</div>
					<div class="shop-topbar-right" data-aos="fade-up"
						data-aos-delay="400">
						<div class="shop-sorting-area">
							<select class="nice-select nice-select-style-1">
								<option>Default Sorting</option>
								<option>Sort by popularity</option>
								<option>Sort by average rating</option>
								<option>Sort by latest</option>
							</select>
						</div>
						<div class="shop-view-mode nav">
							<a class="active" href="#shop-1" data-bs-toggle="tab"><i
								class=" ti-layout-grid3 "></i> </a> <a href="#shop-2"
								data-bs-toggle="tab" class=""><i class=" ti-view-list-alt "></i></a>
						</div>
					</div>
				</div>
				<div class="shop-bottom-area">
					<div class="tab-content jump">
						<div id="shop-1" class="tab-pane active">
							<div class="row" id="productContentShop1"></div>
							<div class="pagination-style-1" data-aos="fade-up"
								data-aos-delay="200">
								<ul id="pagiContentShop1"></ul>
							</div>
						</div>
						<div id="shop-2" class="tab-pane">
							<div id="productContentShop2" class="shop-list-wrap mb-30"></div>
							<!-- Pagi -->
							<div class="pagination-style-1">
								<ul id="pagiContentShop2"></ul>
							</div>

						</div>
						<!-- Product Modal start -->
						<div class="modal fade quickview-modal-style" id="Modaldetail"
							tabindex="-1" role="dialog"></div>
						<!-- Product Modal end -->
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="sidebar-wrapper">
					<div class="sidebar-widget mb-40" data-aos="fade-up"
						data-aos-delay="200">
						<div class="search-wrap-2">
							<form class="search-2-form" action="<c:url value='/shop'/>"
								method="get">
								<input id="searchProductKey" placeholder="Search*"
									name="searchProduct" type="text">
								<button class="button-search">
									<i class=" ti-search "></i>
								</button>
							</form>
						</div>
					</div>
					<div class="sidebar-widget sidebar-widget-border mb-40 pb-35"
						data-aos="fade-up" data-aos-delay="200">
						<div class="sidebar-widget-title mb-30">
							<h3>Filter By Price</h3>
						</div>
						<div class="price-filter">
							<div id="slider-range"></div>
							<div class="price-slider-amount">
								<div class="label-input">
									<label>Price:</label> <input type="text" id="amount"
										name="price" placeholder="Add Your Price" />
								</div>
								<button type="button">Filter</button>
							</div>
						</div>
					</div>
					<div class="sidebar-widget sidebar-widget-border mb-40 pb-35"
						data-aos="fade-up" data-aos-delay="200">
						<div class="sidebar-widget-title mb-25">
							<h3>Product Categories</h3>
						</div>
						<div class="sidebar-list-style">
							<ul id="CateList1">
								<c:forEach var="cate" items="${cateList}">
									<li><a class="productTag1" data-tagname="${cate.name}"
										id="tag1${cate.id}">${cate.name}<span>${cate.quantity}</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="sidebar-widget" data-aos="fade-up" data-aos-delay="200">
						<div class="sidebar-widget-title mb-25">
							<h3>Tags</h3>
						</div>
						<div class="sidebar-widget-tag">
							<a class="productTag2All">All, </a>
							<c:forEach var="cate" items="${cateList}">
								<a class="productTag2" data-tagname="${cate.name}"
									id="tag2${cate.id}">${cate.name}, </a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

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

<script type="text/javascript">
		var getUrlParameter = function getUrlParameter(sParam) {
		    var sPageURL = window.location.search.substring(1),
		        sURLVariables = sPageURL.split('&'),
		        sParameterName,
		        i;
	
		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');
	
		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
		        }
		    }
		    return false;
		}
		
		//load
			$(document).ready(function()
			{
				var currentPageShop = getUrlParameter('page');
				var tagFromProductDetail = getUrlParameter('tag');
			
				const productContentShop1 = $("#productContentShop1");
				const productContentShop2 = $("#productContentShop2");
				
				const pagiContentShop1 = $("#pagiContentShop1");
				const pagiContentShop2 = $("#pagiContentShop2");
				
				const cateList1 = $("#cateList1");

				const detailModal = $('#Modaldetail');
				
				const getProductModal = (productID) => {
					detailModal.empty();
					$.ajax({
						type: "GET",
						url: "/SmartKa/productModal",
						data: { id : productID },
						dataType: "json",
						contentType:false,
						success: function (response) {
							console.log(response);
							if(response.status === "Sale Items")
							{
								detailModal.append('<div class="modal-dialog modal-dialog-centered" role="document">\
									<div class="modal-content">\
										<div class="modal-header">\
											<a href="#" class="close" data-bs-dismiss="modal"\
												aria-label="Close"><i class=" ti-close "></i></a>\
										</div>\
										<div class="modal-body">\
											<div class="row gx-0">\
												<div class="col-lg-5 col-md-5 col-12">\
													<div class="modal-img-wrap">\
														<img src="assets/images/product/'+response.image+'" alt="">\
													</div>\
												</div>\
												<div class="col-lg-7 col-md-7 col-12">\
													<div class="product-details-content quickview-content">\
														<h2>'+response.name+'</h2>\
														<div class="product-details-price">\
															<span class="old-price">$'+response.price*110/100+'</span>\
															<span class="new-price">$'+response.price+'</span>\
														</div>\
														<div class="product-details-review">\
															<div class="product-rating">\
																<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
																	class=" ti-star"></i> <i class=" ti-star"></i> <i\
																	class=" ti-star"></i>\
															</div>\
															<span>( '+response.view+' Customer Review )</span>\
														</div>\
														<div\
															class="product-color product-color-active product-details-color">\
															<span>Color :</span>\
															<ul>\
																<li><a title="Pink" class="pink" href="#">pink</a></li>\
																<li><a title="Yellow" class="active yellow" href="#">yellow</a></li>\
																<li><a title="Purple" class="purple" href="#">purple</a></li>\
															</ul>\
														</div>\
														<p>'+response.description+'</p>\
														<div class="product-details-action-wrap">\
															<div class="product-quality">\
																<input class="cart-plus-minus-box input-text qty text"\
																	name="qtybutton" value="1">\
															</div>\
															<div class="single-product-cart btn-hover">\
																<a href="#">Add to cart</a>\
															</div>\
															<div class="single-product-wishlist">\
																<a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>\
															</div>\
															<div class="single-product-compare">\
																<a title="Compare" href="#"><i class="pe-7s-shuffle"></i></a>\
															</div>\
														</div>\
													</div>\
												</div>\
											</div>\
										</div>\
									</div>\
								</div>');
							}
							else {
								detailModal.append('<div class="modal-dialog modal-dialog-centered" role="document">\
									<div class="modal-content">\
										<div class="modal-header">\
											<a href="#" class="close" data-bs-dismiss="modal"\
												aria-label="Close"><i class=" ti-close "></i></a>\
										</div>\
										<div class="modal-body">\
											<div class="row gx-0">\
												<div class="col-lg-5 col-md-5 col-12">\
													<div class="modal-img-wrap">\
														<img src="assets/images/product/'+response.image+'" alt="">\
													</div>\
												</div>\
												<div class="col-lg-7 col-md-7 col-12">\
													<div class="product-details-content quickview-content">\
														<h2>'+response.name+'</h2>\
														<div class="product-details-price">\
															<span class="price" style="font-size:20px">$'+response.price+'</span>\
														</div>\
														<div class="product-details-review">\
															<div class="product-rating">\
																<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
																	class=" ti-star"></i> <i class=" ti-star"></i> <i\
																	class=" ti-star"></i>\
															</div>\
															<span>( '+response.view+' Customer Review )</span>\
														</div>\
														<div\
															class="product-color product-color-active product-details-color">\
															<span>Color :</span>\
															<ul>\
																<li><a title="Pink" class="pink" href="#">pink</a></li>\
																<li><a title="Yellow" class="active yellow" href="#">yellow</a></li>\
																<li><a title="Purple" class="purple" href="#">purple</a></li>\
															</ul>\
														</div>\
														<p>'+response.description+'</p>\
														<div class="product-details-action-wrap">\
															<div class="product-quality">\
																<input class="cart-plus-minus-box input-text qty text"\
																	name="qtybutton" value="1">\
															</div>\
															<div class="single-product-cart btn-hover">\
																<a href="#">Add to cart</a>\
															</div>\
															<div class="single-product-wishlist">\
																<a title="Wishlist" href="#"><i class="pe-7s-like"></i></a>\
															</div>\
															<div class="single-product-compare">\
																<a title="Compare" href="#"><i class="pe-7s-shuffle"></i></a>\
															</div>\
														</div>\
													</div>\
												</div>\
											</div>\
										</div>\
									</div>\
								</div>');
							}
							detailModal.modal('show');
						},
						error: function(){alert("fail")}
					});
				}

				//chua co modal
				const getProductByTag = (tagNameShop, pageNumber) => {
					
					productContentShop1.empty();
					pagiContentShop1.empty();
					
					productContentShop2.empty();
					pagiContentShop2.empty();
					
					$.ajax({
						type: "GET",
						url: "/SmartKa/shopTag",
						data: {
							tag: tagNameShop,
							page: pageNumber
						},
						contentType:false,
						dataType: "json",
						success: function (data) {
							
							const productList = data.productList;
                    		const currentPageShop = data.currentPage;
                    		const totalPage = data.totalPage;

                    		//product list
	                    		productList.map((item) => {
		                    		if(item.status === "Sale Items")
	                    			{
	                    				productContentShop1.append('<div class="col-lg-4 col-md-4 col-sm-6 col-12">\
	    									<div class="product-wrap mb-35" data-aos="fade-up" data-aos-delay="200">\
	    									<div class="product-img img-zoom mb-25">\
	    										<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
	    											src="assets/images/product/'+item.image+'" alt="">\
	    										</a>\
	    							        	<div class="product-badge badge-top badge-right badge-pink">\
	    											<span>-10%</span>\
	    										</div>\
	    										<div class="product-action-wrap">\
	    											<button class="product-action-btn-1" title="Wishlist">\
	    												<i class="pe-7s-like"></i>\
	    											</button>\
	    											<button class="product-action-btn-1" data-productid="'+item.id+'" id="showModalButtonShop1'+item.id+'" title="Quick View">\
	    												<i class="pe-7s-look"></i>\
	    											</button>\
	    										</div>\
	    										<div class="product-action-2-wrap">\
	    											<button data-productid="'+ item.id +'" class="product-action-btn-2" title="Add To Cart">\
	    												<i class="pe-7s-cart"></i> Add to cart\
	    											</button>\
	    										</div>\
	    									</div>\
	    									<div class="product-content">\
	    										<h3>\
	    											<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
	    										</h3>\
	    									        <div class="product-price">\
	    												<span class="old-price">$'+item.price*110/100+'</span>\
	    												<span class="new-price">$'+item.price+'</span>\
	    											</div>\
	    									</div>\
	    									</div>\
										</div>');
	                    			
										productContentShop2.append('<div class="row">\
											<div class="col-lg-4 col-sm-5">\
												<div class="product-list-img">\
													<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
														src="assets/images/product/'+item.image+'"\
														alt="Product Style">\
													</a>\
													<div class="product-list-badge badge-right badge-pink">\
														<span>-10%</span>\
													</div>\
													<div class="product-list-quickview">\
														<button data-productid="'+item.id+'" id="showModalButtonShop2'+item.id+'" class="product-action-btn-2" title="Quick View"\
															<i class="pe-7s-look"></i>\
														</button>\
													</div>\
												</div>\
											</div>\
											<div class="col-lg-8 col-sm-7">\
												<div class="shop-list-content">\
													<h3>\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
													</h3>\
														<div class="product-price">\
															<span class="old-price">$'+item.price*110/100+'</span> <span\
																class="new-price">$'+item.price+'</span>\
														</div>\
														<div class="product-price">\
															<span>$${product.price}</span>\
														</div>\
													<div class="product-list-rating">\
														<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
															class=" ti-star"></i> <i class=" ti-star"></i> <i\
															class=" ti-star"></i>\
													</div>\
													<p>'+item.description+'</p>\
													<div class="product-list-action">\
														<button class="product-action-btn-3" title="Add to cart">\
															<i class="pe-7s-cart"></i>\
														</button>\
														<button class="product-action-btn-3" title="Wishlist">\
															<i class="pe-7s-like"></i>\
														</button>\
														<button class="product-action-btn-3" title="Compare">\
															<i class="pe-7s-shuffle"></i>\
														</button>\
													</div>\
												</div>\
											</div>\
										</div>');
	                    			} //if
	                    		
	                    			else 
	                   				{
										productContentShop1.append('<div class="col-lg-4 col-md-4 col-sm-6 col-12">\
												<div class="product-wrap mb-35" data-aos="fade-up" data-aos-delay="200">\
												<div class="product-img img-zoom mb-25">\
													<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
														src="assets/images/product/'+item.image+'" alt="">\
													</a>\
													<div class="product-action-wrap">\
														<button class="product-action-btn-1" title="Wishlist">\
															<i class="pe-7s-like"></i>\
														</button>\
														<button class="product-action-btn-1" data-productid="'+item.id+'" id="showModalButtonShop1'+item.id+'" title="Quick View">\
															<i class="pe-7s-look"></i>\
														</button>\
													</div>\
													<div class="product-action-2-wrap">\
														<button data-productid="'+item.id+'" class="product-action-btn-2" title="Add To Cart">\
															<i class="pe-7s-cart"></i> Add to cart\
														</button>\
													</div>\
												</div>\
												<div class="product-content">\
													<h3>\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
													</h3>\
														<div class="product-price">\
															<span>$'+item.price+'</span>\
														</div>\
												</div>\
											</div>\
										</div>');
	                    			
	                    				productContentShop2.append('<div class="row">\
											<div class="col-lg-4 col-sm-5">\
												<div class="product-list-img">\
													<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
														src="assets/images/product/'+item.image+'"\
														alt="Product Style">\
													</a>\
													<div class="product-list-quickview">\
														<button data-productid="'+item.id+'" id="showModalButtonShop2'+item.id+'" class="product-action-btn-2" title="Quick View"\
															<i class="pe-7s-look"></i>\
														</button>\
													</div>\
												</div>\
											</div>\
											<div class="col-lg-8 col-sm-7">\
												<div class="shop-list-content">\
													<h3>\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
													</h3>\
											        	<div class="product-price">\
															<span>$'+item.price+'</span>\
														</div>\
													<div class="product-list-rating">\
														<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
															class=" ti-star"></i> <i class=" ti-star"></i> <i\
															class=" ti-star"></i>\
													</div>\
													<p>'+item.description+'</p>\
													<div class="product-list-action">\
														<button class="product-action-btn-3" title="Add to cart">\
															<i class="pe-7s-cart"></i>\
														</button>\
														<button class="product-action-btn-3" title="Wishlist">\
															<i class="pe-7s-like"></i>\
														</button>\
														<button class="product-action-btn-3" title="Compare">\
															<i class="pe-7s-shuffle"></i>\
														</button>\
													</div>\
												</div>\
											</div>\
										</div>');
	                   				} //else
	                    		}); // end productList item
							// product list map

							// page list
								for(let i = 1; i <= totalPage; i++) 
								{
									if(i == currentPageShop)
									{
										pagiContentShop1.append('<li><a id="shop1page'+i+'" class="active">'+i+'</a></li>');
										pagiContentShop2.append('<li><a id="shop2page'+i+'" class="active">'+i+'</a></li>');
									}
									else 
									{
										pagiContentShop1.append('<li><a id="shop1page'+i+'">'+i+'</a></li>');
										pagiContentShop2.append('<li><a id="shop2page'+i+'">'+i+'</a></li>');
									}
									$('#shop1page'+i).click(function(e){
										productContentShop1.empty();
										pagiContentShop1.empty();
										productContentShop2.empty();
										pagiContentShop2.empty();
										e.preventDefault();
										var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
										window.history.pushState({ path: currentURL }, '', currentURL);
										var changedCurrentPage = getUrlParameter('page')
										getProductByTag(tagNameShop,changedCurrentPage);
									})
									$('#shop2page'+i).click(function(e){
										productContentShop1.empty();
										pagiContentShop1.empty();
										productContentShop2.empty();
										pagiContentShop2.empty();
										e.preventDefault();
										var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
										window.history.pushState({ path: currentURL }, '', currentURL);
										var changedCurrentPage = getUrlParameter('page')
										getProductByTag(tagNameShop,changedCurrentPage);
									})
								} //for
							//page list
						},
						error: function(){
							alert("error");
						},
					}); //ajax
				}
					
				const getInitialPage = (pageIn) => 
				{					
					$.ajax ({
						type:"GET",
						url:"/SmartKa/getShop",
						data: {page : pageIn},
						dataType:"json",
                    	success: function (data) {
                    	
                    		console.log(data);
                    		
             				productContentShop1.empty();
							pagiContentShop1.empty();
							productContentShop2.empty();
							pagiContentShop2.empty();
                    	
                    		const productList = data.productList;
                    		const currentPageShop = data.currentPage;
                    		const totalPage = data.totalPage;
							
                    		//product list
	                    		productList.map((item) => {
		                    		if(item.status === "Sale Items")
	                    			{
	                    				productContentShop1.append('<div class="col-lg-4 col-md-4 col-sm-6 col-12">\
	    									<div class="product-wrap mb-35" data-aos="fade-up" data-aos-delay="200">\
	    									<div class="product-img img-zoom mb-25">\
	    										<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
	    											src="assets/images/product/'+item.image+'" alt="">\
	    										</a>\
	    							        	<div class="product-badge badge-top badge-right badge-pink">\
	    											<span>-10%</span>\
	    										</div>\
	    										<div class="product-action-wrap">\
	    											<button class="product-action-btn-1" title="Wishlist">\
	    												<i class="pe-7s-like"></i>\
	    											</button>\
	    											<button class="product-action-btn-1" data-productid="'+item.id+'" id="showModalButtonShop1'+item.id+'" title="Quick View">\
	    												<i class="pe-7s-look"></i>\
	    											</button>\
	    										</div>\
	    										<div class="product-action-2-wrap">\
	    											<button data-productid="'+item.id+'" class="product-action-btn-2" title="Add To Cart">\
	    												<i class="pe-7s-cart"></i> Add to cart\
	    											</button>\
	    										</div>\
	    									</div>\
	    									<div class="product-content">\
	    										<h3>\
	    											<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
	    										</h3>\
	    									        <div class="product-price">\
	    												<span class="old-price">$'+item.price*110/100+'</span>\
	    												<span class="new-price">$'+item.price+'</span>\
	    											</div>\
	    									</div>\
	    									</div>\
										</div>');
	                    			
										productContentShop2.append('<div class="row">\
											<div class="col-lg-4 col-sm-5">\
												<div class="product-list-img">\
													<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
														src="assets/images/product/'+item.image+'"\
														alt="Product Style">\
													</a>\
													<div class="product-list-badge badge-right badge-pink">\
														<span>-10%</span>\
													</div>\
													<div class="product-list-quickview">\
														<button data-productid="'+item.id+'" id="showModalButtonShop2'+item.id+'" class="product-action-btn-2" title="Quick View"\
															<i class="pe-7s-look"></i>\
														</button>\
													</div>\
												</div>\
											</div>\
											<div class="col-lg-8 col-sm-7">\
												<div class="shop-list-content">\
													<h3>\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
													</h3>\
														<div class="product-price">\
															<span class="old-price">$'+item.price*110/100+'</span> <span\
																class="new-price">$'+item.price+'</span>\
														</div>\
														<div class="product-price">\
															<span>$${product.price}</span>\
														</div>\
													<div class="product-list-rating">\
														<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
															class=" ti-star"></i> <i class=" ti-star"></i> <i\
															class=" ti-star"></i>\
													</div>\
													<p>'+item.description+'</p>\
													<div class="product-list-action">\
														<button class="product-action-btn-3" title="Add to cart">\
															<i class="pe-7s-cart"></i>\
														</button>\
														<button class="product-action-btn-3" title="Wishlist">\
															<i class="pe-7s-like"></i>\
														</button>\
														<button class="product-action-btn-3" title="Compare">\
															<i class="pe-7s-shuffle"></i>\
														</button>\
													</div>\
												</div>\
											</div>\
										</div>');
	                    			} //if
	                    		
	                    			else 
	                   				{
										productContentShop1.append('<div class="col-lg-4 col-md-4 col-sm-6 col-12">\
												<div class="product-wrap mb-35" data-aos="fade-up" data-aos-delay="200">\
												<div class="product-img img-zoom mb-25">\
													<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
														src="assets/images/product/'+item.image+'" alt="">\
													</a>\
													<div class="product-action-wrap">\
														<button class="product-action-btn-1" title="Wishlist">\
															<i class="pe-7s-like"></i>\
														</button>\
														<button class="product-action-btn-1" data-productid="'+item.id+'" id="showModalButtonShop1'+item.id+'" title="Quick View">\
															<i class="pe-7s-look"></i>\
														</button>\
													</div>\
													<div class="product-action-2-wrap">\
														<button data-productid="'+item.id+'" class="product-action-btn-2" title="Add To Cart">\
															<i class="pe-7s-cart"></i> Add to cart\
														</button>\
													</div>\
												</div>\
												<div class="product-content">\
													<h3>\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
													</h3>\
														<div class="product-price">\
															<span>$'+item.price+'</span>\
														</div>\
												</div>\
											</div>\
										</div>');
	                    			
	                    				productContentShop2.append('<div class="row">\
											<div class="col-lg-4 col-sm-5">\
												<div class="product-list-img">\
													<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
														src="assets/images/product/'+item.image+'"\
														alt="Product Style">\
													</a>\
													<div class="product-list-quickview">\
														<button data-productid="'+item.id+'" id="showModalButtonShop2'+item.id+'" class="product-action-btn-2" title="Quick View"\
															<i class="pe-7s-look"></i>\
														</button>\
													</div>\
												</div>\
											</div>\
											<div class="col-lg-8 col-sm-7">\
												<div class="shop-list-content">\
													<h3>\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
													</h3>\
											        	<div class="product-price">\
															<span>$'+item.price+'</span>\
														</div>\
													<div class="product-list-rating">\
														<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
															class=" ti-star"></i> <i class=" ti-star"></i> <i\
															class=" ti-star"></i>\
													</div>\
													<p>'+item.description+'</p>\
													<div class="product-list-action">\
														<button class="product-action-btn-3" title="Add to cart">\
															<i class="pe-7s-cart"></i>\
														</button>\
														<button class="product-action-btn-3" title="Wishlist">\
															<i class="pe-7s-like"></i>\
														</button>\
														<button class="product-action-btn-3" title="Compare">\
															<i class="pe-7s-shuffle"></i>\
														</button>\
													</div>\
												</div>\
											</div>\
										</div>');
	                   				} //else

									// modal
										$('#showModalButtonShop1'+item.id).click(function(e){
											e.preventDefault();
											const productId = $(this).data("productid");
											getProductModal(productId)
										});

										$('#showModalButtonShop2'+item.id).click(function(e){
											e.preventDefault();
											const productId = $(this).data("productid");
											getProductModal(productId)
										});
									// end modal

	                    		}); // end productList item
                    	
                    			// page list
	                    			for(let i = 1; i <= totalPage; i++) {
	                    				if(i == currentPageShop)
	                   					{
	                   						pagiContentShop1.append('<li><a id="shop1page'+i+'" class="active">'+i+'</a></li>');
	                   						pagiContentShop2.append('<li><a id="shop2page'+i+'" class="active">'+i+'</a></li>');
	                   					}
	                    				else 
										{
											pagiContentShop1.append('<li><a id="shop1page'+i+'">'+i+'</a></li>');
											pagiContentShop2.append('<li><a id="shop2page'+i+'">'+i+'</a></li>');
										}
										$('#shop1page'+i).click(function(e){
											productContentShop1.empty();
											pagiContentShop1.empty();
											productContentShop2.empty();
											pagiContentShop2.empty();
											e.preventDefault();
											var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
											window.history.pushState({ path: currentURL }, '', currentURL);
											var changedCurrentPage = getUrlParameter('page')
											getInitialPage(changedCurrentPage)
										})
										$('#shop2page'+i).click(function(e){
											productContentShop1.empty();
											pagiContentShop1.empty();
											productContentShop2.empty();
											pagiContentShop2.empty();
											e.preventDefault();
											var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
											window.history.pushState({ path: currentURL }, '', currentURL);
											var changedCurrentPage = getUrlParameter('page')
											getInitialPage(changedCurrentPage)
										})
	                    			} //for
	                    		//page list

								
						}, //success function
                    	error: function(){alert("err")}
					}); //ajax
				} //getInitialPage()

				if(!tagFromProductDetail)
				{
					if(!currentPageShop)
					{
						getInitialPage(1)
					}
					else
					{
						var changedCurrentPage = getUrlParameter('page')
						getInitialPage(changedCurrentPage)
					}
				}
				else {
					getProductByTag(tagFromProductDetail,1);
				}
				
				// tag all
					$(".productTag2All").click(function(e){
						e.preventDefault();
						getInitialPage(1)
					})
				// tag all
				
				// tag
					// tag list ben trai phai tren
						$(".productTag1").click(
							function(e) 
							{
								var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;    
								window.history.pushState({ path: currentURL }, '', currentURL);
								
								e.preventDefault();
				    				
								const tagNameShop = $(this).data("tagname");
								var currentPageShop = getUrlParameter('page');
								

								getProductByTag(tagNameShop,1);
							} //function e
						)
					// tag list ben trai phai tren
					
					//	tag list ben trai o duoi
						$(".productTag2").click(
							function(e) 
							{
								var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;    
								window.history.pushState({ path: currentURL }, '', currentURL);
								
								e.preventDefault();
				    				
								const tagNameShop = $(this).data("tagname");
								var currentPageShop = getUrlParameter('page');
								
								getProductByTag(tagNameShop,1);
							} //function e
						)
					//  tag list ben trai o duoi
				// end tag
				
				// search
					function updateSearchProductResult(e){
						
						var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;    
						window.history.pushState({ path: currentURL }, '', currentURL);
						e.preventDefault();
						
						const productKey = $('#searchProductKey').val();
						
						var currentPageShop = getUrlParameter('page');
						
						productContentShop1.empty();
						pagiContentShop1.empty();
						productContentShop2.empty();
						pagiContentShop2.empty();
						
						const getProductSearchPerPage = (productKey, pageNumberShop) => {
							$.ajax({
								type: "GET",
								url: "/SmartKa/searchProduct",
								data: {
									productKey: productKey,
									page: pageNumberShop
								},
								dataType: "json",
								success: function(data) {
									
									//console.log(data);
									console.log(productKey);
									
									productContentShop1.empty();
									pagiContentShop1.empty();
									productContentShop2.empty();
									pagiContentShop2.empty();
									
									const productList = data.productList;
		                    		const currentPageShop = data.currentPage;
		                    		const totalPage = data.totalPage;
									
		                    		//product list
			                    		productList.map((item) => {
				                    		if(item.status === "Sale Items")
			                    			{
			                    				productContentShop1.append('<div class="col-lg-4 col-md-4 col-sm-6 col-12">\
			    									<div class="product-wrap mb-35" data-aos="fade-up" data-aos-delay="200">\
			    									<div class="product-img img-zoom mb-25">\
			    										<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
			    											src="assets/images/product/'+item.image+'" alt="">\
			    										</a>\
			    							        	<div class="product-badge badge-top badge-right badge-pink">\
			    											<span>-10%</span>\
			    										</div>\
			    										<div class="product-action-wrap">\
			    											<button class="product-action-btn-1" title="Wishlist">\
			    												<i class="pe-7s-like"></i>\
			    											</button>\
			    											<button class="product-action-btn-1" data-productid="'+item.id+'" id="showModalButtonShop1'+item.id+'" title="Quick View">\
																<i class="pe-7s-look"></i>\
															</button>\
			    										</div>\
			    										<div class="product-action-2-wrap">\
			    											<button data-productid="'+item.id+'" data-productid="' + item.id +'" class="product-action-btn-2" title="Add To Cart">\
			    												<i class="pe-7s-cart"></i> Add to cart\
			    											</button>\
			    										</div>\
			    									</div>\
			    									<div class="product-content">\
			    										<h3>\
			    											<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
			    										</h3>\
			    									        <div class="product-price">\
			    												<span class="old-price">$'+item.price*110/100+'</span>\
			    												<span class="new-price">$'+item.price+'</span>\
			    											</div>\
			    									</div>\
			    									</div>\
												</div>');
			                    			
												productContentShop2.append('<div class="row">\
													<div class="col-lg-4 col-sm-5">\
														<div class="product-list-img">\
															<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
																src="assets/images/product/'+item.image+'"\
																alt="Product Style">\
															</a>\
															<div class="product-list-badge badge-right badge-pink">\
																<span>-10%</span>\
															</div>\
															<div class="product-list-quickview">\
																<button data-productid="'+item.id+'" class="product-action-btn-2" title="Quick View"\
																	data-bs-toggle="modal" data-bs-target="#">\
																	<i class="pe-7s-look"></i>\
																</button>\
															</div>\
														</div>\
													</div>\
													<div class="col-lg-8 col-sm-7">\
														<div class="shop-list-content">\
															<h3>\
																<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
															</h3>\
																<div class="product-price">\
																	<span class="old-price">$'+item.price*110/100+'</span> <span\
																		class="new-price">$'+item.price+'</span>\
																</div>\
																<div class="product-price">\
																	<span>$${product.price}</span>\
																</div>\
															<div class="product-list-rating">\
																<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
																	class=" ti-star"></i> <i class=" ti-star"></i> <i\
																	class=" ti-star"></i>\
															</div>\
															<p>'+item.description+'</p>\
															<div class="product-list-action">\
																<button class="product-action-btn-3" title="Add to cart">\
																	<i class="pe-7s-cart"></i>\
																</button>\
																<button class="product-action-btn-3" title="Wishlist">\
																	<i class="pe-7s-like"></i>\
																</button>\
																<button class="product-action-btn-3" title="Compare">\
																	<i class="pe-7s-shuffle"></i>\
																</button>\
															</div>\
														</div>\
													</div>\
												</div>');
			                    			} //if
			                    		
			                    			else 
			                   				{
												productContentShop1.append('<div class="col-lg-4 col-md-4 col-sm-6 col-12">\
														<div class="product-wrap mb-35" data-aos="fade-up" data-aos-delay="200">\
														<div class="product-img img-zoom mb-25">\
															<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
																src="assets/images/product/'+item.image+'" alt="">\
															</a>\
															<div class="product-action-wrap">\
																<button class="product-action-btn-1" title="Wishlist">\
																	<i class="pe-7s-like"></i>\
																</button>\
																<button class="product-action-btn-1" data-productid="'+item.id+'" id="showModalButtonShop1'+item.id+'" title="Quick View">\
																	<i class="pe-7s-look"></i>\
																</button>\
															</div>\
															<div class="product-action-2-wrap">\
																<button data-productid="'+item.id+'" class="product-action-btn-2" title="Add To Cart">\
																	<i class="pe-7s-cart"></i> Add to cart\
																</button>\
															</div>\
														</div>\
														<div class="product-content">\
															<h3>\
																<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
															</h3>\
																<div class="product-price">\
																	<span>$'+item.price+'</span>\
																</div>\
														</div>\
													</div>\
												</div>');
			                    			
			                    				productContentShop2.append('<div class="row">\
													<div class="col-lg-4 col-sm-5">\
														<div class="product-list-img">\
															<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
																src="assets/images/product/'+item.image+'"\
																alt="Product Style">\
															</a>\
															<div class="product-list-quickview">\
																<button data-productid="'+item.id+'" class="product-action-btn-2" title="Quick View"\
																	data-bs-toggle="modal" data-bs-target="#">\
																	<i class="pe-7s-look"></i>\
																</button>\
															</div>\
														</div>\
													</div>\
													<div class="col-lg-8 col-sm-7">\
														<div class="shop-list-content">\
															<h3>\
																<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
															</h3>\
													        	<div class="product-price">\
																	<span>$'+item.price+'</span>\
																</div>\
															<div class="product-list-rating">\
																<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
																	class=" ti-star"></i> <i class=" ti-star"></i> <i\
																	class=" ti-star"></i>\
															</div>\
															<p>'+item.description+'</p>\
															<div class="product-list-action">\
																<button class="product-action-btn-3" title="Add to cart">\
																	<i class="pe-7s-cart"></i>\
																</button>\
																<button class="product-action-btn-3" title="Wishlist">\
																	<i class="pe-7s-like"></i>\
																</button>\
																<button class="product-action-btn-3" title="Compare">\
																	<i class="pe-7s-shuffle"></i>\
																</button>\
															</div>\
														</div>\
													</div>\
												</div>');
			                   				} //else
			                    		}); // end productList item
		                    	
		                    			// page list
			                    			for(let i = 1; i <= totalPage; i++) {
			                    				if(i == currentPageShop)
			                   					{
			                   						pagiContentShop1.append('<li><a id="shop1page'+i+'" class="active">'+i+'</a></li>');
			                   						pagiContentShop2.append('<li><a id="shop2page'+i+'" class="active">'+i+'</a></li>');
			                   					}
			                    				else 
												{
													pagiContentShop1.append('<li><a id="shop1page'+i+'">'+i+'</a></li>');
													pagiContentShop2.append('<li><a id="shop2page'+i+'">'+i+'</a></li>');
												}
												$('#shop1page'+i).click(function(e){
													productContentShop1.empty();
													pagiContentShop1.empty();
													productContentShop2.empty();
													pagiContentShop2.empty();
													e.preventDefault();
													var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
													window.history.pushState({ path: currentURL }, '', currentURL);
													var changedCurrentPage = getUrlParameter('page')
													getProductSearchPerPage(productKey,changedCurrentPage);
												})
												$('#shop2page'+i).click(function(e){
													productContentShop1.empty();
													pagiContentShop1.empty();
													productContentShop2.empty();
													pagiContentShop2.empty();
													e.preventDefault();
													var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
													window.history.pushState({ path: currentURL }, '', currentURL);
													var changedCurrentPage = getUrlParameter('page')
													getProductSearchPerPage(productKey,changedCurrentPage);
												})
			                    			} //for
			                    		//page list
								}, // succcess
								error: function() {alert("fail");}
							}) // ajax
						} // get product search per page function
						
						$.ajax({
							type: "GET",
							url: "/SmartKa/searchProduct",
							data: {
								productKey: productKey,
								page: 1
							},
							dataType: "json",
							success: function(data) {
								console.log(data);
								const productList = data.productList;
		                		const currentPageShop = data.currentPage;
		                		const totalPage = data.totalPage;
								
		                		//product list
		                    		productList.map((item) => {
			                    		if(item.status === "Sale Items")
		                    			{
		                    				productContentShop1.append('<div class="col-lg-4 col-md-4 col-sm-6 col-12">\
		    									<div class="product-wrap mb-35" data-aos="fade-up" data-aos-delay="200">\
		    									<div class="product-img img-zoom mb-25">\
		    										<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
		    											src="assets/images/product/'+item.image+'" alt="">\
		    										</a>\
		    							        	<div class="product-badge badge-top badge-right badge-pink">\
		    											<span>-10%</span>\
		    										</div>\
		    										<div class="product-action-wrap">\
		    											<button class="product-action-btn-1" title="Wishlist">\
		    												<i class="pe-7s-like"></i>\
		    											</button>\
		    											<button class="product-action-btn-1" data-productid="'+item.id+'" id="showModalButtonShop1'+item.id+'" title="Quick View">\
															<i class="pe-7s-look"></i>\
														</button>\
		    										</div>\
		    										<div class="product-action-2-wrap">\
		    											<button data-productid="'+item.id+'" class="product-action-btn-2" title="Add To Cart">\
		    												<i class="pe-7s-cart"></i> Add to cart\
		    											</button>\
		    										</div>\
		    									</div>\
		    									<div class="product-content">\
		    										<h3>\
		    											<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
		    										</h3>\
		    									        <div class="product-price">\
		    												<span class="old-price">$'+item.price*110/100+'</span>\
		    												<span class="new-price">$'+item.price+'</span>\
		    											</div>\
		    									</div>\
		    									</div>\
											</div>');
		                    			
											productContentShop2.append('<div class="row">\
												<div class="col-lg-4 col-sm-5">\
													<div class="product-list-img">\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
															src="assets/images/product/'+item.image+'"\
															alt="Product Style">\
														</a>\
														<div class="product-list-badge badge-right badge-pink">\
															<span>-10%</span>\
														</div>\
														<div class="product-list-quickview">\
															<button data-productid="'+item.id+'" class="product-action-btn-2" title="Quick View"\
																data-bs-toggle="modal" data-bs-target="#">\
																<i class="pe-7s-look"></i>\
															</button>\
														</div>\
													</div>\
												</div>\
												<div class="col-lg-8 col-sm-7">\
													<div class="shop-list-content">\
														<h3>\
															<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
														</h3>\
															<div class="product-price">\
																<span class="old-price">$'+item.price*110/100+'</span> <span\
																	class="new-price">$'+item.price+'</span>\
															</div>\
															<div class="product-price">\
																<span>$${product.price}</span>\
															</div>\
														<div class="product-list-rating">\
															<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
																class=" ti-star"></i> <i class=" ti-star"></i> <i\
																class=" ti-star"></i>\
														</div>\
														<p>'+item.description+'</p>\
														<div class="product-list-action">\
															<button class="product-action-btn-3" title="Add to cart">\
																<i class="pe-7s-cart"></i>\
															</button>\
															<button class="product-action-btn-3" title="Wishlist">\
																<i class="pe-7s-like"></i>\
															</button>\
															<button class="product-action-btn-3" title="Compare">\
																<i class="pe-7s-shuffle"></i>\
															</button>\
														</div>\
													</div>\
												</div>\
											</div>');
		                    			} //if
		                    		
		                    			else 
		                   				{
											productContentShop1.append('<div class="col-lg-4 col-md-4 col-sm-6 col-12">\
													<div class="product-wrap mb-35" data-aos="fade-up" data-aos-delay="200">\
													<div class="product-img img-zoom mb-25">\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
															src="assets/images/product/'+item.image+'" alt="">\
														</a>\
														<div class="product-action-wrap">\
															<button class="product-action-btn-1" title="Wishlist">\
																<i class="pe-7s-like"></i>\
															</button>\
															<button class="product-action-btn-1" data-productid="'+item.id+'" id="showModalButtonShop1'+item.id+'" title="Quick View">\
																<i class="pe-7s-look"></i>\
															</button>\
														</div>\
														<div class="product-action-2-wrap">\
															<button data-productid="'+item.id+'" class="product-action-btn-2" title="Add To Cart">\
																<i class="pe-7s-cart"></i> Add to cart\
															</button>\
														</div>\
													</div>\
													<div class="product-content">\
														<h3>\
															<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
														</h3>\
															<div class="product-price">\
																<span>$'+item.price+'</span>\
															</div>\
													</div>\
												</div>\
											</div>');
		                    			
		                    				productContentShop2.append('<div class="row">\
												<div class="col-lg-4 col-sm-5">\
													<div class="product-list-img">\
														<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'"> <img\
															src="assets/images/product/'+item.image+'"\
															alt="Product Style">\
														</a>\
														<div class="product-list-quickview">\
															<button data-productid="'+item.id+'" class="product-action-btn-2" title="Quick View"\
																data-bs-toggle="modal" data-bs-target="#">\
																<i class="pe-7s-look"></i>\
															</button>\
														</div>\
													</div>\
												</div>\
												<div class="col-lg-8 col-sm-7">\
													<div class="shop-list-content">\
														<h3>\
															<a href="/SmartKa/product?id='+item.id+'&&tag='+item.tag+'">'+item.name+'</a>\
														</h3>\
												        	<div class="product-price">\
																<span>$'+item.price+'</span>\
															</div>\
														<div class="product-list-rating">\
															<i class=" ti-star"></i> <i class=" ti-star"></i> <i\
																class=" ti-star"></i> <i class=" ti-star"></i> <i\
																class=" ti-star"></i>\
														</div>\
														<p>'+item.description+'</p>\
														<div class="product-list-action">\
															<button class="product-action-btn-3" title="Add to cart">\
																<i class="pe-7s-cart"></i>\
															</button>\
															<button class="product-action-btn-3" title="Wishlist">\
																<i class="pe-7s-like"></i>\
															</button>\
															<button class="product-action-btn-3" title="Compare">\
																<i class="pe-7s-shuffle"></i>\
															</button>\
														</div>\
													</div>\
												</div>\
											</div>');
		                   				} //else
		                    		}); // end productList item
		                	
		                			// page list
		                    			for(let i = 1; i <= totalPage; i++) {
		                    				if(i == currentPageShop)
		                   					{
		                   						pagiContentShop1.append('<li><a id="shop1page'+i+'" class="active">'+i+'</a></li>');
		                   						pagiContentShop2.append('<li><a id="shop2page'+i+'" class="active">'+i+'</a></li>');
		                   					}
		                    				else 
											{
												pagiContentShop1.append('<li><a id="shop1page'+i+'">'+i+'</a></li>');
												pagiContentShop2.append('<li><a id="shop2page'+i+'">'+i+'</a></li>');
											}
											$('#shop1page'+i).click(function(e){
												productContentShop1.empty();
												pagiContentShop1.empty();
												productContentShop2.empty();
												pagiContentShop2.empty();
												e.preventDefault();
												var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
												window.history.pushState({ path: currentURL }, '', currentURL);
												var changedCurrentPage = getUrlParameter('page')
												getProductSearchPerPage(productKey,changedCurrentPage);
											})
											$('#shop2page'+i).click(function(e){
												productContentShop1.empty();
												pagiContentShop1.empty();
												productContentShop2.empty();
												pagiContentShop2.empty();
												e.preventDefault();
												var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
												window.history.pushState({ path: currentURL }, '', currentURL);
												var changedCurrentPage = getUrlParameter('page')
												getProductSearchPerPage(productKey,changedCurrentPage);
											})
		                    			} //for
		                    		//page list
							}, // succcess
							error: function() {alert("fail");}
						}) // ajax	
					} // function : update search product result
					const searchProductKey = document.getElementById("searchProductKey");
					searchProductKey.addEventListener('input', updateSearchProductResult);
				// end search
			}) //document ready end
</script>