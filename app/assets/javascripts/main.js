

$(document).on("ready page:load",function(){
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
		$(".slider").slider({full_width:!0}),
		// Initialize collapse button 
		$(".button-collapse").sideNav(),

		window.addEventListener&&window.addEventListener("DOMMouseScroll",e,!1),window.onmousewheel=document.onmousewheel=e,
		$("#flash-message").on("click",".close",function(){
			$(this).parent("#flash-message").fadeOut(250)}),
		$("select").material_select();

		var t=[
		{selector:"#android",offset:20,callback:'Materialize.showStaggeredList("#android")'},
		{selector:"#android",offset:20,callback:"globalFunction()"}];
		Materialize.scrollFire(t)


	});
