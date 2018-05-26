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
//= require rails-ujs
//= require activestorage
//= require theme/jquery/jquery
//= require theme/popper.js/popper
//= require theme/bootstrap/bootstrap
//= require theme/perfect-scrollbar/js/perfect-scrollbar.jquery
//= require theme/jquery-toggles/toggles.min
//= require theme/d3/d3
//= require theme/rickshaw/rickshaw
//= require theme/Flot/jquery.flot
//= require theme/Flot/jquery.flot.pie
//= require theme/Flot/jquery.flot.resize
//= require theme/flot-spline/jquery.flot.spline
//= require theme/ResizeSensor
//= require toastr.min
//= require_tree .

function msg_show(type, msg) {
  toastr.options = {
    "closeButton": true,
    "progressBar": true,
    "timeOut": "2000"
  };
  toastr[type](msg); //type:info,error,success,warning
}