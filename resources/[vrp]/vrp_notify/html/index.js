$(document).ready(function () {
	window.addEventListener("message", function (event) {
		let data = event.data;
		if (data.mtype) {
            if (data.mtype === 'adm') {
                var html = ``+
                    `<div class='barra-container2'>`+
                        `<div class='container-icon2' style="background-image: url('img/` + data.mtype + `.png')";></div>`+
                        `<div class='titulo'>Administração</div>`+
                        `<div class='container-text'>`+
                            `<div class='description2'>` + data.mtext + `</div>`+
                        `</div>`+
                    `</div>`;
                $(html).appendTo("#container2").hide().show().addClass('bounceInUp').delay(30000).queue(function (next) {
                    $(this).removeClass('bounceInUp').addClass('bounceOutDown').delay(1000);
                    next();
                }).delay(500).queue(function (next) {
                    $(this).fadeOut(3000).hide().empty();
                })
            } else if (data.mtype === 'callback') {
                var html = ``+
                    `<div class='barra-container2'>`+
                        `<div class='titulo'>Mensagem Privada</div>`+
                        `<div class='container-text'>`+
                            `<div class='description2'>` + data.mtext + `</div>`+
                        `</div>`+
                        `<div class='author'>Mensagem de: ` + data.mauthor + `</div>`+
                    `</div>`;
                    $(html).appendTo("#container2").hide().show().addClass('bounceInUp').delay(30000).queue(function (next) {
                        $(this).removeClass('bounceInUp').addClass('bounceOutDown').delay(1000);
                    next();
                }).delay(500).queue(function (next) {
                    $(this).fadeOut(3000).hide().empty();
                })
            } else if (data.mtype === 'pvp') {
                var html = ``+
                    `<div class='barra-container'>`+
                        `<div class='container-text'>`+
                            `<div class='description3'>` + data.matou + ` <img src='pvp/` + data.arma + `.png'> <font color="ff7074">` + data.morreu + `</font></div>`+
                        `</div>`+
                    `</div>`;
                $(html).appendTo("#container").hide().show().addClass('bounceInRight').delay(5000).queue(function (next) {
                    $(this).removeClass('bounceInRight').addClass('bounceOutRight').delay(1000);
                    next();
                }).delay(500).queue(function (next) {
                    $(this).fadeOut(3000).hide().empty();
                })
            } else if (data.mtype === 'id') {
                var html = ``+
                    `<div class='barra-container'>`+
                        `<div class='container-icon' style="background-image: url('img/` + data.mtype + `.png')";></div>`+
                        `<div class='container-text'>`+
                            `<div class='description'>` + data.mtext + `</div>`+
                        `</div>`+
                    `</div>`;
                $(html).appendTo("#container").hide().show().addClass('bounceInRight').delay(10000).queue(function (next) {
                    $(this).removeClass('bounceInRight').addClass('bounceOutRight').delay(1000);
                    next();
                }).delay(500).queue(function (next) {
                    $(this).fadeOut(3000).hide().empty();
                })
            } else if (data.mtype === 'sucesso') {
                var html = ``+
                    `<div class='barra-container'>`+
                        `<div class='container-icon' style="background-image: url('img/` + data.mtype + `.png')";></div>`+
                        `<div class='container-text'>`+
                            `<div class='description'>` + data.mtext + `</div>`+
                        `</div>`+
                    `</div>`;
                $(html).appendTo("#container").hide().show().addClass('bounceInRight').delay(10000).queue(function (next) {
                    $(this).removeClass('bounceInRight').addClass('bounceOutRight').delay(1000);
                    next();
                }).delay(500).queue(function (next) {
                    $(this).fadeOut(3000).hide().empty();
                })
            } else {
                var html = ``+
                    `<div class='barra-container'>`+
                        `<div class='container-icon' style="background-image: url('img/` + data.mtype + `.png')";></div>`+
                        `<div class='container-text'>`+
                            `<div class='description'>` + data.mtext + `</div>`+
                        `</div>`+
                    `</div>`;
                $(html).appendTo("#container").hide().show().addClass('bounceInRight').delay(5000).queue(function (next) {
                    $(this).removeClass('bounceInRight').addClass('bounceOutRight').delay(1000);
                    next();
                }).delay(500).queue(function (next) {
                    $(this).fadeOut(3000).hide().empty();
                })
            }
		}
	});
});