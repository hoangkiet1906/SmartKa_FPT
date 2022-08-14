$(document).ready(function (e) {
	$(".completedTask").click(function () {
		const taskid = $(this).data("taskid");

		$.ajax({
			type: "POST",
			url: "/SmartKa/completeTask",
			data: {
				id: taskid
			},
			dataType: "json",
			success: function (data) {
				if (data.success) {
					swal("Success", data.message, "success").then(() => {
						window.location.reload();
					})
				}
			}
		})
	})
}) 