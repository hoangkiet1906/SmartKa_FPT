<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="blog-details-area pt-100 pb-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog-details-wrapper">
					<div class="blog-details-img-date-wrap mb-35" data-aos="fade-up"
						data-aos-delay="200">
						<div class="blog-details-img">
							<img src="assets/images/blog/${blogdetail.image }" alt="">
						</div>
						<div class="blog-details-date">
							<h5>
								${blogdetail.day } <span>${blogdetail.month }</span>
							</h5>
						</div>
					</div>
					<div class="blog-meta-2" data-aos="fade-up" data-aos-delay="200">
						<ul>
							<li><a href="blog">${blogdetail.tag }</a>,</li>
							<li>By:<a href="#"> ${blogdetail.author }</a></li>
						</ul>
					</div>
					<h1 data-aos="fade-up" data-aos-delay="200">${blogdetail.title }.</h1>
					<p data-aos="fade-up" data-aos-delay="200">${blogdetail.ct1 }.</p>
					
					<p data-aos="fade-up" data-aos-delay="200">${blogdetail.ct2 }.</p>
					<div class="blog-details-middle-img-wrap">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-12">
								<div class="blog-details-middle-img mb-30" data-aos="fade-up"
									data-aos-delay="200">
									<img src="assets/images/blog/${blogdetail.img1 }" alt="">
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-12">
								<div class="blog-details-middle-img mb-30" data-aos="fade-up"
									data-aos-delay="400">
									<img src="assets/images/blog/${blogdetail.img2 }" alt="">
								</div>
							</div>
						</div>
					</div>
					<p data-aos="fade-up" data-aos-delay="200">${blogdetail.ct3 }.</p>
					<div class="tag-social-wrap">
						<div class="tag-wrap" data-aos="fade-up" data-aos-delay="200">
							<span>Tags:</span>
							<ul>
								<li><a href="#">${blogdetail.tag }</a></li>								
							</ul>
						</div>
						<div class="social-comment-digit-wrap" data-aos="fade-up"
							data-aos-delay="400">
							<div class="social-icon-style-2">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-dribbble"></i></a> <a href="#"><i
									class="fa fa-pinterest-p"></i></a>
							</div>
							<div class="comment-digit">
								<a href="#">2 <i class="fa fa-comments"></i></a>
							</div>
						</div>
					</div>
					
					<div class="blog-next-previous-post" data-aos="fade-up"
						data-aos-delay="200">
						<div class="blog-prev-post-wrap">
						<c:set var = "previd" value = "${prevbid}"/>
							<div class="blog-prev-post-icon">
								<a href="/SmartKa/blogdetails?bid=${previd }"><i class="fa fa-angle-left"></i></a>
							</div>
							<div class="blog-prev-post-content">
								<h3>
								<c:set var = "prevtitle" value = "${prevBlogTitle}"/>
									<a href="/SmartKa/blogdetails?bid=${previd }">${prevtitle }</a>
								</h3>
								<c:set var = "prevdate" value = "${prevBlogDate}"/>
								<span>${prevdate }</span>
							</div>
						</div>
						<div class="blog-next-post-wrap">
						<c:set var = "nextid" value = "${nextbid}"/>					
							<div class="blog-next-post-icon">
								<a href="/SmartKa/blogdetails?bid=${nextid }"> <i class="fa fa-angle-right"></i>
								</a>
							</div>
							<div class="blog-next-post-content">
								<h3>
								<c:set var = "nexttitle" value = "${nextBlogTitle}"/>
									<a href="/SmartKa/blogdetails?bid=${previd }">${nexttitle }</a>
								</h3>
								<c:set var = "nextdate" value = "${nextBlogDate}"/>
								<span>${nextdate }</span>
							</div>
						</div>
					</div>
					
					<div class="blog-comment-wrapper">
						<h4 class="blog-dec-title" data-aos="fade-up" data-aos-delay="200">Comments</h4>
					</div>
					<input type="hidden" id="comment_blog_id" value="${idblog }">
					<!-- ajax id blog -->
					
					<div id="showCmtBlog" class="blog-comment-wrapper">
						<!-- load cmt -->
					</div>
					
					<c:if test="${sessionScope.username != null}">
						<div class="blog-comment-form-wrap">
							<div class="blog-comment-form">
								<form action="">
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<div class="single-blog-comment-form" data-aos="fade-up"
												data-aos-delay="500">
												<textarea id="cmtBlogcontent" placeholder="Comment"></textarea>
											</div>
										</div>
										<div class="col-lg-12 col-md-12">
											<div class="comment-submit-btn btn-hover">
												<button  onclick="return false;" class="submit" type="button" id="sendCmtBlog"  >
													Post Comment <i class=" ti-arrow-right"></i>
												</button>
												
											</div>
										</div>
										
									</div>
								</form>
								
							</div>
						</div>
					</c:if>
					
					
				</div>
			</div>
			<div class="col-lg-4">
				<div class="sidebar-wrapper blog-sidebar-mt">
					
					<div class="sidebar-widget mb-50" data-aos="fade-up"
						data-aos-delay="200">
						<div class="blog-author-content text-center">
							<a href="blog-details.html"><img
								src="assets/images/blog/blog-author.png" alt=""></a>
							<h2>Writer Name</h2>
							<h4>Blog Writer</h4>
							<div class="social-icon-style-1">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-dribbble"></i></a> <a href="#"><i
									class="fa fa-pinterest-p"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-glide-g"></i></a>
							</div>
						</div>
					</div>
					<div class="sidebar-widget mb-40" data-aos="fade-up"
						data-aos-delay="200">
						<div class="sidebar-widget-title-2 mb-25">
							<h3>Categories</h3>
						</div>
						<div class="sidebar-list-style-2">
							<ul>
								<li><a href="blog-sidebar.html">Blog Grid View (09)</a></li>
								<li><a href="blog-sidebar.html">Latest blog (02)</a></li>
								<li><a href="blog-sidebar.html">Our Blog (12)</a></li>
								<li><a href="blog-sidebar.html">Uncategorized (107)</a></li>
							</ul>
						</div>
					</div>
					<div class="sidebar-widget mb-40" data-aos="fade-up"
						data-aos-delay="200">
						<div class="sidebar-widget-title-2 mb-30">
							<h3>Latest Post</h3>
						</div>
						<div class="latest-post-wrap">
							<c:forEach  var="lblog" items="${latestBlog }" >
							<div class="single-latest-post">
								<div class="latest-post-img">
									<a href="/SmartKa/blogdetails?bid=${lblog.idblog }"><img alt="blogimage1" src="<c:url value="assets/images/blog/${lblog.image}" />"></a>
								</div>
								<div class="latest-post-content">
									<span>${lblog.day } ${lblog.month } ${lblog.year }</span>
									<h4>
										<a href="/SmartKa/blogdetails?bid=${lblog.idblog }">${lblog.title }</a>
									</h4>
									<div class="latest-post-btn">
										<a href="/SmartKa/blogdetails?bid=${lblog.idblog }">Continue Reading...</a>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
					<div class="sidebar-widget mb-35" data-aos="fade-up"
						data-aos-delay="200">
						<div class="sidebar-widget-title-2 mb-30">
							<h3>Tags</h3>
						</div>
						<div class="sidebar-widget-tag-2">
							<c:forEach var="atag" items="${blogTag }">
							<a href="blog.html" class="blogTag" data-tagname="${atag}"> ${atag }</a>
							</c:forEach>
						</div>
					</div>
					<div class="sidebar-widget" data-aos="fade-up" data-aos-delay="200">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		
<!-- Comment handle -->
<script type="text/javascript">
		
	// get cmt
	const getCmtBlog = () => {
		var idblog = $('#comment_blog_id').val();
		$.ajax({
			type: "get",
			url: "/SmartKa/getAllCmtBlog",
			data: {
                   idblog: idblog,
               },
			dataType: "json",
			success: function (data) {
				if (data.success) {
					localStorage.setItem("cmtBlog", JSON.stringify(data.object));
					console.log("success datta");
				} else {
					localStorage.removeItem("cmtBlog");
				}
			}
		});
	}
	getCmtBlog();
	
	
	// Show cmt
	const showCmtBlog = (cmt) => {
		if (cmt != null) {
			cmt.map((item) => {
				const element = 
					"<div  class='single-comment-wrapper single-comment-border' data-aos='fade-up' data-aos-delay='400'>"
		        +	  	"<div class='blog-comment-img'>"
		        +			"<img alt='' src='assets/images/avatar/" + item.avt +"'/>"
		        +		"</div>"
		        +		"<div class='blog-comment-content'>"
		        +			"<div class='comment-info-reply-wrap'>"
		        +				"<div class='comment-info'>"
		        +			    	"<span>" + item.date + "</span>"
		        + 			    	"<h4>" + item.username + "</h4>"
		        +				"</div>"
				+        	"</div>"
				+    	    "<p>" + item.content +"</p>"
				+    	"</div>"
				+    "</div>"  ;
			
				
				$("#showCmtBlog").append(element);
			})
		}  
	}
	
	// add cmt Blog into db
	const addCmtBlog = (cmt) => {
		
		var idblog = $('#comment_blog_id').val();
		var content = $('#cmtBlogcontent').val();
		$.ajax({
			type: "get",
			url: "/SmartKa/addCmtBlog",
			data: {
                   idblog: idblog,
                   content:content
               },
			dataType: "json",
			success: function (data) {
				if (data.success) {
					const item = data.object;
					if (item != null) {
						cmt.push(item);
						const newElement = 
							"<div  class='single-comment-wrapper single-comment-border' data-aos='fade-up' data-aos-delay='400'>"
				        +	  	"<div class='blog-comment-img'>"
				        +			"<img alt='' src='assets/images/avatar/" + item.avt +"'/>"
				        +		"</div>"
				        +		"<div class='blog-comment-content'>"
				        +			"<div class='comment-info-reply-wrap'>"
				        +				"<div class='comment-info'>"
				        +			    	"<span>" + item.date + "</span>"
				        + 			    	"<h4>" + item.username + "</h4>"
				        +				"</div>"
						+        	"</div>"
						+    	    "<p>" + item.content +"</p>"
						+    	"</div>"
						+    "</div>"  ;
						
						
						$("#showCmtBlog").append(newElement);
					}  
				} else {
					swal("Error", "OOPS! Somthing went wrong", "error")
				}
			}
		});
		
	}
	
	$(document).ready(function () {
		console.log("dayy")
		const cmtBlog = () => {
			return JSON.parse(localStorage.getItem("cmtBlog"));
		}
		const list = cmtBlog();
		showCmtBlog(list);
		
		$("#sendCmtBlog").click(function () {
			addCmtBlog(list); 
		})
	});

	
</script>