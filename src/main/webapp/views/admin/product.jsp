<!-- Content Wrapper. Contains page content -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Product</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Product</li>
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
				<div class="col-lg-12">
					<!-- TO DO List -->



					<div class="card">
						<div class="card-header border-0">
							<h3 class="card-title">All product</h3>
							<div class="card-tools">
								<ul class="pagination pagination-sm">

									<li class="page-item"><a href="" class="page-link">&laquo;</a></li>
									<li class="page-item">
										<a href="product?page=1"
										class="page-link">1</a></li>
									<li class="page-item">
										<a href="product?page=2"
										class="page-link">2</a></li>
									<li class="page-item">
										<a href="product?page=3"
										class="page-link">3</a></li>
									<li class="page-item"><a href="" class="page-link">&raquo;</a></li>

								</ul>
							</div>
							<div class="card-tools"></div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-striped table-valign-middle">
								<thead>
									<tr>
										<th>Product's name</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>View</th>
										<th>Tag</th>
										<th>Status</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach var="pro" items="${pros}" begin="${begin}" end="${begin+9}">
										<tr>
											<td><img style="border: 0.5px solid black"
													src="../assets/images/product/${pro.image}" alt="Product" 
													class="img-circle img-size-32 mr-2"> 
													${pro.name}
											</td>
											<td>${pro.price}</td>
											<td>${pro.quantity}</td>
											<td>${pro.view}</td>
											<td>${pro.tag}</td>
											<td>${pro.status}</td>
											<td>
												<form action="delete-product" method="POST">
													<button type="submit" class="btn text-danger"
														name="deleteproduct" value="${pro.id }">
														<i class="far fa-trash-alt"></i>
													</button>
	
													<button type="button" class="btn text-danger p-0"
														data-toggle="modal" data-target="#p${pro.id}">
														<i class="fas fa-edit"></i>
													</button>
												</form>
											</td>
										</tr>
	
										<!-- modal -->
										<div class="modal" id="p${pro.id}">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title">Update product</h4>
														<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
	
													<!-- Modal body -->
													<form action="update-product" method="POST">
														
														<div class="modal-body">
															<h5>Update product</h5>
															<div class="form-group">
																<label for="">Product's name</label> <input type="text"
																	class="form-control" name="upname" id="upname"
																	value="${pro.name}">
															</div>
															<div class="form-group">
																<label for="">Price</label> <input type="text"
																	class="form-control" name="upprice"
																	value="${pro.price}">
															</div>
															<div class="form-group">
																<label for="">Quantity</label> <input type="text"
																	class="form-control" name="upquantity"
																	value="${pro.quantity}">
															</div>
															<div class="form-group">
																<label for="">Image</label> <br> <input type="file"
																	id="imagepro" name="upimage"   />
															</div>
															<div class="form-group">
																<label for="">Description</label>
																<textarea class="form-control" name="updesc" id="updesc"
																	  placeholder="Enter description" rows="5">
																	${pro.description}
	                            								</textarea>
															</div>
															<div class="form-group">
																<label for="">Tag</label> <input type="text"
																	class="form-control" name="uptag"
																	value="${pro.tag}">
															</div>
															<div class="form-group">
																<label for="">Status</label> 
																<input type="text" class="form-control" name="upstatus"
																	value="${pro.status}">
															</div>
															<!-- Modal footer"  onclick="sendUpdate()"-->
															<input type="hidden" name="id" value="${pro.id}"/>
															
															<div class="modal-footer">
																<button type="submit" class="btn btn-primary">Update</button>
																<button type="button" class="btn btn-danger"
																	data-dismiss="modal">Close</button>
															</div>
													</form>
												</div>
											</div>
										</div>
									
									</c:forEach>

								</tbody>
							</table>

						</div>
					</div>
					<!-- /.card -->
				</div>


				<div class="col-lg-12">
					<div class="card">
						<div class="card-header border-0">
							<h2 class="card-title mb-3">
								<b>Add product</b>
							</h2>
							<div class="card-tools"></div>
							<div class="card-body table-responsive p-0">
								<form action="insert-product" method="POST">
									
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Product's name</label> <input type="text"
													name="productname" class="form-control" id="productname"
													placeholder="Enter product's name"  >
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Price</label> <input type="text" name="price"
													class="form-control" id="price" placeholder="Enter tag">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Tag</label> <input type="text" name="tag"
													class="form-control" id="tag" placeholder="Enter tag">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Status</label> <input type="text"
													name="status" class="form-control" id="status"
													placeholder="Enter tag">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Quantity</label> <br> <input type="text"
													class="form-control" name="quantity" id="quantity"
													placeholder="Enter quantity"  />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Image</label> <br> <input type="file"
													id="image" name="image" required />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="">Description</label><br>
										<textarea class="form-control" name="description"
											id="description"   placeholder="Enter description"
											rows="5"></textarea>
									</div>

									<button type="submit" id="insertproduct"
										class="btn btn-primary mt-3">Submit</button>
								</form>
							</div>
						</div>

					</div>
					<!-- /.card -->
				</div>
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->