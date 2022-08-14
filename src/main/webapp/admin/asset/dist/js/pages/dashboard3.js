/* global Chart:false */

$(function() {
	'use strict'

	var ticksStyle = {
		fontColor: '#495057',
		fontStyle: 'bold'
	}

	var mode = 'index'
	var intersect = true

	var $salesChart = $('#sales-chart')
	// eslint-disable-next-line no-unused-vars
	var salesChart = new Chart($salesChart, {
		type: 'bar',
		data: {
			labels: ['JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC','DEC','DEC','DEC','DEC','DEC'],
			datasets: [{
				backgroundColor: '#007bff',
				borderColor: '#007bff',
				data: [190, 260, 300, 500, 250, 590, 330]
			},
			{
				backgroundColor: '#ced4da',
				borderColor: '#ced4da',
				data: [150, 170, 270, 200, 180, 150, 200]
			}
			]
		},
		options: {
			maintainAspectRatio: false,
			tooltips: {
				mode: mode,
				intersect: intersect
			},
			hover: {
				mode: mode,
				intersect: intersect
			},
			legend: {
				display: false
			},
			scales: {
				yAxes: [{
					// display: false,
					gridLines: {
						display: true,
						lineWidth: '4px',
						color: 'rgba(0, 0, 0, .2)',
						zeroLineColor: 'transparent'
					},
					ticks: $.extend({
						beginAtZero: true,

						// Include a dollar sign in the ticks
						callback: function(value) {
							if (value >= 1000) {
								value /= 1000
								value += 'k'
							}

							return '$' + value
						}
					}, ticksStyle)
				}],
				xAxes: [{
					display: true,
					gridLines: {
						display: false
					},
					ticks: ticksStyle
				}]
			}
		}
	})

	

	$(document).ready(() => {
		var $visitorsChart = $('#visitors-chart')
	var date = new Date();
	var passedArray1;
	var dayArray = [];
	var totalArray1 = [];
	var totalArray2 = [];
	var passedArray2;
	$.ajax({
		async: false,
		type: "GET",
		url: "/SmartKa/admin/loadchart",
		dataType: "json",
		success: function(res) {
			passedArray1 = res[0]
			console.log(passedArray1)
			passedArray1.map((item) => {
				dayArray.push(item.dateCO)
				totalArray1.push(item.totalmoney)
			})
			passedArray2 = res[1]
			passedArray2.map((item)=> {
				totalArray2.push(item.totalmoney)
			})
			console.log(passedArray2)
		}

	})
		var visitorsChart = new Chart($visitorsChart, {
			data: {
				labels: [dayArray[6], dayArray[5], dayArray[4], dayArray[3], dayArray[2], dayArray[1], dayArray[0]],
				datasets: [{
					type: 'line',
					data: [totalArray1[6], totalArray1[5], totalArray1[4], totalArray1[3], totalArray1[2], totalArray1[1], totalArray1[0]],
					backgroundColor: 'transparent',
					borderColor: '#007bff',
					pointBorderColor: '#007bff',
					pointBackgroundColor: '#007bff',
					fill: true
					// pointHoverBackgroundColor: '#007bff',
					// pointHoverBorderColor    : '#007bff'
				},
				{
					type: 'line',
					data: [totalArray2[6], totalArray2[5], totalArray2[4], totalArray2[3], totalArray2[2], totalArray2[1], totalArray2[0]],
					backgroundColor: 'transparent',
					borderColor: '#ced4da',
					pointBorderColor: '#ced4da',
					pointBackgroundColor: '#ced4da',
					fill: true
					// pointHoverBackgroundColor: '#ced4da',
					// pointHoverBorderColor    : '#ced4da'
				}
				]
			},
			options: {
				maintainAspectRatio: false,
				tooltips: {
					mode: mode,
					intersect: intersect
				},
				hover: {
					mode: mode,
					intersect: intersect
				},
				legend: {
					display: false
				},
				scales: {
					yAxes: [{
						// display: false,
						gridLines: {
							display: true,
							lineWidth: '4px',
							color: 'rgba(0, 0, 0, .2)',
							zeroLineColor: 'transparent'
						},
						ticks: $.extend({
							beginAtZero: true,
							suggestedMax: 250,

							callback: function(value) {


								return '$' + value
							}

						}, ticksStyle)
					}],
					xAxes: [{
						display: true,
						gridLines: {
							display: false
						},
						ticks: ticksStyle
					}]
				}
			}
		})
	})
})

// lgtm [js/unused-local-variable]
$('#calendar').datetimepicker({
	format: 'L',
	inline: true
})