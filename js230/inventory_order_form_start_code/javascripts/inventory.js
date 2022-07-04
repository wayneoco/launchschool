'use strict';

let inventory;

(function() {
  inventory = {
    lastId: 0,
    collection: [],
    setDate: function() {
      const date = new Date();
      const formattedDate = new Intl.DateTimeFormat('en-us', {dateStyle: 'full', timeStyle: 'short'}).format(date);
      document.querySelector('#order_date').textContent = formattedDate;
    },
    cacheTemplate: function() {
      const html = document.querySelector("#inventory_item").innerHTML.trim();
      this.template = Handlebars.compile(html);
    },
    add: function() {
      this.lastId++;
      const item = {
        id: this.lastId,
        name: "",
        stock_number: "",
        quantity: 1
      };
      this.collection.push(item);

      return item;
    },
    remove: function(idx) {
      this.collection = this.collection.filter(function(item) {
        return item.id !== idx;
      });
    },
    get: function(id) {
      let found_item;

      this.collection.forEach(function(item) {
        if (item.id === id) {
          found_item = item;
          return false;
        }
      });

      return found_item;
    },
    update: function(item) {
      const id = this.findID(item),
          updatedItem = this.get(id);

      updatedItem.name = item.querySelector("[name^=item_name]").value;
      updatedItem.stock_number = item.querySelector("[name^=item_stock_number]").value;
      updatedItem.quantity = item.querySelector("[name^=item_quantity]").value;
    },
    newItem: function(e) {
      e.preventDefault();
      const item = this.add(),
        itemHTML = this.template(item),
        template = document.createElement('template');

      template.innerHTML = itemHTML;

      document.querySelector("#inventory").appendChild(template.content.firstChild);
    },
    findParent: function(e) {
      return e.target.closest("tr");
    },
    findID: function(item) {
      return +item.querySelector("input[type=hidden]").value;
    },
    deleteItem: function(e) {
      e.preventDefault();
      const parent = this.findParent(e);

      this.remove(this.findID(parent));
      parent.remove();
    },
    updateItem: function(e) {
      const item = this.findParent(e);

      this.update(item);
    },
    bindEvents: function() {
      document.querySelector('#add_item').addEventListener('click', e => {
        this.newItem.bind(this)(e);

        const inventory = document.querySelector('#inventory');
        const newestDeleteLink = inventory.lastChild.querySelector('a.delete');
        newestDeleteLink.addEventListener('click', e => {
          e.preventDefault();

          return this.deleteItem.bind(this)(e);
        });

        const newestItemRow = newestDeleteLink.closest('tr');
        newestItemRow.querySelectorAll('input:not([type=hidden])').forEach(input => {
          input.addEventListener('blur', e => {
            return this.updateItem.bind(this)(e);
          });
        });
      });
    },
    init: function() {
      this.setDate();
      this.cacheTemplate();
      this.bindEvents();
    }
  };
})();

document.addEventListener('DOMContentLoaded', e => inventory.init.bind(inventory)());
