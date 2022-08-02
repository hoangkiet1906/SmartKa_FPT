<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="cart-area pt-100 pb-100">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<form id="updateCartForm" method="post">
					<div class="cart-table-content">
						<div class="table-content table-responsive">
							<table id="viewCartTable">
								<thead>
									<tr>
										<th class="width-thumbnail"></th>
										<th class="width-name">Product</th>
										<th class="width-price">Price</th>
										<th class="width-quantity">Quantity</th>
										<th class="width-subtotal">Subtotal</th>
										<th class="width-remove"></th>
									</tr>
								</thead>
								<tbody id="viewCartList">
									
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="cart-shiping-update-wrapper">
								<div class="cart-shiping-update btn-hover">
									<a href="<c:url value="/" />">Continue Shopping</a>
								</div>
								<div class="cart-clear-wrap">
									<div class="cart-clear btn-hover">
										<button>Update Cart</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<form action="<c:url value='/checkout' />" method="post" id="checkoutForm" class="row">
			<input type="hidden" name="countryData" id="countryData" />
			<input type="hidden" name="stateData" id="stateData" />
			<div class="col-lg-4 col-md-6 col-12">
				<div class="cart-calculate-discount-wrap mb-40">
					<h4>Calculate shipping</h4>
					<div class="calculate-discount-content">
						<div class="border mb-15">
							<select id="countries-list" name="country">
								<option>Select your countryside</option>
							</select>
						</div>
						<div class="border mb-15" name="state">
							<select id="states-list">
								<option>Select your state</option>
							</select>
						</div>
						<div class="input-style">
							<input id="streetInput" type="text" name="streetData" placeholder="Your Address">
						</div>
						<div style="display: flex; align-items: center">
							<span id="useDefaultAddress">Using your default address?</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-12">
				<div class="cart-calculate-discount-wrap mb-40">
					<h4>Coupon Discount</h4>
					<div class="calculate-discount-content">
						<p>Enter your coupon code if you have one.</p>
						<div class="input-style">
							<input name="coupon" type="text" placeholder="Coupon code">
						</div>
						<div class="calculate-discount-btn btn-hover">
							<a class="btn theme-color" href="#">Apply Coupon</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-12 col-12">
				<div class="grand-total-wrap">
					<div class="grand-total-content">
						<h3>
							Subtotal <span id="totalCartView" class="subTotal"></span>
						</h3>
						<div class="grand-shipping">
							<span>Shipping</span>
							<ul>
								<li><input type="radio" name="shipping" value="info"
									checked="checked"><label>Free shipping</label></li>
							</ul>
						</div>
						<div class="shipping-country">
							<p>Shipping to <span id="shippingAddress"></span></p>
						</div>
						<div class="grand-total">
							<h4>
								Total <span class="subTotal" id="totalAfterShipping"></span>
							</h4>
						</div>
					</div>
					<div class="grand-total-btn btn-hover">
						<button class="btn btn-hover" style="width: 100%; border: 1px solid black" type="submit">Proceed to
							checkout</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>