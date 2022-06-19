const foo = {name: 'foo'};

Object.prototype.ancestors = function() {
  let prototypes = [];
  let currentObj = this;
  let prot = Object.getPrototypeOf(currentObj);

  while (prot) {
    prototypes.push(prot.name || 'Object.prototype');
    currentObj = prot;
    prot = Object.getPrototypeOf(currentObj);
  }

  return prototypes;
};

// name property added to make objects easier to identify
const bar = Object.create(foo);
bar.name = 'bar';
const baz = Object.create(bar);
baz.name = 'baz';
const qux = Object.create(baz);
qux.name = 'qux';

console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
console.log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
console.log(bar.ancestors());  // returns ['foo', 'Object.prototype']
console.log(foo.ancestors());  // returns ['Object.prototype']
