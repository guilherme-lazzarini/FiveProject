let mascaraf = 190;
let mascaram = 192;
let gravataf = 120;
let gravatam = 150;
let mochilaf = 90;
let mochilam = 91;
let maosf = 239;
let maosm = 194;
let calcaf = 142;
let calcam = 132;
let blusaf = 218;
let blusam = 177;
let sapatof = 105;
let sapatom = 101;
let jaquetaf = 407;
let jaquetam = 375;
let chapeuf = 151;
let chapeum = 152;
let oculosf = 35;
let oculosm = 33;
let orelhaf = 17;
let orelham = 35;
let coletef = 32;
let coletem = 28;
let relogiof = 29;
let relogiom = 40;
let pulseiraf = 15;
let pulseiram = 8;
let OnSelectOption = true;

let roupas = { "mascaraf":0, "mascaram":0, "gravataf":0, "gravatam":0, "mochilaf":0, "mochilam":0, "maosf":0, "maosm":0, "calcaf":0, "calcam":0, "blusaf":0, "blusam":0, "sapatof":0, "sapatom":0, "jaquetaf":0, "jaquetam":0, "chapeuf":0, "chapeum":0, "oculosf":0, "oculosm":0, "orelhaf":-1, "orelham":-1, "coletef":0, "coletem":0, "relogiof":0, "relogiom":0, "pulseiraf":-1, "pulseiram":-1 }

let parar = false;

$(function(){
	
	$("#menu").hide();
	window.model = "m";
    listarImagens();
    var maos = false;

	window.addEventListener('message', function(event){
		var item = event.data;

		if(item.showMenu == true){
			showMenu(true);
            $("hr").hide();
            $("footer").hide();
            $("#menu").css("height", "240px");
            $("#menu").css("top", "30%");
            $("#itens").hide();
		} else {
			showMenu(false);
		}

		if (item.masc !== true){
			window.model = "f";
		}

	});

	menu();

	// Fechar NUI no Esc
	document.onkeyup = function(data){
		if(data.key == 'Escape' && OnSelectOption == true){ // FECHAR TUDO
            $("#selectors button").css("border", "");
            $("hr").hide();
            $("footer").hide();
/*             $("#menu").css("height", "240px");
            $("#menu").css("top", "30%"); */
            $("#itens").hide();
			$.post('http://lojaderoupas/exit', JSON.stringify("true")); 
        } 
        
        else if(data.key == 'Escape' && OnSelectOption == false) {   // VOLTAR/INICIAL
            $("#selectors button").css("border", "");
            $("hr").hide();
            $("footer").hide();
            $("#menu").css("height", "240px");
            $("#menu").css("top", "30%");
            $("#itens").hide();
            OnSelectOption = true;
        }
        
        
        else if(data.key == 'a'){
			$.post('http://lojaderoupas/rotate', JSON.stringify("left"));
		} else if(data.key == 'd') {
			$.post('http://lojaderoupas/rotate', JSON.stringify("right"));
		} else if(data.key == 'ArrowRight') { 
			$.post('http://lojaderoupas/color', JSON.stringify("right"));
		} else if(data.key == 'ArrowLeft') {
			$.post('http://lojaderoupas/color', JSON.stringify("left"));
		} else if(data.key == 'x') { // up
            if (maos === false) {
			    $.post('http://lojaderoupas/maos', JSON.stringify("up"));
                maos = true;
            } else {
			    $.post('http://lojaderoupas/maos', JSON.stringify("down"));
                maos = false
            }
		}
	}

});


async function listarImagens() {
    for (i=0; i<=mascaraf; i++) { // Mascaras Feminino
        $("#mascaraf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-mascaraf-${i}" data-src="http://25.7.145.39/vrp_roupas/1/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=mascaram; i++) { // Mascaras Masculino
        $("#mascaram").append(`
            <button class="botao" data-action="${i}">
                <img class="img-mascaram-${i}" data-src="http://25.7.145.39/vrp_roupas/1/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=gravataf; i++) { // Acessorios Feminino
        $("#gravataf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-gravataf-${i}" data-src="http://25.7.145.39/vrp_roupas/7/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=gravatam; i++) { // Acessorios Masculino
        $("#gravatam").append(`
            <button class="botao" data-action="${i}">
                <img class="img-gravatam-${i}" data-src="http://25.7.145.39/vrp_roupas/7/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=mochilaf; i++) { // Mochilas Feminino
        $("#mochilaf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-mochilaf-${i}" data-src="http://25.7.145.39/vrp_roupas/5/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=mochilam; i++) { // Mochilas Masculino
        $("#mochilam").append(`
            <button class="botao" data-action="${i}">
                <img class="img-mochilam-${i}" data-src="http://25.7.145.39/vrp_roupas/5/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=maosf; i++) { // Mãos Feminino
        $("#maosf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-maosf-${i}" data-src="http://25.7.145.39/vrp_roupas/3/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=maosm; i++) { // Mãos Masculino
        $("#maosm").append(`
            <button class="botao" data-action="${i}">
                <img class="img-maosm-${i}" data-src="http://25.7.145.39/vrp_roupas/3/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }


    for (i=0; i<=calcaf; i++) { // Calças Feminino
        $("#calcaf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-calcaf-${i}" data-src="http://25.7.145.39/vrp_roupas/4/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=calcam; i++) { // Calças Masculino
        $("#calcam").append(`
            <button class="botao" data-action="${i}">
                <img class="img-calcam-${i}" data-src="http://25.7.145.39/vrp_roupas/4/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=blusaf; i++) { // Blusas Feminino
        $("#blusaf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-blusaf-${i}" data-src="http://25.7.145.39/vrp_roupas/8/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=blusam; i++) { // Blusas Masculino
        $("#blusam").append(`
            <button class="botao" data-action="${i}">
                <img class="img-blusam-${i}" data-src="http://25.7.145.39/vrp_roupas/8/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=sapatof; i++) { // Sapatos Feminino
        $("#sapatof").append(`
            <button class="botao" data-action="${i}">
                <img class="img-sapatof-${i}" data-src="http://25.7.145.39/vrp_roupas/6/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=sapatom; i++) { // Sapatos Masculino
        $("#sapatom").append(`
            <button class="botao" data-action="${i}">
                <img class="img-sapatom-${i}" data-src="http://25.7.145.39/vrp_roupas/6/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=jaquetaf; i++) { // Jaquetas Feminino
        $("#jaquetaf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-jaquetaf-${i}" data-src="http://25.7.145.39/vrp_roupas/11/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=jaquetam ; i++) { // Jaquetas Masculino
        $("#jaquetam").append(`
            <button class="botao" data-action="${i}">
                <img class="img-jaquetam-${i}" data-src="http://25.7.145.39/vrp_roupas/11/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=chapeuf; i++) { // Chapeus Feminino
        $("#chapeuf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-chapeuf-${i}" data-src="http://25.7.145.39/vrp_roupas/p0/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=chapeum; i++) { // Chapeus Masculino
        $("#chapeum").append(`
            <button class="botao" data-action="${i}">
                <img class="img-chapeum-${i}" data-src="http://25.7.145.39/vrp_roupas/p0/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=oculosf; i++) { // Oculos Feminino
        $("#oculosf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-oculosf-${i}" data-src="http://25.7.145.39/vrp_roupas/p1/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=oculosm; i++) { // Oculos Masculino
        $("#oculosm").append(`
            <button class="botao" data-action="${i}">
                <img class="img-oculosm-${i}" data-src="http://25.7.145.39/vrp_roupas/p1/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=-1; i<=orelhaf; i++) { // Orelhas Feminino
        $("#orelhaf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-orelhaf-${i}" data-src="http://25.7.145.39/vrp_roupas/p2/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=-1; i<=orelham; i++) { // Orelhas Masculino
        $("#orelham").append(`
            <button class="botao" data-action="${i}">
                <img class="img-orelham-${i}" data-src="http://25.7.145.39/vrp_roupas/p2/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=coletef; i++) { // Coletes Feminino
        $("#coletef").append(`
            <button class="botao" data-action="${i}">
                <img class="img-coletef-${i}" data-src="http://25.7.145.39/vrp_roupas/9/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=coletem; i++) { // Coletes Masculino
        $("#coletem").append(`
            <button class="botao" data-action="${i}">
                <img class="img-coletem-${i}" data-src="http://25.7.145.39/vrp_roupas/9/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=0; i<=relogiof; i++) { // Relogios Feminino
        $("#relogiof").append(`
            <button class="botao" data-action="${i}">
                <img class="img-relogiof-${i}" data-src="http://25.7.145.39/vrp_roupas/p6/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=0; i<=relogiom; i++) { // Relogios Masculino
        $("#relogiom").append(`
            <button class="botao" data-action="${i}">
                <img class="img-relogiom-${i}" data-src="http://25.7.145.39/vrp_roupas/p6/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    
    for (i=-1; i<=pulseiraf; i++) { // Pulseiras Feminino
        $("#pulseiraf").append(`
            <button class="botao" data-action="${i}">
                <img class="img-pulseiraf-${i}" data-src="http://25.7.145.39/vrp_roupas/p7/Female/F(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }

    for (i=-1; i<=pulseiram; i++) { // Pulseiras Masculino
        $("#pulseiram").append(`
            <button class="botao" data-action="${i}">
                <img class="img-pulseiram-${i}" data-src="http://25.7.145.39/vrp_roupas/p7/Male/M(${i}).jpg"/>
                <span>${i}</span>
            </button>
        `)
    }
}


function showMenu(bool){
    if (bool) {
        $("div").each(function(i,obj){
            var element = $(this);

            if (element.attr("data-parent")){
                element.hide();
            } else {
                element.fadeIn(500);
            }
        });
    } else {
        $("#menu").fadeOut(500);
    }
}

function menu(){
    $(".classes").each(function(i, ojb){
        var menu = $(this).data("sub");
        var element = $("#"+menu);
        
        $(this).click(async function() {
            parar = true;
            OnSelectOption=false;
            $("#selectors button").css("border", "");
            $(this).css("border", "1px solid #FF0000");  
            $("#menu").css("height", "75%"); 
            $("#menu").css("top", "14%");
            $("hr").show();
            $("#itens").show();
            $("footer").css("display", "inline-flex");
            if (typeof model !== 'undefined') {
                var element = $("#"+menu+model);
            } else {
                var element = $("#"+menu+"m");
            }

            $(".item").each(function(i, ojb){
                $(this).hide()
            });
            
            element.fadeIn(500);

            await new Promise(resolve => setTimeout(resolve, 100));
            parar = false;

            for (i=roupas[menu+model]; i<=eval(menu+model); i++) {
                if (!parar) {
                    // console.log(".img-"+menu+model+"-"+i)
                    $(".img-"+menu+model+"-"+i).attr('src', $(".img-"+menu+model+"-"+i).attr("data-src"));
                    roupas[menu+model] = i+1;
                    await new Promise(resolve => setTimeout(resolve, 50));
                } else {
                    break;
                }
            }
        });
    });


    $(".botao").each(function(i, ojb){
        $(this).click(function(){
            $(".item button").css("background-color", "white");
            $(this).css("background-color", "#FF0000");
            if($(this).parent().attr("id") == "mascaraf" || $(this).parent().attr("id") == "mascaram"){
                var dados = 1;
            }
            if($(this).parent().attr("id") == "maosf" || $(this).parent().attr("id") == "maosm"){
                var dados = 3;
            }
            if($(this).parent().attr("id") == "calcaf" || $(this).parent().attr("id") == "calcam"){
                var dados = 4;
            }
            if($(this).parent().attr("id") == "mochilaf" || $(this).parent().attr("id") == "mochilam"){
                var dados = 5;
            }
            if($(this).parent().attr("id") == "sapatof" || $(this).parent().attr("id") == "sapatom"){
                var dados = 6;
            }
            if($(this).parent().attr("id") == "gravataf" || $(this).parent().attr("id") == "gravatam"){
                var dados = 7;
            }
            if($(this).parent().attr("id") == "blusaf" || $(this).parent().attr("id") == "blusam"){
                var dados = 8;
            }
            if($(this).parent().attr("id") == "coletef" || $(this).parent().attr("id") == "coletem"){
                var dados = 9;
            }
            if($(this).parent().attr("id") == "adesivof" || $(this).parent().attr("id") == "adesivom"){
                var dados = 10;
            }
            if($(this).parent().attr("id") == "jaquetaf" || $(this).parent().attr("id") == "jaquetam"){
                var dados = 11;
            }
            if($(this).parent().attr("id") == "chapeuf" || $(this).parent().attr("id") == "chapeum"){
                var dados = 100;
            }
            if($(this).parent().attr("id") == "oculosf" || $(this).parent().attr("id") == "oculosm"){
                var dados = 101;
            }
            if($(this).parent().attr("id") == "orelhaf" || $(this).parent().attr("id") == "orelham"){
                var dados = 102;
            }
            if($(this).parent().attr("id") == "pulseiraf" || $(this).parent().attr("id") == "pulseiram"){
                var dados = 107;
            }
            if($(this).parent().attr("id") == "relogiof" || $(this).parent().attr("id") == "relogiom"){
                var dados = 106;
            }


            var tipo = $(this).data("action");
            $.post("http://lojaderoupas/update", JSON.stringify([dados, tipo]));
        })
    })
}