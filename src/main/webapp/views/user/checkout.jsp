<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="checkout-main-area pb-100 pt-100">
	<div class="container">
		<div class="checkout-wrap">
			<form method="post" id="confirmCheckoutForm" class="row">
				<div class="col-lg-7">
					<div class="billing-info-wrap">
						<h3>Billing Details</h3>
						<div class="row">
							<div class="col-lg-12">
								<div class="billing-select select-style mb-20">
									<label>Country <abbr class="required" title="required">*</abbr></label>
									<div class="border mb-15">
										<input class="input-checkout" type="text" id="countryInput" name="country"
											value="${country }" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="billing-select select-style mb-20">
									<label>State <abbr class="required" title="required">*</abbr></label>
									<div class="border mb-15">
										<input class="input-checkout" id="stateInput" type="text" name="state"
											value="${state }" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="billing-info mb-20">
									<label>Street Address <abbr class="required"
										title="required">*</abbr></label> <input class="billing-address"
										value="${address }" name="street" id="streetInput" readonly type="text">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="billing-info mb-20">
									<label>Full Name <abbr class="required"
										title="required">*</abbr></label> <input id="fullnameInput" type="text" name="fullname"
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
							</div>
							<div class="col-lg-12 col-md-12">
								<div class="billing-info mb-20">
									<label>Phone <abbr class="required" title="required">*</abbr></label>
									<input type="text" name="phone" id="phoneInput"
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
														</c:choose> />
								</div>
							</div>
							<div class="col-lg-12 col-md-12">
								<div class="billing-info mb-20">
									<label>Email Address <abbr class="required"
										title="required">*</abbr></label> <input id="emailInput" type="text" name="email"
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
														</c:choose> />
								</div>
							</div>
						</div>
						<div class="additional-info-wrap">
							<label>Order notes</label>
							<textarea
								placeholder="Notes about your order, e.g. special notes for delivery. "
								name="note" id="noteInput"></textarea>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="your-order-area">
						<h3>Your order</h3>
						<div class="your-order-wrap gray-bg-4">
							<div class="your-order-info-wrap">
								<div class="your-order-info">
									<ul>
										<li>Product <span>Total</span></li>
									</ul>
								</div>
								<div class="your-order-middle">
									<ul id="orderList">
									</ul>
								</div>
								<div class="your-order-info order-subtotal">
									<ul>
										<li>Subtotal <span class="subTotal"></span></li>
									</ul>
								</div>
								<div class="your-order-info order-shipping">
									<p>Shipping to <span style="color: gray; font-weight: bold">${address }, ${state }, ${country }</span></p>
								</div>
								<div class="your-order-info order-total">
									<ul>
										<li>Total <span class="subTotal"></span></li>
									</ul>
								</div>
							</div>
							<div class="payment-method">
								<div class="pay-top sin-payment">
									<input id="payment_method_1" class="input-radio" type="radio"
										value="Direct Bank Transfer" checked="checked"
										name="payment_method"> <label for="payment_method_1">
										Direct Bank Transfer </label>
									<div class="payment-box payment_method_bacs">
										<p>Make your payment directly into our bank account.
											Please use your Order ID as the payment reference.</p>
									</div>
								</div>
								<div class="pay-top sin-payment">
									<input id="payment-method-3" class="input-radio" type="radio"
										value="Cash on delivery" name="payment_method"> <label
										for="payment-method-3">Cash on delivery </label>
									<div class="payment-box payment_method_bacs">
										<p>Make your payment directly into our bank account.
											Please use your Order ID as the payment reference.</p>
									</div>
								</div>
								<div class="pay-top sin-payment sin-payment-3">
									<input id="payment-method-4" class="input-radio" type="radio"
										value="PayPal" name="payment_method"> <label
										for="payment-method-4">PayPal <img alt=""
										src="assets/images/icon-img/payment.png"></label>
									<div class="payment-box payment_method_bacs">
										<p>Make your payment directly into our bank account.
											Please use your Order ID as the payment reference.</p>
									</div>
								</div>
							</div>
						</div>
						<div class="Place-order btn-hover">
							<button class="btn btn-hover" style="width: 100%; border: 1px solid black">Place Order</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>