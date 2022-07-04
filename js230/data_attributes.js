'use strict';

$(function() {
  $('a').on('click', function(e) {
    e.preventDefault();

    $('article').hide();
    $('article').filter(`[data-block=${$(this).attr('data-block')}]`).show();
  });
});
