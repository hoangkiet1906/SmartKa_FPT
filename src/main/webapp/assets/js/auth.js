$(document).ready(function() {
	// Log out method
	const logoutUser = (e) => {
		e.preventDefault();
		$.ajax({
			type: "GET",
			url: "/SmartKa/logout",
			dataType: "json",
			success: function(data) {
				if (data.success) {
					localStorage.removeItem("userCart")
					swal("Success", data.message, "info")
						.then(() => {
							$(location).prop("href", "/SmartKa/auth")
						});
				} else {
					swal("Failed", data.message, "error")
				}
			}
		});
	}
	// Login AJAX
	$("#loginForm").submit(function(e) {
		const username = $("#username_login").val();
		const password = $("#password_login").val();
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "/SmartKa/login",
			data: {
				username,
				password
			},
			dataType: "json",
			timeout: 10000,
			success: function(data) {
				if (data.success) {
					swal("Success", data.message, "success")
						.then(() => {
							if (data.user.role == "ADMIN") {
								$(location).prop("href", "/SmartKa/admin/usermng")
							} else if (data.user.role=="STAFF") {
								$(location).prop("href", "/SmartKa//staff/home")
							} else {
								$(location).prop("href", "/SmartKa/")
							}
						});
				} else {
					swal("Failed", data.message, "error")
				}
			}
		});
	});
	// Register AJAX
	$("#registerForm").submit(function(e) {
		const username = $("#username_register").val();
		const password = $("#password_register").val();
		const confirmPassword = $("#confirmPassword_register").val();
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "/SmartKa/register",
			data: {
				username, password, confirmPassword
			},
			dataType: "json",
			timeout: 10000,
			success: function(data) {
				if (data.success) {
					swal("Success", data.message, "success")
						.then(() => {
							$(location).prop("href", "/SmartKa/")
						});
				} else {
					swal("Failed", data.message, "error")
				}
			}
		});
	});
	// Logout AJAX
	$("#logoutText").click(logoutUser);
	// Update User Profile
	$("#accountDetailsForm").submit(function(e) {
		const fullname = $("#fullname").val();
		const email = $("#email").val();
		const phoneNumber = $("#phoneNumber").val();
		const address = $("#address").val();
		const deliveryAddress = $("#deliveryAddress").val();
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "/SmartKa/update-userInfo",
			data: {
				fullname, email, phoneNumber, address, deliveryAddress
			},
			dataType: "json",
			success: function(data) {
				if (data.success) {
					swal("Success", data.message, "success")
				} else {
					swal("Failed", data.message, "error")
				}
			}
		});
	});
});