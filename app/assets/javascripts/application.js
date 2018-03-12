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
  $('#sticky-nav').hide();

  if(window.location.pathname == '/') {
    waypoint();
  };
});

const waypoint = () => {
  var waypoint = new Waypoint({
    element: document.getElementsByClassName('section-benefits'),
    handler: function(direction) {
      if(direction == 'down') {
        $('#sticky-nav').show();
        $('#sticky-nav').addClass('fixed-top')
      } else {
        $('#sticky-nav').hide();
        $('#sticky-nav').removeClass('fixed-top')
      }
    },
    offset: 60
  });
}
