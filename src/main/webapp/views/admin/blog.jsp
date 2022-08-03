<!-- Content Wrapper. Contains page content -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Blog Management</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Add Blog</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<!-- TO DO List -->
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">
								<i class="ion ion-clipboard mr-1"></i> Blog List
							</h3>

							<div class="card-tools">

								<ul class="pagination pagination-sm">
									<li class="page-item"> <a href="" class="page-link">&laquo;</a> </li>
									<li class="page-item"> <a href="blog?page=1" class="page-link">1</a></li>
									<li class="page-item"> <a href="blog?page=2" class="page-link">2</a></li>
									<li class="page-item"> <a href="" class="page-link">&raquo;</a></li>
								</ul>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<ul class="todo-list" data-widget="todo-list">
								<c:forEach var="blog" items="${blogs}" begin="${begin}" end="${begin+5}">
									<li>
										
										<!-- checkbox --> 
										<c:if test="${blog.status=='1' }">
											<input type="checkbox" value="" name="todo1" id="todoCheck1" class="check-status" data-checkstatus="${blog.idblog}">
										</c:if>
										<c:if test="${blog.status=='0'}">
												<input type="checkbox" value=""  name="todo1" id="todoCheck1" checked class="check-status" data-checkstatus="${blog.idblog}"> 
										</c:if> 
										<label for="todoCheck1"></label>
											
										<span class="text" style="display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 55%; vertical-align: top">
											${blog.title}
										</span>
										<small class="badge badge-danger" >
											<i class="far fa-clock"></i>
											<c:set var="date" value="${blog.date}"/>
											${fn:substring(date, 0, 10)} 
										</small>
										<div class="tools" style="margin-top:-5px ;">
											<form action="delete-blog" method="POST">
												<button type="submit" class="btn text-danger"
													id="deleteblog" name="deleteblog"
													value="${blog.idblog}">
													<i class="far fa-trash-alt"></i>
												</button>

												<button type="button" class="btn text-danger p-0"
													data-toggle="modal" data-target="#m${blog.idblog}">
													<i class="fas fa-edit"></i>
												</button>
											</form>
											<i class="fas fa-trash-o"></i>
										</div>

									</li>
									<div class="modal" id="m${blog.idblog}">
										
										<div class="modal-dialog">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">Update Blog</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<form id="formUpdate" method="POST">
													<input type="hidden" name="idblog" value="${blog.idblog }">
													
													<div class="modal-body">
														<h5>Blog</h5>
														<div class="form-group">
															<label for="">Title</label> 
															<input type="text" class="form-control" name="uptitle"
																value="${blog.title}">
														</div>

														<div class="form-group">
															<label for="">Content</label>
															<textarea class="form-control" name="upcontent" rows="5">${blog.content}</textarea>
														</div>

														<div class="form-group">
															<label for="">Tag</label> 
															<input type="text" class="form-control" name="uptag" value="${blog.tag }">
														</div>
														
														<div class="form-group">
															<label for="">Image</label> <br> 
															<input type="file" id="upimage" accept=".jpg" name="upimage" />
														</div>

														<h5>Blog Detail</h5>
														<div class="form-group">
															<label for="">Content 1</label><br>
															<textarea class="form-control" name="upcontent1"
																id="upcontent1" 
																placeholder="Enter detailed content 1 for the blog"
																rows="5">${blog.ct1 }</textarea>
														</div>
														
														<div class="form-group">
															<label for="">Content 2</label>
															<textarea class="form-control" name="upcontent2"
																id="upcontent2" 
																placeholder="Enter detailed content 2 for the blog"
																rows="5">${blog.ct2}</textarea>
														</div>
														
														<div class="form-group">
															<label for="">Content 3</label>
															<textarea class="form-control" name="upcontent3"
																id="upcontent3"
																placeholder="Enter detailed content 3 for the blog"
																rows="5">${blog.ct3}</textarea>

														</div>
														<div class="form-group">
															<label for="">Image 1</label> <br> <input
																type="file" name="upimage1" id="upimage1" accept=".jpg" />
														</div>
														<div class="form-group">
															<label for="">Image 2</label> <br> <input
																type="file" name="upimage2" id="upimage2" accept=".jpg" />
														</div>
													</div>

													<!-- Modal footer"  onclick="sendUpdate()"-->
													<div class="modal-footer">
														<button type="submit" id="updateBlog" class=" btn btn-primary">Update</button>
														<button type="button" class="btn btn-danger"
															data-dismiss="modal">Close</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<!-- /.col-md-6 -->
				<div class="col-lg-6">

					<div class="card" style="height: 360px;">
						<div class="card-header border-0">
							<h3 class="card-title">OVERVIEW</h3>
						</div>
						<div class="card-body">
							<div
								class="d-flex justify-content-between align-items-center border-bottom mb-3">
								<p class="text-success text-xl">
									<i class="ion ion-ios-book-outline"></i>
								</p>
								<p class="d-flex flex-column text-right">
									<span class="font-weight-bold"> <i
										class="ion ion-android-arrow-up text-success"></i> 14%
									</span> <span class="text-muted">Post Rate</span>
								</p>
							</div>
							<!-- /.d-flex -->
							<div
								class="d-flex justify-content-between align-items-center border-bottom mb-3">
								<p class="text-warning text-xl">
									<i class="ion ion-ios-eye-outline" style="font-size: 42px"></i>
								</p>
								<p class="d-flex flex-column text-right">
									<span class="font-weight-bold"> <i
										class="ion ion-android-arrow-up text-warning"></i> 5%
									</span> <span class="text-muted">User View Rate</span>
								</p>
							</div>
							<!-- /.d-flex -->
							<div
								class="d-flex justify-content-between align-items-center mb-0">
								<p class="text-danger text-xl">
									<i class="ion ion-ios-people-outline"></i>
								</p>
								<p class="d-flex flex-column text-right">
									<span class="font-weight-bold"> <i
										class="ion ion-android-arrow-down text-danger"></i> 4%
									</span> <span class="text-muted">User Comment Rate</span>
								</p>
							</div>
							<!-- /.d-flex -->
						</div>
					</div>
				</div>
				<!-- /.col-md-6 -->
			</div>

			<!-- /.col-md-12 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header border-0">
							<h3 class="card-title">
								<b>Add Blog</b>
							</h3><br>
							<div class="card-body">

								<form action="insert-blog" method="POST">

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Title</label> <input type="text" name="title"
													class="form-control" id="title" placeholder="Enter title"
													required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Tag</label> <input type="text" name="tag"
													class="form-control" id="tag" placeholder="Enter tag">
											</div>
										</div>
									</div>

									<div class="form-group">
										<label for="">Content</label>
										<textarea class="form-control" name="content" id="content"
											required placeholder="Enter detailed content  for the blog"
											rows="5"></textarea>
									</div>

									<div class="form-group">
										<label for="">Image</label> <br> <input type="file"
											id="image" name="image" accept=".jpg" required />
									</div>

									<p>
									<h5>Blog Detail</h5>
									</p>
									<div class="form-group">
										<label for="">Content 1</label><br>
										<textarea class="form-control" name="content1" id="content1"
											 placeholder="Enter detailed content 1 for the blog"
											rows="5"></textarea>
									</div>
									<div class="form-group">
										<label for="">Content 2</label>
										<textarea class="form-control" name="content2" id="content2"
											 placeholder="Enter detailed content 2 for the blog"
											rows="5"></textarea>

									</div>
									<div class="form-group">
										<label for="">Content 3</label>
										<textarea class="form-control" name="content3" id="conten3"
											 placeholder="Enter detailed content 3 for the blog"
											rows="5"></textarea>

									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Image 1</label> <br> <input type="file"
													name="image1" id="image1" accept=".jpg"  />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Image 2</label> <br> <input type="file"
													name="image2" id="image2" accept=".jpg"  />
											</div>
										</div>
									</div>

									<button type="submit" id="insertblog" class="btn btn-primary">Submit</button>
									<!-- <input type="hidden" name="idblog" id="content" value=""> -->
								</form>
							</div>
						</div>



					</div>
					<!-- /.card -->
				</div>



			</div>
			<!-- /.row -->

		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
 
<!-- <script type="text/javascript"
	src="https://cdn.ckeditor.com/4.5.8/full-all/ckeditor.js"></script>
<script src="admin/asset/ckeditor.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
	$(document).ready(function () {
		/* $(".showModelBlog").click(function () {
			const blogid= $(this).data("blogid");
			alert(blogid);
		}); */
		/* $(".updateBlog").click(function () {
			var title = $("#uptitle").val();
			var ct = $("#upcontent").val();
			var img = $("#upimage").val();
			var tag = $("#uptag").val();
			var ct1 = $("#upcontent1").val();
			var ct2 = $("#upcontent2").val();
			var ct3 = $("#upcontent3").val();
			var img1 = $("#upimage1").val();
			var img2 = $("#upimage2").val();
			const idblog= $(this).data("idblog");
			alert(title);
			
			
			$.ajax({
		        type: "get",
		        url: 'update-blog',
		        data: {
		            title, ct, img, tag, ct1, ct2, ct3, img1, img2, idblog
		        },
		        success: function (data) {
					if (data.success) {
						swal("Success", data.message, "success");
					} else {
						swal("Failed", data.message, "error");
					}
				}
		    });
		});	 */
		$(".updateBlog").click(function () {
			swal("Success", "Update successfully!", "success");
		});
		
		$(".check-status").change(function() {
			const idblog= $(this).data("checkstatus");
		    $.ajax({
		        type: "POST",
		        url: "check-status-blog",
		        data: {
		            idblog
		        }
		    });
		});
		
		
	});
</script>