$(document).ready(function(e) {
	$("#updateStaffDoOrder").submit(function(e) {
		var reqObj = [];
		$(this).find("table > tbody > tr").each(function() {
			const selection = $(this).find("select");
			const id = selection.data("id");
			const staff = selection.val() == "Choose one" ? "" : selection.val();

			reqObj.push({ id, staff });
		})
		e.preventDefault();

		$.ajax({
			type: "POST",
			url: "/SmartKa/updateWorkStaff",
			data: {
				reqObj: JSON.stringify(reqObj)
			},
			dataType: "json",
			success: function(data) {
				if (data.success) {
					swal("Success", data.message, "success").then(() => {
						window.location.reload();
					})
				}
			}
		})
	});
}) 