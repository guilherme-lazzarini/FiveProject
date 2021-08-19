
window.addEventListener('message', (event) => {
	let data = event.data
	if (data.type == 'open') {
		const nome = data.nome + ' ' + data.sobrenome;
		const emprego = data.emprego;
		const cargo = data.cargo;
		const carteira = data.carteira;
		const vip = data.vip;
		const id = data.id;
		const documento = data.documento;
		const idade = data.idade;
		const banco = data.banco;
		const telefone = data.telefone;
		const multas = data.multas;
		// const estadoCivilData = data.estado_civil;
		// const IsMale = data.isMale


		$('.name p').text(nome);
		$('.name h6 span').text(emprego);
		if (cargo) {
			$('.cargo p span').text(cargo);
		} else {
			$('.cargo').hide();
		}
		$('.carteira p').text('$' + carteira);
		$('.vip p').text(vip);
		$('.identidade p').text(id);
		$('.documento p').text(documento);
		$('.idade p').text(idade);
		$('.banco p').text('$' + banco);
		$('.multas p').text('$' + multas);
		$('.telefone p').text(telefone);
		$('#roxId').fadeIn('fast');
		// switch (estadoCivilData.status) {
		// 	case 'solteiro':
		// 		$('.estado-civil p span').text(IsMale ? 'Solteiro' : 'Solteira')
		// 		break;
		// 	case 'namorando':
		// 		$('.estado-civil p span').text(`Namorando com ${estadoCivilData.conjuge}`)
		// 		break;
		// 	case 'casado':
		// 		$('.estado-civil p span').text(IsMale ? `Casado com ${estadoCivilData.conjuge}` : `Casada com ${estadoCivilData.conjuge}`)
		// 		break;
		// }
	}

	if (data.type == 'close') {
		$('#roxId').fadeOut('slow');
	}
});