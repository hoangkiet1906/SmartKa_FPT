/* CART HANDLE */
// Get Cart
const getCart = () => {
	$.ajax({
		type: "get",
		url: "/SmartKa/getCart",
		dataType: "json",
		success: function(data) {
			if (data.success) {
				localStorage.setItem("userCart", JSON.stringify(data.object));
			} else {
				localStorage.removeItem("userCart");
			}
		},
	});
};
getCart();
// Show count
const showCount = (cart) => {
	if (cart != null) {
		$("#totalCart").text(cart.length);
		$("#totalCart").addClass("product-count bg-dark");
	}
};
// Show Cart
const showCart = (cart) => {
	if (cart != null) {
		cart.map((item) => {
			const element =
				"<li id='liCartItem" +
				item.id +
				"' key=" +
				item.id +
				">" +
				"<div class='cart-img'>" +
				"<a href='#'><img src='assets/images/product/" +
				item.product.image +
				"'' /></a>" +
				"</div>" +
				"<div class='cart-title'>" +
				"<h4><a>" +
				item.product.name +
				"</a></h4>" +
				"<span>" +
				"<span id='quantityCartItem" +
				item.id +
				"'>" +
				item.quantity +
				"</span>" +
				" x " +
				item.product.price +
				".00</span>" +
				"</div>" +
				"<div class='cart-delete'><a class='deleteCartItem' data-cartid=" +
				item.id +
				">x</a></div>" +
				"</li>";
			$("#shoppingCart").append(element);
			const viewCartElement =
				"<tr data-cartid = " +
				item.id +
				" data-productid = " +
				item.product.id +
				" id='liViewCartItem" +
				item.id +
				"'>" +
				"<td class='product-thumbnail'>" +
				"<a href='#'><img src='assets/images/product/" +
				item.product.image +
				"''/><a/>" +
				"</td>" +
				"<td class='product-name'>" +
				"<h5><a href='#'>" +
				item.product.name +
				"</h5>" +
				"</td>" +
				"<td class='product-cart-price'>$<span class='amount'>" +
				item.product.price +
				"</span>.00</td>" +
				"<td class='cart-quality'>" +
				"<div class='product-quality'>" +
				"<div class='dec qtybutton'>-</div>" +
				"<input readonly class='cart-plus-minus-box input-text qty text' name='qtybutton' value='" +
				item.quantity +
				"'>" +
				"<div class='inc qtybutton'>+</div>" +
				"</div>" +
				"</td>" +
				"<td class='product-total'>" +
				"$<span class='subTotalCartView'>" +
				item.product.price * item.quantity +
				"</span>.00" +
				"</td>" +
				"<td class='product-remove'>" +
				"<span><i class='ti-trash deleteViewCartItem' data-cartid=" +
				item.id +
				" /></span>" +
				"</td>" +
				"</tr>";
			$("#viewCartList").append(viewCartElement);
			const orderItem = "<li>"+ item.product.name +" x " + item.quantity + "<span>$"+ item.quantity * item.product.price +".00</span></li>"
			$("#orderList").append(orderItem)
		});
		setOnChangeQuantity();
		getQuantityViewCart();
	}
};

// set onchange for cart view
const setOnChangeQuantity = () => {
	$(".qtybutton").on("click", function() {
		var $button = $(this);
		var oldValue = $button.parent().find("input").val();
		if ($button.text() === "+") {
			var newVal = parseFloat(oldValue) + 1;
		} else {
			// Don't allow decrementing below zero
			if (oldValue > 1) {
				var newVal = parseFloat(oldValue) - 1;
			} else {
				newVal = 1;
			}
		}
		$button.parent().find("input").val(newVal);
		var price = $button.parent().parent().parent().find(".amount").text();
		$button
			.parent()
			.parent()
			.parent()
			.find(".subTotalCartView")
			.text(+price * newVal);
		getQuantityViewCart();
	});
};
const getQuantityViewCart = () => {
	var totalCart = 0;
	$("table > tbody > tr").each(function() {
		var currentRow = $(this);
		var currentRowAmount = +currentRow.find(".amount").text();
		var currentRowQuantity = +currentRow
			.find(".cart-quality")
			.find("input")
			.val();
		totalCart += currentRowAmount * currentRowQuantity;
	});
	$("#totalCartView").text("$" + totalCart + ".00");
	$("#totalAfterShipping").text("$" + totalCart + ".00");
};
// Add Cart
const addCart = (productId, quantity, cart) => {
	cart = JSON.parse(localStorage.getItem("userCart"));
	$.ajax({
		type: "POST",
		url: "/SmartKa/addCart",
		data: { productId, quantity },
		dataType: "json",
		success: function(data) {
			if (data.success) {
				if (data.message.toLowerCase().includes("local")) {
					swal("Success", data.message, "success");
				} else {
					const item = data.object;
					var check = false;
					for (let i = 0; i < cart.length; i++) {
						const element = cart[i];
						if (element.product.id == item.product.id) {
							check = true;
							break;
						}
					}
					if (!check) {
						cart.push(item);
						showCount(cart);
						const newElement =
							"<li id='liCartItem" +
							item.id +
							"' key=" +
							item.id +
							">" +
							"<div class='cart-img'>" +
							"<a href='#'><img src='assets/images/product/" +
							item.product.image +
							"'' /></a>" +
							"</div>" +
							"<div class='cart-title'>" +
							"<h4><a>" +
							item.product.name +
							"</a></h4>" +
							"<span>" +
							"<span id='quantityCartItem" +
							item.id +
							"'>" +
							item.quantity +
							"</span>" +
							" x " +
							item.product.price +
							".00</span>" +
							"</div>" +
							"<div class='cart-delete'><a class='deleteCartItem' data-cartid=" +
							item.id +
							">x</a></div>" +
							"</li>";
						$("#shoppingCart").append(newElement);
						$(".deleteCartItem").click(function() {
							const id = $(this).data("cartid");
							deleteCartItem(id, cart);
						});
					} else {
						for (let i = 0; i < cart.length; i++) {
							const element = cart[i];
							if (element.id == item.id) {
								element.quantity = item.quantity;
							}
						}
						$("#quantityCartItem" + item.id).text(item.quantity);
					}
					localStorage.setItem("userCart", JSON.stringify(cart));
					getSubTotal(cart);
					swal("Success", data.message, "success");
				}
			} else {
				swal("Error", data.message, "error");
			}
		},
	});
};
const sliceString = (string) => {
	return string.slice(1, -3);
};
// Get Subtotal
const getSubTotal = (cart) => {
	if (cart != null) {
		const total = cart.reduce(
			(prev, current) => prev + current.product.price * current.quantity,
			0
		);
		$(".subTotal").text("$" + total + ".00");
	}
};
// cosnt updateCartForm
const updateCartForm = (cart) => {
	cart = JSON.parse(localStorage.getItem("userCart"));
	$("#updateCartForm").submit(function(e) {
		e.preventDefault();
		var objArray = [];
		var productid;
		var cartid;
		var quantity;
		$(this)
			.find("table > tbody > tr")
			.each(function() {
				productid = $(this).data("productid");
				cartid = $(this).data("cartid");
				quantity = +$(this).find(".cart-quality").find("input").val();
				objArray.push({ productid, cartid, quantity });
			});
		$.ajax({
			type: "POST",
			url: "/SmartKa/updateCart",
			data: {
				updatedCart: JSON.stringify(objArray),
			},
			dataType: "json",
			success: function(data) {
				if (data.success) {
					swal("Success", data.message, "success");
					for (let i = 0; i < objArray.length; i++) {
						const element = objArray[i];
						for (let m = 0; m < cart.length; m++) {
							if (cart[m].id == element.cartid) {
								cart[m].quantity = element.quantity;
								$("#quantityCartItem" + element.cartid).text(element.quantity);
							}
						}
					}
					getSubTotal(cart);
					localStorage.setItem("userCart", JSON.stringify(cart));
				} else {
					swal("Failed", data.message, "error");
				}
			},
		});
	});
	
};
// Delete Cart
const deleteCartItem = (id, cart) => {
	cart = JSON.parse(localStorage.getItem("userCart"));
	$.ajax({
		type: "post",
		url: "/SmartKa/deleteCartItem",
		data: { id },
		dataType: "json",
		success: function(data) {
			if (data.success) {
				cart = cart.filter((item) => item.id != id);
				localStorage.setItem("userCart", JSON.stringify(cart));
				showCount(cart);
				getSubTotal(cart);
				$("#liCartItem" + id).remove();
				$("#liViewCartItem" + id).remove();
			} else {
				swal("Failed", data.message, "error");
			}
		},
	});
};
$(document).ready(function() {
	getCart()
	const userCart = () => {
		return JSON.parse(localStorage.getItem("userCart"));
	};
	const cart = userCart();
	showCount(cart);
	showCart(cart);
	getSubTotal(cart);
	$(".product-action-btn-2").click(function() {
		const quantity = 1;
		const productId = $(this).data("productid");
		addCart(productId, quantity, cart);
	});
	$(".modal-product-form").submit(function (e) {
		e.preventDefault();
		const qtybutton = $(this).find("input[name=qtybutton]");
		const quantity = qtybutton.val();
		const productid = $(this).data("productid")
		addCart(productid, quantity, cart);
	});
	
	$(".deleteCartItem").click(function() {
		const id = $(this).data("cartid");
		deleteCartItem(id, cart);
	});
	$(".deleteViewCartItem").click(function() {
		const id = $(this).data("cartid");
		deleteCartItem(id, cart);
	});
	updateCartForm(cart);
});
