document.addEventListener("turbolinks:load", function() {
  $('.ui.pointing.dropdown').dropdown({on:'hover'});
  $('.special.cards .image').dimmer({on: 'hover'});
  $('form#avatar_form').on('change', function() {
    $(this).submit();
  });
  $('form#avatar_form input#user_avatar').hide();
  $('.ui.rating').rating({
    initialRating: 0,
    maxRating: 5
  });
  $('.ui.dropdown.qty_select').dropdown();
})
