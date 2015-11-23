// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require bootstrap
//= require sweet-alert
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  var count = $('.banner').data('count');
  if(count && count % 10 == 0 && count >= 10) {
    sweetAlert("Do you like our site?", "You can clone it from GitHub \nalex-pro/GH_post_application!");
  }
});
