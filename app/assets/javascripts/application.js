// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require slick
//= require semantic-ui
//= require_tree .
$(document).on('change', 'select#line_item_quantity', function() {
  var form = $(this).closest('form');
  $(form).submit();
})

$(document).on('click', '.button_to', function() {
  var qty = $('select').val();
  $(this).closest('form').append("<input type='hidden' name='qty' value='" +
    qty + "' >");
})

$(document).on('focus', '#order_payment_method', function() {
  $('option[value=""]').remove();
})

$(document).on('click', '.clickable_row', function() {
    window.location = $(this).data('href');
});

$(document).on('focus', '#product_category_id', function() {
  $('option[value=""]').remove();
})
