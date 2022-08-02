<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="breadcrumb-area breadcrumb-padding-1"
	style="background-image: url(assets/images/slider/nen2.jpg)">
	<div class="container">
		<c:if test="${avatar != null }">
			<img id="img" class="imgAvt" src="assets/images/avatar/${avatar}">
		</c:if>

		<form class="formAvt" action="">
			<input type='file' id="uploadAvt" style="display: none">
			<div class="divUpdate">
				<label class="lblUpdate" for="uploadAvt">UPDATE</label>
			</div>
		</form>
		<div class="breadcrumb-content text-center">
			<h3>My Account</h3>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><i class="ti-angle-right"></i></li>
				<li>My Account</li>

			</ul>
		</div>
	</div>
	<div class="breadcrumb-img-1">
		<img src="assets/images/bg/light.jpg" alt="">
	</div>
	<div class="breadcrumb-img-2">
		<img src="assets/images/bg/safe.jpg" alt="">
	</div>
</div>
<!-- my account wrapper start -->
<div class="my-account-wrapper pb-100 pt-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- My Account Page Start -->
				<div class="myaccount-page-wrapper">
					<!-- My Account Tab Menu Start -->
					<div class="row">
						<div class="col-lg-3 col-md-4">
							<div class="myaccount-tab-menu nav" role="tablist">
								<a href="#dashboad" class="active" data-bs-toggle="tab">Dashboard</a>
								<a href="#orders" data-bs-toggle="tab">Orders</a> <a
									href="#account-info" data-bs-toggle="tab">Account Details</a>
							</div>
						</div>
						<!-- My Account Tab Menu End -->
						<!-- My Account Tab Content Start -->
						<div class="col-lg-9 col-md-8">
							<div class="tab-content" id="myaccountContent">
								<!-- Single Tab Content Start -->
								<div class="tab-pane fade show active" id="dashboad"
									role="tabpanel">
									<div class="myaccount-content">
										<h3>Dashboard</h3>
										<div class="welcome">
											<p>
												Hello, <strong>${sessionScope.username}</strong> (If Not <strong><span>${sessionScope.username }</span>
													!</strong><a href='<c:url value="/logout" />' id="logoutText"
													class="logout"> Logout</a>)
											</p>
										</div>

										<p class="mb-0">From your account dashboard. you can
											easily check & view your recent orders, manage your shipping
											and billing addresses and edit your password and account
											details.</p>
									</div>
								</div>
								<!-- Single Tab Content End -->
								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="orders" role="tabpanel">
									<div class="myaccount-content">
										<h3>Orders</h3>
										<div class="myaccount-table table-responsive text-center">
											<table class="table table-bordered">
												<thead class="thead-light">
													<tr>
														<th>Date</th>
														<th>Status</th>
														<th>Total</th>
														<th>Payment method</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${orders }">
														<tr>
															<td>${item.date_checkout }</td>
															<c:choose>
																<c:when test="${item.status == 'Processing' }">
																	<td class='text-warning'>${item.status }</td>
																</c:when>
																<c:otherwise>
																	<td class='text-success'>${item.status }</td>
																</c:otherwise>
															</c:choose>
															<td>$${item.total_money }</td>
															<td>${item.payment_method }</td>
															<td><button href="#" data-bs-toggle="modal"
																	data-bs-target="#Modal${item.id}"
																	class="check-btn sqr-btn ">
																	View</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<c:forEach var="o" items="${orders }">
												<!-- Product Modal start -->
												<div class="modal fade quickview-modal-style"
													id="Modal${o.id}" tabindex="-1" role="dialog">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content modal-product-form">
															<div class="modal-header">
																<a href="#" class="close" data-bs-dismiss="modal"
																	aria-label="Close"><i class=" ti-close "></i></a>
															</div>
															<div class="modal-body">
																<div class="row gx-0 mt-60">
																	<div
																		class="myaccount-table table-responsive text-center">
																		<table class="table table-bordered">
																			<thead class="thead-light">
																				<tr>
																					<th>Product Image</th>
																					<th>Product name</th>
																					<th>Quantity</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach var="p" items="${o.orderDetail }">
																					<tr>
																						<td><img width="80px" src="<c:url value='assets/images/product/${p.product.image}'/>" /></td>
																						<td>${p.product.name }</td>
																						<td>${p.quantity }</td>
																					</tr>
																				</c:forEach>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- Product Modal end -->
											</c:forEach>
										</div>
									</div>
								</div>
								<!-- Single Tab Content End -->
								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="account-info" role="tabpanel">
									<div class="myaccount-content">
										<h3>Account Details</h3>
										<div class="account-details-form">
											<form action="javascript:void(0)" id="accountDetailsForm">
												<div class="single-input-item">
													<label for="fullname" class="required">Full Name</label> <input
														type="text" id="fullname"
														<c:choose>
															<c:when test="${sessionScope.userInfo.fullname==''}">
														         placeholder="No update yet"
														    </c:when>
														    <c:when test="${sessionScope.userInfo.fullname!=null}">
														         value="${sessionScope.userInfo.fullname}"
														    </c:when>    
														    <c:otherwise>
														        placeholder="No update yet"
														    </c:otherwise>
														</c:choose> />
												</div>
												<div class="single-input-item">
													<label for="email" class="required">Email Address</label> <input
														type="text"
														<c:choose>
															<c:when test="${sessionScope.userInfo.email==''}">
														         placeholder="No update yet"
														    </c:when>
														    <c:when test="${sessionScope.userInfo.email!=null}">
														         value="${sessionScope.userInfo.email}"
														    </c:when>    
														    <c:otherwise>
														        placeholder="No update yet"
														    </c:otherwise>
														</c:choose>
														id="email" />
												</div>
												<div class="single-input-item">
													<label for="phoneNumber" class="required">Phone
														Number</label> <input type="text"
														<c:choose>
															<c:when test="${sessionScope.userInfo.phone==''}">
														         placeholder="No update yet"
														    </c:when>
														    <c:when test="${sessionScope.userInfo.phone!=null}">
														         value="${sessionScope.userInfo.phone}"
														    </c:when>    
														    <c:otherwise>
														        placeholder="No update yet"
														    </c:otherwise>
														</c:choose>
														id="phoneNumber" />
												</div>
												<div class="single-input-item">
													<label for="address" class="required">Address</label> <input
														type="text"
														<c:choose>
															<c:when test="${sessionScope.userInfo.address==''}">
														         placeholder="No update yet"
														    </c:when>
														    <c:when test="${sessionScope.userInfo.address!=null}">
														         value="${sessionScope.userInfo.address}"
														    </c:when>    
														    <c:otherwise>
														        placeholder="No update yet"
														    </c:otherwise>
														</c:choose>
														id="address" />
												</div>
												<div class="single-input-item">
													<label for="deliveryAddress" class="required">Delivery
														Address</label> <input type="text"
														<c:choose>
														    <c:when test="${sessionScope.userInfo.daddress==''}">
														         placeholder="No update yet"
														    </c:when>
														    <c:when test="${sessionScope.userInfo.daddress!=null}">
														         value="${sessionScope.userInfo.daddress}"
														    </c:when>    
														    <c:otherwise>
														        placeholder="No update yet"
														    </c:otherwise>
														</c:choose>
														id="deliveryAddress" />
												</div>
												<div class="single-input-item btn-hover">
													<button type="submit" class="check-btn sqr-btn">Save
														Changes</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- Single Tab Content End -->
							</div>
						</div>
						<!-- My Account Tab Content End -->
					</div>
				</div>
				<!-- My Account Page End -->
			</div>
		</div>
	</div>
</div>