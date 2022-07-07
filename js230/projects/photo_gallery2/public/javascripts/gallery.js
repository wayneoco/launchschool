'use strict';

let templates;
let photos;
let slideshow;
let likesAndFavorites;
let comments;

class Templates {
  constructor() {
    this.scripts = {};
    this.templateElements = document.querySelectorAll("script[type='text/x-handlebars']");
    this.partialElements = document.querySelectorAll("script[data-type='partial']");
  }

  createTemplates() {
    this.templateElements.forEach(template => {
      this.scripts[template.id] = Handlebars.compile(template.innerHTML);
    });
  }

  createPartials() {
    this.partialElements.forEach(template => {
      Handlebars.registerPartial(template.id, template.innerHTML);
    });
  }

  init() {
    this.createTemplates();
    this.createPartials();
  }
}

class Photos {
  constructor() {
    this.photos;
    this.slides = document.querySelector('#slides');
    this.sectionHeader = document.querySelector('section header');
    this.photosScript = templates.scripts.photos;
    this.photoInfoScript = templates.scripts.photo_information;
  }

  render() {
    const photosHTML = this.photosScript({ photos: this.photos });
    this.slides.insertAdjacentHTML('beforeend', photosHTML);
    document.querySelector('#slides figure').classList.add('active');
    document.querySelectorAll('#slides figure + figure').forEach(el => el.classList.add('inactive'));
  }

  renderInfo(photo) {
    const photoInfoHTML = this.photoInfoScript(photo);
    this.sectionHeader.innerHTML = photoInfoHTML;
  }

  async fetch() {
    await fetch('/photos')
      .then(response => response.json())
      .then(json => {
        this.photos = json;
      });
  }

  async init() {
    await this.fetch();
    this.render();
    this.renderInfo(this.photos[0]);
  }
}

class Comments {
  constructor(photoId) {
    this.comments;
    this.photoId = photoId;
    this.commentsList = document.querySelector('#comments ul');
    this.commentsForm = document.querySelector('#comments form');
    this.commentsScript = templates.scripts.photo_comments;
    this.addCommentScript = templates.scripts.photo_comment;
  }

  render() {
    const commentsHTML = this.commentsScript({ comments: this.comments });
    this.commentsList.innerHTML = commentsHTML;
  }

  addEventListener() {
    this.commentsForm.addEventListener('submit', this.formSubmitEventHandler.bind(this));
  }

  formSubmitEventHandler(e) {
    e.preventDefault();
    e.stopPropagation();
    const data = new FormData(this.commentsForm);
    const path = e.target.action;
    const queryString = new URLSearchParams(data).toString();
    this.postData(path, queryString);
  }

  postData(path, queryString) {
    fetch(path, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
      },
      body: queryString,
    })
    .then(response => response.json())
    .then(json => {
      const newCommentHTML = this.addCommentScript(json);
      this.commentsList.insertAdjacentHTML('beforeend', newCommentHTML);
      this.commentsForm.reset();
    });
  }

  async fetch() {
    await fetch(`/comments?photo_id=${this.photoId}`)
      .then(response => response.json())
      .then(json => {
        this.comments = json;
      });
  }

  async init() {
    await this.fetch();
    this.render();
    this.addEventListener();
  }
}

class Slideshow {
  constructor() {
    this.previous = document.querySelector('.prev');
    this.next = document.querySelector('.next');
  }

  addEventListeners() {
    this.previous.addEventListener('click', this.previousEventHandler.bind(this));
    this.next.addEventListener('click', this.nextEventHandler.bind(this));
  }

  previousEventHandler(e) {
    e.preventDefault();
    const activePhoto = document.querySelector('.active');
    const previousPhoto = activePhoto.previousElementSibling || activePhoto.parentElement.lastElementChild;
    const previousPhotoId = previousPhoto.dataset['id'];
    this.setClasses(activePhoto, previousPhoto);
    this.renderPhotoInfo(previousPhotoId);
    this.renderLikesAndFavorites(previousPhotoId);
    this.renderComments(previousPhotoId);
    this.setFormId(previousPhotoId);
  }

  nextEventHandler(e) {
    e.preventDefault();
    const activePhoto = document.querySelector('.active');
    const nextPhoto = activePhoto.nextElementSibling || activePhoto.parentElement.firstElementChild;
    const nextPhotoId = nextPhoto.dataset['id'];
    this.setClasses(activePhoto, nextPhoto);
    this.renderPhotoInfo(nextPhotoId);
    this.renderLikesAndFavorites(nextPhotoId);
    this.renderComments(nextPhotoId);
    this.setFormId(nextPhotoId);
  }

  setClasses(activePhoto, inactivePhoto) {
    activePhoto.classList.replace('active', 'inactive');
    inactivePhoto.classList.replace('inactive', 'active');
  }

  renderPhotoInfo(photoId) {
    photos.renderInfo(photos.photos[photoId - 1]);
  }

  renderLikesAndFavorites(photoId) {
    const likesAndFavorites = new LikesAndFavorites(photoId);
    likesAndFavorites.init();
  }

  async renderComments(photoId) {
    comments.photoId = photoId;
    await comments.fetch();
    comments.render();
  }

  setFormId(photoId) {
    const commentsForm = document.querySelector('#comments form');
    const hiddenInput = commentsForm.querySelector("input[type='hidden']");
    hiddenInput.value = photoId;
  }

  init() {
    this.addEventListeners();
  }
}

class LikesAndFavorites {
  constructor(photoId) {
    this.photoId = photoId;
    this.actionsContainer = document.querySelector('.actions');
  }

  addEventListeners() {
    this.actionsContainer.addEventListener('click', e => {
      e.preventDefault();
      e.stopPropagation();
      this.postData(e.target, this.photoId);
    });
  }

  setActionsWord(action, numberOfActions) {
    if (numberOfActions === 1) {
      return action.slice(0, -1);
    } else {
      return `${action}`;
    }
  }

  setActionsSymbol(action) {
    if (action === 'likes') {
      return '♡';
    } else {
      return '☆';
    }
  }

  postData(target, photoId) {
    const href = target.href;

    fetch(href, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
      },
      body: 'photo_id=' + photoId,
    })
      .then(response => response.json())
      .then(json => {
        const numberOfActions = json.total;
        const actionsWord = this.setActionsWord(target.dataset.property, numberOfActions);
        const actionsSymbol = this.setActionsSymbol(target.dataset.property);
        const button = document.querySelector(`a[data-property='${target.dataset.property}']`);
        button.textContent =
          `${actionsSymbol} ${numberOfActions} ${actionsWord[0].toUpperCase() + actionsWord.slice(1)}`;
      });
  }

  init() {
    this.addEventListeners();
  }
}

document.addEventListener('DOMContentLoaded', async () => {
  templates = new Templates();
  templates.init();

  photos = new Photos();
  await photos.init();

  const firstPhoto = photos.photos[0];

  slideshow = new Slideshow();
  slideshow.init();

  likesAndFavorites = new LikesAndFavorites(firstPhoto);
  likesAndFavorites.init();

  comments = new Comments(firstPhoto);
  comments.init();
});
