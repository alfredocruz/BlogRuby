 $(document).on('ready page:load', function () {

 	$(".dropdown-button").dropdown();
 	$('.slider').slider({full_width: true});
	$(".button-collapse").sideNav();
	init();

	if (window.addEventListener) window.addEventListener('DOMMouseScroll', wheel, false);
window.onmousewheel = document.onmousewheel = wheel;

function wheel(event) {
	var delta = 0;
	if (event.wheelDelta) delta = event.wheelDelta / 120;
	else if (event.detail) delta = -event.detail / 3;

	handle(delta);
	if (event.preventDefault) event.preventDefault();
	event.returnValue = false;
}

function handle(delta) {
	var time 	= 1000;
	var distance 	= 400;

	$('html, body').stop().animate({
		scrollTop: $(window).scrollTop() - (distance * delta)
	}, time );
}
//este codigo es para los mensajes flash
  $("#flash-message").on('click', '.close', function() {
    $(this).parent("#flash-message").fadeOut(250);
  });


 $('select').material_select();

 var options = [
    {selector: '.cuadro-1', offset: 200, callback: 'globalFunction()' },
    {selector: '.other-class', offset: 200, callback: 'globalFunction()' },
  ];
  Materialize.scrollFire(options);

});

 function init(){
$.stellar({
		'horizontalScrolling': false,
		hideDistantElements: false
	});

 }


 