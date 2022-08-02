<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="blog-area pt-100 pb-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row" id="content">
				<c:forEach var="blog" items="${blogList }" >				
					<div class="col-md-6">
						<div class="blog-wrap mb-50" data-aos="fade-up"
							data-aos-delay="200">
							<div class="blog-img-date-wrap mb-25">
								<div class="blog-img">
									<a href="blog-details.html"><img
										src="<c:url value="assets/images/blog/${blog.image}" />" alt="blog image 1"></a>
								</div>
								<div class="blog-date">
									<h5>
										${blog.day }<br>${blog.month}
									</h5>
								</div>
							</div>
							<div class="blog-content">
								<div class="blog-meta">
									<ul>
										<li><a href="#">${blog.tag }</a>,</li>
										<li>By:<a href="#"> ${blog.author }</a></li>
									</ul>
								</div>
								<h3>
									<a href="blog-details.html">${blog.title }</a>
								</h3>
								<p>${blog.content }</p>
								<div class="blog-btn-2 btn-hover">
									<a class="btn hover-border-radius theme-color"
										href="blog-details.html">Read More</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<div class="pagination-style-1" data-aos="fade-up"
					data-aos-delay="200">
					<c:set var="endP" value="${endPage}"/>
							<ul id="pageLoader">
							
							</ul>	
				</div>
			
			</div>
			<div class="col-lg-4">
				<div class="sidebar-wrapper">
					<div class="sidebar-widget mb-50" data-aos="fade-up"
						data-aos-delay="200">
						<div class="search-wrap-3">
						<form id="searchBlogForm" method="post" class="search-3-form">
								<input id="searchBlogKey" name="keytxt" placeholder="Search*" type="text" >
								<button type="submit" class="button-search">
									<i class="fa fa-search"></i>
								</button>
						</form>
						</div>
					</div>
					<div class="sidebar-widget mb-50" data-aos="fade-up"
						data-aos-delay="200">
						<div class="blog-author-content text-center">
							<a href="#"><img src="assets/images/blog/blog-author.png"
								alt=""></a>
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
								<li><a href="#">Blog Grid View (09)</a></li>
								<li><a href="#">Latest blog (02)</a></li>
								<li><a href="#">Our Blog (12)</a></li>
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
							<a class="blogTag" data-tagname="${atag}"> ${atag }</a>
							</c:forEach>
						</div>
					</div>
						
					</div>
				</div>
		</div>
	</div>
</div>

	<!-- Main JS -->
	<script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
	<script src="assets/js/vendor/jquery-migrate-3.3.2.min.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	//LOAD BLOG 
	$(document).ready(function() {
		var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;    
		window.history.pushState({ path: currentURL }, '', currentURL);
		var currentPage = getUrlParameter('page')
		const contentRow = $("#content")
		const pagination = $("#pageLoader")
		const distributePage = () => {
			$.ajax({
				type: "GET",
				url: "/SmartKa/getblog",
				data: {
					
				},
				contentType:false,
				dataType: "json",
				success:function(data) {
					const page = data.noPage
					pagination.empty();
					for(let i = 1; i <= page;i++) {					
						if(i==1) {
							const pagebean = "<li><a class='active' id='blogpageid"+i+"'"+
							"href='?page="+i+"'>"+i+"</a>"
							+
							"</li>"
							pagination.append(pagebean)	
						}else {
							const pagebean = "<li><a id='blogpageid"+i+"'"+
							"href='?page="+i+"'>"+i+"</a>"
							+
							"</li>"
							pagination.append(pagebean)	
						}					
					$("#blogpageid"+i).click(function(e) {
					contentRow.empty()
					e.preventDefault()
					var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
					window.history.pushState({ path: currentURL }, '', currentURL);
					var changedCurrentPage = getUrlParameter('page')
					getBlogPerPage(changedCurrentPage)
					for(let n =1;n<=page;n++) {
						if(n==changedCurrentPage) {
							$("#blogpageid"+n).last().addClass("active")
						}else{
							$("#blogpageid"+n).last().removeClass("active")
						}	
					}

								
				})
				}
				},
			})
		}
		const getBlogPerPage = (pageNumber) => {
			$.ajax({
				type: "GET",
				url: "/SmartKa/getblog",
				data: {
				page: pageNumber
				},
				contentType:false,
				dataType: "json",
				success: function (data) {
					
					const blogList = data.blogList
					var blogdata = ""
					blogList.map((item) => {
						const bean = " <input type='hidden' class='blogID' data-blogid='"+item.id+"'>"
							+"<div class='col-md-6'>"
							+
							"<div class='blog-wrap mb-50' data-aos='fade-up'"
							+
								"data-aos-delay='5000'>"
								+
								"<div class='blog-img-date-wrap mb-25'>"
								+
									"<div class='blog-img'>"
									+
										"<a href='blogdetails?bid="+item.idblog+"'><img alt=" + item.title + " src='<c:url value='assets/images/blog/"+ item.image +"'/>'></a>"
											+
									"</div>"+
									"<div class='blog-date'>"+
										"<h5>"
										+ item.day +"<br>"+item.month+
										"</h5>"+
									"</div>"+
								"</div>"+
								"<div class='blog-content'>"+
									"<div class='blog-meta'>"+
										"<ul>"+
											"<li><a class='blogTag' data-tagname='"+item.tag+"'>"+item.tag+"</a>,</li>"
											+
											"<li>By:<a href='#'>"+item.author+"</a></li>"+
										"</ul>"+
									"</div>"+
									"<h3>"+
										"<a href='blogdetails?bid="+item.idblog+"'>"+item.title+"</a>"+
									"</h3>"+
									"<p>"+item.content+"</p>"+
									"<div class='blog-btn-2 btn-hover'>"+
										"<a class='btn hover-border-radius theme-color'"+
										
											"href='blogdetails?bid="+item.idblog+"'>Read More</a>"
									"</div>"+ 
								"</div>"+
							"</div>"+
						"</div>/n";
						contentRow.append(bean)

						setEventForTags();
					})
			
				}
		})
		}
	
		if(!currentPage) {
			getBlogPerPage(1)
			distributePage()
		}else {
			var changedCurrentPage = getUrlParameter('page')
			getBlogPerPage(changedCurrentPage)
			distributePage()

		}
		
	})
	//SEARCH BLOG
	function updateSearchResult(e) {
		var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;    
		window.history.pushState({ path: currentURL }, '', currentURL);
		e.preventDefault()
		const key = $("#searchBlogKey").val()
		var currentPage = getUrlParameter('page')
		const contentRow = $("#content")
		const pagination = $("#pageLoader")
			const getBlogPerPage = (key,pageNumber) => {
			$.ajax({
				type: "GET",
				url: "/SmartKa/searchblog",
				data: {
				keytxt: key,
				page: pageNumber
				},
				contentType:false,
				dataType: "json",
				success: function (data) {
					
					const blogList = data.blogList
					var blogdata = ""
					blogList.map((item) => {
						const bean = "<div class='col-md-6'>"
							+
							"<div class='blog-wrap mb-50' data-aos='fade-up'"
							+
								"data-aos-delay='5000'>"
								+
								"<div class='blog-img-date-wrap mb-25'>"
								+
									"<div class='blog-img'>"
									+
										"<a href=''blogdetails?bid="+item.idblog+"''><img alt=" + item.title + " src='<c:url value='assets/images/blog/"+ item.image +"'/>'></a>"
											+
									"</div>"+
									"<div class='blog-date'>"+
										"<h5>"
										+ item.day +"<br>"+item.month+
										"</h5>"+
									"</div>"+
								"</div>"+
								"<div class='blog-content'>"+
									"<div class='blog-meta'>"+
										"<ul>"+
											"<li><a class='blogTag' data-tagname='"+item.tag+"'>"+item.tag+"</a>,</li>"
											+
											"<li>By:<a href='#'>"+item.author+"</a></li>"+
										"</ul>"+
									"</div>"+
									"<h3>"+
										"<a href='#'>"+item.title+"</a>"+
									"</h3>"+
									"<p>"+item.content+"</p>"+
									"<div class='blog-btn-2 btn-hover'>"+
										"<a class='btn hover-border-radius theme-color'"+
										
											"href='blogdetails?bid="+item.idblog+"'>Read More</a>"
									"</div>"+ 
								"</div>"+
							"</div>"+
						"</div>/n";
						contentRow.append(bean)
					})
			
				}
		})
		}
		
		
		$.ajax({
			type:"GET",
			url: "/SmartKa/searchblog",
			data: {
				keytxt : key,
			},
			contentType:false,
			dataType: "json",
			success: function (data) {
				const page = data.noPage
				if(data==null || data.blogList.length==0) {
					contentRow.empty()   
					contentRow.append("<h1>No Blog Found!!</h1>")
					pagination.empty()
				}
				else {
					contentRow.empty() 
					const blogList = data.blogList
					var blogdata = ""
					blogList.map((item) => {
						const bean = "<div class='col-md-6'>"
							+
							"<div class='blog-wrap mb-50' data-aos='fade-up'"
							+
								"data-aos-delay='5000'>"
								+
								"<div class='blog-img-date-wrap mb-25'>"
								+
									"<div class='blog-img'>"
									+
										"<a href='blogdetails?bid="+item.idblog+"'><img alt=" + item.title + " src='<c:url value='assets/images/blog/"+ item.image +"'/>'></a>"
											+
									"</div>"+
									"<div class='blog-date'>"+
										"<h5>"
										+ item.day +"<br>"+item.month+
										"</h5>"+
									"</div>"+
								"</div>"+
								"<div class='blog-content'>"+
									"<div class='blog-meta'>"+
										"<ul>"+
											"<li><a class='blogTag' data-tagname='"+item.tag+"'>"+item.tag+"</a>,</li>"
											+
											"<li>By:<a href='#'>"+item.author+"</a></li>"+
										"</ul>"+
									"</div>"+
									"<h3>"+
										"<a href='#'>"+item.title+"</a>"+
									"</h3>"+
									"<p>"+item.content+"</p>"+
									"<div class='blog-btn-2 btn-hover'>"+
										"<a class='btn hover-border-radius theme-color'"+
										
											"href='blogdetails?bid="+item.idblog+"'>Read More</a>"
									"</div>"+ 
								"</div>"+
							"</div>"+
						"</div>/n";
						contentRow.append(bean)
					})
					pagination.empty();
					for(let i = 1; i <= page;i++) {					
						if(i==1) {
							const pagebean = "<li><a class='active' id='blogpageid"+i+"'"+
							"href='?page="+i+"'>"+i+"</a>"
							+
							"</li>"
							pagination.append(pagebean)	
						}else {
							const pagebean = "<li><a id='blogpageid"+i+"'"+
							"href='?page="+i+"'>"+i+"</a>"
							+
							"</li>"
							pagination.append(pagebean)	
						}					
						$("#blogpageid"+i).click(function(e) {
						contentRow.empty()
						e.preventDefault()
						var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
						window.history.pushState({ path: currentURL }, '', currentURL);
						var changedCurrentPage = getUrlParameter('page')
						getBlogPerPage(key,changedCurrentPage)
						for(let n =1;n<=page;n++) {
							if(n==changedCurrentPage) {
								$("#blogpageid"+n).last().addClass("active")
							}else{
								$("#blogpageid"+n).last().removeClass("active")
							}	
						}
	
									
					})
				}
					}
		
			},
		})
		
	}
	const searchblogfield = document.getElementById("searchBlogKey")
	searchblogfield.addEventListener('input', updateSearchResult)
	//SEARCH BLOG TAG 
	const setEventForTags = () => {
		$(".blogTag").click(function(e) {
			var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;    
			window.history.pushState({ path: currentURL }, '', currentURL);
			e.preventDefault()
			const tagName = $(this).data("tagname")
			var currentPage = getUrlParameter('page')
			const contentRow = $("#content")
			const pagination = $("#pageLoader")
			const getBlogPerPage = (tagname,pageNumber) => {
				$.ajax({
					type: "GET",
					url: "/SmartKa/tagblog",
					data: {
					tag: tagname,
					page: pageNumber
					},
					contentType:false,
					dataType: "json",
					success: function (data) {
						
						const blogList = data.blogList
						var blogdata = ""
						blogList.map((item) => {
							const bean = "<div class='col-md-6'>"
								+
								"<div class='blog-wrap mb-50' data-aos='fade-up'"
								+
									"data-aos-delay='5000'>"
									+
									"<div class='blog-img-date-wrap mb-25'>"
									+
										"<div class='blog-img'>"
										+
											"<a href='blogdetails?bid="+item.idblog+"'><img alt=" + item.title + " src='<c:url value='assets/images/blog/"+ item.image +"'/>'></a>"
												+
										"</div>"+
										"<div class='blog-date'>"+
											"<h5>"
											+ item.day +"<br>"+item.month+
											"</h5>"+
										"</div>"+
									"</div>"+
									"<div class='blog-content'>"+
										"<div class='blog-meta'>"+
											"<ul>"+
												"<li><a class='blogTag' data-tagname='"+item.tag+"'>"+item.tag+"</a>,</li>"
												+
												"<li>By:<a href='#'>"+item.author+"</a></li>"+
											"</ul>"+
										"</div>"+
										"<h3>"+
											"<a href='#'>"+item.title+"</a>"+
										"</h3>"+
										"<p>"+item.content+"</p>"+
										"<div class='blog-btn-2 btn-hover'>"+
											"<a class='btn hover-border-radius theme-color'"+
											
												"href='blogdetails?bid="+item.idblog+"'>Read More</a>"
										"</div>"+ 
									"</div>"+
								"</div>"+
							"</div>/n";
							contentRow.append(bean)
						})
				
					}
			})
			}
			$.ajax({
				type:"GET",
				url: "/SmartKa/tagblog",
				data: {
					tag : tagName,
					page:null
				},
				contentType:false,
				dataType: "json",
				success: function (data) {
					const page = data.noPage
						contentRow.empty() 
						const blogList = data.blogList
						var blogdata = ""
						blogList.map((item) => {
							const bean = "<div class='col-md-6'>"
								+
								"<div class='blog-wrap mb-50' data-aos='fade-up'"
								+
									"data-aos-delay='5000'>"
									+
									"<div class='blog-img-date-wrap mb-25'>"
									+
										"<div class='blog-img'>"
										+
											"<a href='blogdetails.html'><img alt=" + item.title + " src='<c:url value='assets/images/blog/"+ item.image +"'/>'></a>"
												+
										"</div>"+
										"<div class='blog-date'>"+
											"<h5>"
											+ item.day +"<br>"+item.month+
											"</h5>"+
										"</div>"+
									"</div>"+
									"<div class='blog-content'>"+
										"<div class='blog-meta'>"+
											"<ul>"+
												"<li><a href='#'>"+item.tag+"</a>,</li>"
												+
												"<li>By:<a href='#'>"+item.author+"</a></li>"+
											"</ul>"+
										"</div>"+
										"<h3>"+
											"<a href='#'>"+item.title+"</a>"+
										"</h3>"+
										"<p>"+item.content+"</p>"+
										"<div class='blog-btn-2 btn-hover'>"+
											"<a class='btn hover-border-radius theme-color'"+
											
												"href='blogdetails.html'>Read More</a>"
										"</div>"+ 
									"</div>"+
								"</div>"+
							"</div>/n";
							contentRow.append(bean)
						})
						pagination.empty();
						for(let i = 1; i <= page;i++) {					
							if(i==1) {
								const pagebean = "<li><a class='active' id='blogpageid"+i+"'"+
								"href='?page="+i+"'>"+i+"</a>"
								+
								"</li>"
								pagination.append(pagebean)	
							}else {
								const pagebean = "<li><a id='blogpageid"+i+"'"+
								"href='?page="+i+"'>"+i+"</a>"
								+
								"</li>"
								pagination.append(pagebean)	
							}					
							$("#blogpageid"+i).click(function(e) {
							contentRow.empty()
							e.preventDefault()
							var currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?page='+i;    
							window.history.pushState({ path: currentURL }, '', currentURL);
							var changedCurrentPage = getUrlParameter('page')
							getBlogPerPage(tagName,changedCurrentPage)
							for(let n =1;n<=page;n++) {
								if(n==changedCurrentPage) {
									$("#blogpageid"+n).last().addClass("active")
								}else{
									$("#blogpageid"+n).last().removeClass("active")
								}	
							}
		
										
						})
					}
						
			
				}
			})
		})
		
	}

	setEventForTags();
	</script>