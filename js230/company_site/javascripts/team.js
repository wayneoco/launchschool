'use strict';

const team = {
  kevin: {
    firstName: 'Kevin',
    lastName: 'Wang',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  },
  louis: {
    firstName: 'Louis',
    lastName: 'Burton',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  },
  kasper: {
    firstName: 'Kasper',
    lastName: 'Salto',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  },
  chris: {
    firstName: 'Chris',
    lastName: 'Lee',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  }
};

$(function() {
  $('#team-members li a').click(function(e) {
    e.preventDefault();
    e.stopPropagation();

    const teamMember = $(e.currentTarget).attr('data-team');
    const context = team[teamMember];
    const modalTemplate = $('#modal-template').html();
    const modalTemplateFunction = Handlebars.compile(modalTemplate);
    const modal = modalTemplateFunction(context);
    const $modal = $('#modal');
    $modal.html(modal);
    $modal.fadeIn('100');

    $('a#modal-close').click(function(e) {
      e.preventDefault();
      $modal.fadeOut('100');
    });

    $(document).keyup(function(e) {
      e.preventDefault();

      if (e.code !== 'Escape') return;

      $modal.fadeOut('100');
    });
  });
});
