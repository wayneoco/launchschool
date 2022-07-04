'use strict';

const post1 = {
  title: 'Lorem ipsum dolor sit amet',
  published: 'April 1, 2015',
  tags: ['politics', 'science', 'history'],
  body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. <em>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</em>'
};

const post2 = {
  title: 'Lorem ipsum dolor sit amet',
  published: 'March 3, 1978',
  body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. <em>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</em>'
};

const posts = [post1, post2];

$(function () {
  const postsTemplate = Handlebars.compile($('#posts').html());
  Handlebars.registerPartial('tag', $('#tag').html());

  $('body').append(postsTemplate({ posts: posts }));
});
