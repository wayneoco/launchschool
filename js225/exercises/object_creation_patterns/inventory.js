let ItemCreator = (function() {
  function isValidInput(name, category, quantity) {
    name = name.replace(/\s/g, '');

    return name.length >= 5 &&
      category.length >= 5 &&
      /^\S+$/.test(category) &&
      quantity !== undefined;
  }

  function createSku(name, category) {
    name = name.replace(/\s/g, '');
    return (name.slice(0, 3) + category.slice(0, 2)).toUpperCase();
  }

  return function(name, category, quantity) {
    if (isValidInput(name, category, quantity)) {
      this.sku = createSku(name, category);
      this.name = name;
      this.category = category;
      this.quantity = quantity;
      return this;
    } else {
      return { notValid: true };
    }
  };
})();

let ItemManager = {
  items: [],

  create(name, category, quantity) {
    const item = new ItemCreator(name, category, quantity);

    if (item.notValid) {
      return false;
    } else {
      this.items.push(item);
      return item;
    }
  },

  update(sku, properties) {
    const item = this.items.find(item => item.sku === sku);
    const keys = Object.keys(properties);
    keys.forEach(property => {
      item[property] = properties[property];
    });
  },

  delete(sku) {
    const item = this.items.find(item => item.sku === sku);
    const itemIndex = this.items.findIndex(currentItem => {
      return currentItem === item;
    });
    this.items.splice(itemIndex, 1);
  },

  inStock() {
    return this.items.filter(item => item.quantity > 0);
  },

  itemsInCategory(category) {
    return this.items.filter(item => item.category === category);
  },
};

let ReportManager = {
  items: null,

  createReporter(sku) {
    const item = this.items.items.find(item => item.sku === sku);
    const itemKeys = Object.keys(item);

    return {
      itemInfo() {
        itemKeys.forEach(key => {
          console.log(`${key}: ${item[key]}`);
        });
      }
    };
  },

  reportInStock() {
    const inStockItems = this.items.inStock().reduce((items, item) => {
      return items.concat(item.name);
    }, []);

    console.log(inStockItems.join(', '));
  },

  init(itemManager) {
    this.items = itemManager;
  },
};

ItemManager.create('basket ball', 'sports', 0);           // valid item
ItemManager.create('asd', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports');
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking items', 0);
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

console.log(ItemManager.items);
// returns list with the 4 valid items

ReportManager.init(ItemManager);
ReportManager.reportInStock();
// logs soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
console.log(ItemManager.inStock());
// returns list with the item objects for football and kitchen pot
ReportManager.reportInStock();
// logs football,kitchen pot
console.log(ItemManager.itemsInCategory('sports'));
// returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
console.log(ItemManager.items);
// returns list with the remaining 3 valid items
// (soccer ball is removed from the list)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10
