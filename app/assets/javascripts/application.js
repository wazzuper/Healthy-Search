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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require toastr
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('nav.navbar.navbar-expand-sm.navbar-light').hide();

  var waypoint = new Waypoint({
    element: document.getElementsByClassName('benefits'),
    handler: function(direction) {
      if(direction == 'down') {
        $('nav.navbar.navbar-expand-sm.navbar-light').show();
        $('nav.navbar.navbar-expand-sm.navbar-light').addClass('fixed-top')
      } else {
        $('nav.navbar.navbar-expand-sm.navbar-light').hide();
        $('nav.navbar.navbar-expand-sm.navbar-light').removeClass('fixed-top')
      }
    },
    offset: 100
  });
});
