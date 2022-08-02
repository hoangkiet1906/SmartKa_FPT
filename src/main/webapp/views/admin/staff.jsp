<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Staff</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Staff</li>
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
							<h3 class="card-title">All Pending</h3>
						</div>
						<form method="post" id="updateStaffDoOrder" class="card-body table-responsive p-0">
							<table class="table table-striped table-valign-middle">
								<thead>
									<tr>
										<th>Username</th>
										<th>Date</th>
										<th>Payment method</th>
										<th>Status</th>
										<th>Total</th>
										<th>Staff?</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="o" items="${pendingOrders }">
										<tr>
											<td>${o.username }</td>
											<td>${o.date_checkout }</td>
											<td>${o.payment_method }</td>
											<td>${o.status }</td>
											<td>$${o.total_money }</td>
											<td><select data-id="${o.id }" name="staffSelection">
													<option>Choose one</option>
													<c:forEach var="s" items="${staffs }">
														<option value="${s.user_name }">${s.user_name }</option>
													</c:forEach>
											</select></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
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