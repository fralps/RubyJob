// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

// ---------- TEMPLATE'S JS --------------
//= require jquery/jquery.min
//= require jquery/jquery-migrate.min
//= require bootstrap/js/bootstrap.bundle.min
//= require easing/easing.min
//= require superfish/hoverIntent
//= require superfish/superfish.min
//= require wow/wow.min
//= require venobox/venobox.min
//= require contactform/contactform
//= require js/main

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// JQuery
$(document).ready(function() {
	// Make an element disappear after a short time
	$('.delay_fadeout').delay(2750).fadeOut(400); 
});