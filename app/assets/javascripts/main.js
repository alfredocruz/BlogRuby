$(document).ready(function(){
	function e(e){
		var t=0;
		e.wheelDelta?t=e.wheelDelta/120:
		e.detail&&(t=-e.detail/3),l(t),
		e.preventDefault&&e.preventDefault(),
		e.returnValue=!1}

		function l(e){
			var l=1e3,t=230;
			$("html, body")
			.stop().animate({scrollTop:
				$(window)
				.scrollTop()-t*e},l)
		}
		$(".dropdown-button").dropdown(),
		$(".slider").slider(),
		// Initialize collapse button 
		$(".button-collapse").sideNav(),

		window.addEventListener&&window.addEventListener("DOMMouseScroll",e,!1),window.onmousewheel=document.onmousewheel=e,
		$("select").material_select();

	$( "#buscador" ).click(function() {
  		$( ".buscador" ).removeClass( "animation-out" );
  		$( ".buscador" ).addClass( "animacion" );
  		$( ".navbar-fixed" ).addClass( "animation-out" );

	});
	$( "#salir" ).click(function() {
		$( ".buscador" ).removeClass( "animacion" );
  		$( ".buscador" ).addClass( "animation-out" );
  		$( ".navbar-fixed" ).removeClass( "animation-out" );
	});
	 $('#search').val(' ');
});

