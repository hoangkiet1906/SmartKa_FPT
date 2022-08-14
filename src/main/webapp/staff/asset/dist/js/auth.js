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
	
	// Logout AJAX
	$("#logoutImg").click(logoutUser);
	
});