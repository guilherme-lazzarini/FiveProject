$(document).ready(function(){
	window.addEventListener("message",function(event){
		if (event.data.active == true) {
			$("#displayHud").css("display","block");
			$("#displayBars").css("visibility","visible");
			$("#displayHud").css("visibility","visible");
			$(".clockBack .clockDisplayText").html("KDA "+ event.data.kill +"/"+ event.data.death);

			$(".healthHover").css("width", parseInt(event.data.health) / 3 + "%");

			if (parseInt(event.data.health) / 3 == 1) {
				$(".healthHover").css("width","0");
			}

			if (event.data.vehicle == true) {
				$(".staminaOrGas").css("background", "url(images/gas.png) center no-repeat");
				$(".staminaOrGasHover").css("width", event.data.fuel + "%");
				$("#displayVehicle").css("display","block");
				if (event.data.seatbelt == true) {
					$("#displayVehicle").addClass("seatbelt").html(event.data.speed+"<s> KMH</s>");
				} else {
					$("#displayVehicle").removeClass("seatbelt").html(event.data.speed+"<b> KMH</b>");
				}
			} else {
				$("#displayVehicle").css("display","none");
				$(".staminaOrGas").css("background", "url(images/stamina.png) center no-repeat");
				$(".staminaOrGasHover").css("width", event.data.stamina + "%");
			}
		} else {
			$("#displayHud").css("visibility","hidden");
			$("#displayBars").css("visibility","hidden");
			$("#displayVehicle").css("display","none");
		}

		if (event.data.talking == true) {
			$(".voiceBack i").css("color", "rgb(255, 164, 0)");
		} else {
			$(".voiceBack i").css("color", "rgba(255,255,255,0.7)");
		}

		if (event.data.onradio == true) {
			$(".radioBack").css("color", "rgba(255,255,255,0.7)");
			$(".radioBack").addClass("over-radio").html(event.data.frequency+" Mhz");
		} else {
			$(".radioBack").css("color", "rgba(255,255,255,0.0)");
		}

		if (event.data.voice == 1) {
			$(".voiceDisplay1").css("display", "block");
			$(".voiceBack i").css("filter", "drop-shadow(0 0 1px rgba(40, 200, 40, 1))");
			$("#voice").text("");
			$(".voiceDisplay2").css("display", "none");
			$(".voiceDisplay3").css("display", "none");
		}

		if (event.data.voice == 2) {
			$(".voiceDisplay1").css("display", "none");
			$(".voiceDisplay2").css("display", "block");
			$(".voiceBack i").css("filter", "drop-shadow(0 0 1px rgba(0, 0, 150, 1))");
			$("#voice").text("");
			$(".voiceDisplay3").css("display", "none");
		}

		if (event.data.voice == 3) {
			$(".voiceDisplay1").css("display", "none");
			$(".voiceDisplay2").css("display", "none");
			$(".voiceDisplay3").css("display", "block");
			$(".voiceBack i").css("filter", "drop-shadow(0 0 1px rgba(255, 0, 0, 1))");
			$("#voice").text("");
		}

		if (event.data.movie == true){
			$("#movieTop").css("display","block");
			$("#movieBottom").css("display","block");
			$("#displayLogo").css("display","none");
			$("#displayHud").css("display","none");
		} else {
			$("#movieTop").css("display","none");
			$("#movieBottom").css("display","none");
			$("#displayLogo").css("display","block");
			$("#displayHud").css("display","block");
		}
	})
});