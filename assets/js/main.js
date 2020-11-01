AOS.init({
	easing: 'ease-in-out-sine',
	offset: 120,
	delay: 0,
	disable: false,
	once: true
});

// slides de fotos
$('.covers').slick({
	infinite: false,
	slidesToShow: 1,
	slidesToScroll: 1,
	autoplay: true,
	autoplaySpeed: 1500,
	arrows: false
});

// load inicial
$( document ).ready(function() {
	$( ".load" ).fadeOut( "slow", function() {});
	$( ".load-surprise" ).fadeOut( "slow", function() {});
});


// rock conecxão
$('.letsRock').click(function(){
	let id = $(this).attr('data-id');
	$('#result'+id).addClass('rock');
	$('#result'+id).fadeOut( "slow", function() {});
	surprise();
});

// rejeitar conexão
$('.letsReject').click(function(){
	let id = $(this).attr('data-id');
	$('#result'+id).addClass('reject');
	$('#result'+id).fadeOut( "slow", function() {});
	surprise();
});

// Adicionar o load do surpreenda
$('.surprise').click(function(){
	el = $('.surprise span');
	stage = parseInt(el.text());
	if(stage >= 15){
		$('.load-surprise').removeClass('d-none');
		setTimeout(() => {
			window.location.replace('../../surpreenda.html')
		}, 1000);
	}
});

// incrementa o surpreenda
function surprise(){
	el = $('.surprise span');
	stage = parseInt(el.text());
	stage = stage + 5;
	$('.surprise span').text(stage);
	if(stage >= 15){
		$('.surprise').addClass('active');
	}
}

// remove modal de surpreenda
$('.modal_surprise button').click(function(){
	$('.modal_surprise').fadeOut( "slow", function() {});	
})

// abre menu mobile
$('.profile img').click(function(){
	$('.content').addClass('active');	
})

// fecha menu mobile
$('.close').click(function(){
	$('.content').removeClass('active');	
})