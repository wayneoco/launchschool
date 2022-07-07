'use strict';

let templates;

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

document.addEventListener('DOMContentLoaded', () => {
  templates = new Templates();
  templates.init();
})
