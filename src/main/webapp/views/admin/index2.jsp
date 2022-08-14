<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Revenue Management</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Revenue</li>
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
					<div class="card">
						<div class="card-header border-0">
							<div class="d-flex justify-content-between">
								<h3 class="card-title">Revenue of the Week</h3>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex">
								<p class="d-flex flex-column">
									<span class="text-bold text-lg">${totalweek}</span> <span>USD</span>
								</p>
								<p class="ml-auto d-flex flex-column text-right">
									<c:set var="rate" value="${gr }" />
									<c:choose>
										<c:when test="${rate >0 }">
										<span
											class="text-success"> <i class="fas fa-arrow-up"></i>
											${rate}%
										</span>
										</c:when>
										<c:otherwise>
											<span class="text-danger"> <i
										class="fas fa-arrow-down"></i>
										${rate }%
										</span>	
										</c:otherwise>
									</c:choose>
									 <span class="text-muted">Compared to Last Week</span>
								</p>
							</div>
							<!-- /.d-flex -->

							<div class="position-relative mb-4">
								<canvas id="visitors-chart" height="200"></canvas>
							</div>

							<div class="d-flex flex-row justify-content-end">
								<span class="mr-2"> <i class="fas fa-square text-primary"></i>
									Current Week
								</span> <span> <i class="fas fa-square text-gray"></i> Last Week
								</span>
							</div>
						</div>
					</div>
					<!-- /.card -->

					<div class="card">
						<div class="card-header border-0">
							<h3 class="card-title">Outstanding Revenue</h3>
							<div class="card-tools"></div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-striped table-valign-middle">
								<thead>
									<tr>
										<th></th>
										<th>Product</th>
										<th>Price</th>
										<th style="text-align:center;">Purchase Quantity</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="orp" items="${ORPlist}">
									<tr>
										<td><img
											src="asset/images/product/${orp.ORPimage}"
											alt="Product 1" class="img-circle img-size-32 mr-2"/>
											
											</td>
											<td><p>${orp.ORPname}</p></td>
										<td>$${orp.ORPprice }</td>
										<td style="text-align:center;">${orp.ORPquantity }</td>
										<td>$${orp.ORPtotal }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col-md-6 -->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-header border-0">
							<div class="d-flex justify-content-between">
								<h3 class="card-title">Revenue of the Year</h3>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex">
								<p class="d-flex flex-column">
									<span class="text-bold text-lg">${{$totalYear}}</span> <span>USD</span>
								</p>
								<p class="ml-auto d-flex flex-column text-right">
									<span class="text-success"> <i class="fas fa-arrow-up"></i>
										11%
									</span> <span class="text-muted">Compared with the Last Year</span>
								</p>
							</div>
							<!-- /.d-flex -->

							<div class="position-relative mb-4">
								<canvas id="sales-chart" height="200"></canvas>
							</div>

							<div class="d-flex flex-row justify-content-end">
								<span class="mr-2"> <i class="fas fa-square text-primary"></i>
									Current Year
								</span> <span> <i class="fas fa-square text-gray"></i> Last Year
								</span>
							</div>
						</div>
					</div>
					<!-- /.card -->

					<div class="card">
						<div class="card-header border-0">
							<h3 class="card-title">Products are rarely bought</h3>
							<div class="card-tools"></div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-striped table-valign-middle">
								<thead>
									<tr>
										<th></th>
										<th>Product</th>
										<th>Price</th>
										<th>Purchase Quantity</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="rb" items="${RBlist}">
									<tr>
										<td><img
											src="asset/images/product/${rb.ORPimage}"
											alt="Product 1" class="img-circle img-size-32 mr-2"/>
											
											</td>
											<td><p>${rb.ORPname}</p></td>
										<td>$${rb.ORPprice }</td>
										<td style="text-align:center;">${rb.ORPquantity }</td>
										<td>$${rb.ORPtotal }</td>
									</tr>
								</c:forEach>
								
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.card -->

				</div>
				<!-- /.col-md-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="asset/dist/js/pages/dashboard3.js">
</script>