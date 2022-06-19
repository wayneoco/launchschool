(function() {
  const _ = function(element) {
    function objectHasProperties(obj1, obj2) {
      const obj1Keys = Object.keys(obj1);
      const obj2Keys = Object.keys(obj2);

      return obj2Keys.every(key => {
        if (obj1Keys.includes(key)) {
          return obj1[key] === obj2[key];
        } else {
          return false;
        }
      });
    }

    const u = {
      findWhere(testObject) {
        for (let index = 0; index <= element.length - 1; index += 1) {
          const currentObj = element[index];

          if (objectHasProperties(currentObj, testObject)) {
            return currentObj;
          }
        }
        return undefined;
      },
      first() {
        return element[0];
      },
      has(property) {
        const keys = Object.keys(element);

        return keys.includes(property);
      },
      keys() {
        return Object.keys(element);
      },
      last() {
        return element[element.length - 1];
      },
      lastIndexOf(value) {
        return element.lastIndexOf(value);
      },
      omit(...properties) {
        const newKeys = Object.keys(element).reduce((keys, key) => {
          if (properties.includes(key)) {
            return keys;
          } else {
            keys.push(key);
            return keys;
          }
        }, []);

        const newObj = (function() {
          return newKeys.reduce((obj, key) => {
            obj[key] = element[key];
            return obj;
          }, {});
        })();

        return newObj;
      },
      pick(...properties) {
        const newObj = {};

        properties.forEach(property => {
          if (element[property]) {
            newObj[property] = element[property];
          }
        });

        return newObj;
      },
      pluck(key) {
        const values = [];

        element.forEach(obj => {
          if (obj[key]) {
            values.push(obj[key]);
          }
        });

        return values;
      },
      sample(quantity) {
        const min = 0;
        const max = element.length - 1;

        if (quantity === undefined) {
          const randIndex = (Math.random() * (max - min)) + min;
          return element[randIndex];
        } else {
          const samples = [];
          let count = 0;

          while (count < quantity) {
            const randIndex = (Math.random() * (max - min)) + min;
            samples.push(element[randIndex]);
            count += 1;
          }

          return samples;
        }
      },
      values() {
        return Object.values(element);
      },
      where(testObject) {
        const matches = [];

        for (let index = 0; index <= element.length - 1; index += 1) {
          const currentObj = element[index];

          if (objectHasProperties(currentObj, testObject)) {
            matches.push(currentObj);
          }
        }

        return matches;
      },
      without(...values) {
        return element.reduce((newArray, value) => {
          if (values.includes(value)) {
            return newArray;
          } else {
            newArray.push(value);
            return newArray;
          }
        }, []);
      },
    };

    (['isElement', 'isArray', 'isObject', 'isFunction', 'isString', 'isNumber', 'isBoolean']).forEach(method => {
      u[method] = function() {
        _[method].call(u, element);
      };
    });

    return u;
  };

  _.extend = function(...objects) {
    for (let index = objects.length - 2; index >= 0; index -= 1) {
      Object.assign(objects[index], objects[index + 1]);
    }
    return objects[0];
  };

  _.range = function(first, second) {
    const range = [];

    if (second === undefined) {
      for (let num = 0; num < first; num += 1) {
        range.push(num);
      }
    } else {
      for (let num = first; num < second; num += 1) {
        range.push(num);
      }
    }

    return range;
  };

  _.isElement = function(obj) {
    return obj && obj.nodeType === 1;
  };

  _.isArray = Array.isArray || function(obj) {
    return toString.call(obj) === '[object Array]';
  };

  _.isObject = function(obj) {
    const type = typeof obj;

    return type === 'function' || type === 'object' && !!obj
  };

  _.isFunction = function(obj) {
    const type = typeof obj;

    return type === 'function' && !!obj;
  };

  (['Boolean', 'String', 'Number']).forEach(method => {
    _['is' + method] = (obj) => {
      return toString.call(obj) === '[object ' + method + ']';
    };
  });

  window._ = _;
})();
