<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Work</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
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
							<h3 class="card-title">Completed job</h3>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-striped table-valign-middle">
								<thead>
									<tr>
										<th>Buyer</th>
										<th>Fullname</th>
										<th>Status</th>
										<th>Price</th>
										<th>Address</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Note</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="w" items="${completedOrders }">
										<tr>
											<td>${w.order.username }</td>
											<td>${w.order.fullname }</td>
											<td class="text-success">${w.order.status }</td>
											<td>$${w.order.total_money }</td>
											<td>${w.order.address }</td>
											<td>${w.order.phone }</td>
											<td>${w.order.email }</td>
											<td>
												<c:choose>
													<c:when test="${w.order.note == null || w.order.note == '' }">
														Dont have any note
													</c:when>
													<c:otherwise>
														${w.order.note }
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
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