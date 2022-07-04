'use strict';

$(function() {
  $('form').submit(function(event) {
    event.preventDefault();
    const $input = $('#key').val();

    $(document).off('keypress').on('keypress', function(event) {
      if (event.key !== $input) return;
      $('a').trigger('click');
    });
  });

  $('a').click(function(event) {
    event.preventDefault();
    $('#accordion').slideToggle();
  });
});
