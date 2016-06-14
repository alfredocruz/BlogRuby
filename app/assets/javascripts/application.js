// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require 'epiceditor'
//= require_tree .
$(document).ready(function () {
   $('.modal-trigger').leanModal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .5, // Opacity of modal background
      in_duration: 300, // Transition in duration
      out_duration: 200, // Transition out duration
    }
    );
$('ul.tabs').tabs();
$('ul.tabs').tabs('select_tab', 'test1');

(function(doc, script) {
    var js,
        fjs = doc.getElementsByTagName(script)[0],
        add = function(url, id) {
            if (doc.getElementById(id)) {return;}
            js = doc.createElement(script);
            js.src = url;
            id && (js.id = id);
            fjs.parentNode.insertBefore(js, fjs);
        };
    // Google Analytics
    add(('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js', 'ga');
    // Facebook SDK
     add('//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5&appId=316086441848514');
}(document, 'script'));

$('.Hide').click(function() {
    $('#target').hide(500);
});
$('.toggle').click(function() {
    $('#target').toggle('slow');
    $("html, body").animate({ scrollTop: 0 }, 600);
});

$( ".juegos" ).hover(
  function() {
    $( this ).addClass( "green darken-2" );
  }, function() {
    $( this ).removeClass( "green darken-2" );
  }
);

$( ".comunicacion" ).hover(
  function() {
    $( this ).addClass( "teal darken-2" );
  }, function() {
    $( this ).removeClass( "teal darken-2" );
  }
);

$( ".multimedia" ).hover(
  function() {
    $( this ).addClass( "blue darken-2" );
  }, function() {
    $( this ).removeClass( "blue darken-2" );
  }
);

$( ".lifestyle" ).hover(
  function() {
    $( this ).addClass( "deep-orange darken-4" );
  }, function() {
    $( this ).removeClass( "deep-orange darken-4" );
  }
);

$( ".productividad" ).hover(
  function() {
    $( this ).addClass( "blue-grey darken-3" );
  }, function() {
    $( this ).removeClass( "blue-grey darken-3" );
  }
);

$( ".herramientas" ).hover(
  function() {
    $( this ).addClass( "cyan darken-2" );
  }, 
  function() {
    $( this ).removeClass( "cyan darken-2" );
  }
);

});
