'use strict';

document.addEventListener('DOMContentLoaded', () => {
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
      this.commentsScript = templates.scripts.photo_comments;
    }

    render() {
      const commentsHTML = this.commentsScript({ comments: this.comments });
      this.commentsList.innerHTML = commentsHTML;
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
    }
  }

  class Slideshow {
    constructor() {
      this.previous = document.querySelector('.prev');
      this.next = document.querySelector('.next');
    }

    addEventListeners() {
      this.previous.addEventListener('click', this.previous);
      this.next.addEventListener('click', this.next);
    }

    previous(e) {
      e.preventDefault();
      const activePhoto = document.querySelector('.active');
      const previousPhoto = activePhoto.previousElementSibling || activePhoto.parentElement.lastElementChild;
      const previousPhotoId = previousPhoto.dataset['id'];
      this.setClasses(activePhoto, previousPhoto);
      this.renderPhotoInfo(previousPhotoId);
      this.fetchComments(previousPhotoId);
    }

    next(e) {

    }

    setClasses(activePhoto, inactivePhoto) {
      activePhoto.classList.replace('active', 'inactive');
      inactivePhoto.classList.replace('inactive', 'active');
    }

    renderPhotoInfo(photoId) {
      photos.renderInfo(photos.photos[photoId - 1]);
    }

    async fetchComments(photoId) {
      const comments = new Comments(photoId);
      comments.init();
    }

    init() {
      this.addEventListeners();
    }
  }

  const templates = new Templates();
  await templates.init();

  const photos = new Photos();
  await photos.init();

  const comments = new Comments(photos.photos[0].id);
  comments.init();

  const slideshow = new Slideshow();
  slideshow.init();
});
