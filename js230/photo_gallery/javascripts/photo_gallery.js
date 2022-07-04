'use strict';

/*
# Requirements:
- Click thumbnail image
- Remove highlight of current highlighted thumbnail
- Highlight clicked thumbnail
- Change main image to clicked thumbnail

# Algorithm
- Wrap everything in jQuery function
-

*/

$(function() {
  $('li img').click(function(e) {
    e.stopPropagation();

    const $targetThumbnail = $(e.target);

    if ($targetThumbnail.hasClass('active')) return;

    const $activeThumbnail = $('.active');
    const $newURL = $targetThumbnail.attr('src');
    const $mainImage = $('figure img');
    $activeThumbnail.removeClass('active');
    $targetThumbnail.addClass('active');

    $mainImage.fadeOut('fast', function() {
      $mainImage.attr('src', $newURL).fadeIn('fast');
    });
  });
});
