'use strict';

document.addEventListener('DOMContentLoaded', () => {
  const imagesContainer = document.querySelector('.grid-container');
  let timer;

  imagesContainer.addEventListener('mouseover', e => {
    e.stopPropagation();

    if (e.target.tagName === 'IMG') {
      timer = setTimeout(() => {
        const caption = e.target.nextElementSibling;
        caption.classList.replace('hide', 'show');
      }, 2000);
    }
  });

  imagesContainer.addEventListener('mouseout', e => {
    e.stopPropagation();

    if (e.target.tagName === 'IMG') {
      clearTimeout(timer);
      const caption = e.target.nextElementSibling;
      if (caption.className === 'show') {
        caption.classList.replace('show', 'hide');
      }
    }
  });
});
