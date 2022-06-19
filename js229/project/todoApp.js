'use strict';

const Todo = (function() {
  let currentID = 0;

  function isValidTodo(todo) {
    if (todo.title === undefined) return false;

    return todo.title.trim().length > 0 &&
      ((todo.month && todo.year) ||
        (!todo.month && !todo.year) ||
        (!todo.month && todo.year));
  }

  return function({title, month, year, description, completed}) {
    if (isValidTodo({title, month, year, description, completed})) {
      currentID += 1;
      this.id = currentID;
      this.title = title;
      this.month = month || '';
      this.year = year || '';
      this.description = description || '';
      this.completed = completed || false;
      return this;
    } else {
      return { invalid: true };
    }
  };
})();

Todo.prototype.isWithinMonthYear = function(month, year) {
  return this.month === month && this.year === year;
};

const todoList = (function() {
  const todos = [];

  function findTodoIndex(id) {
    return todos.findIndex(todo => todo.id === id);
  }

  function validProperties(properties) {
    const ALLOWED_PROPERTIES = ['id', 'title', 'month', 'year', 'description'];

    for (let key in properties) {
      if (!ALLOWED_PROPERTIES.includes(key)) return false;
    }

    return true;
  }

  function idIsNotUnique(id) {
    for (let index = 0; index <= todos.length - 1; index += 1) {
      if (todos[index].id === id) return true;
    }
  }

  function copyTodo(todo) {
    const newTodo = {};

    Object.keys(todo).forEach(key => {
      newTodo[key] = todo[key];
    });

    return newTodo;
  }

  return {
    initialize(set) {
      set.forEach(todo => {
        this.add(todo);
      });
    },
    add(todo) {
      const newTodo = new Todo(todo);

      if (newTodo.invalid) {
        return 'Error: Invalid todo';
      } else {
        todos.push(newTodo);
      }
    },
    delete(id) {
      const todoIndex = findTodoIndex(id);
      todos.splice(todoIndex, 1);
    },
    update(id, properties) {
      if (validProperties(properties)) {
        const todo = this.find(id);

        if (properties.id && idIsNotUnique(properties.id)) {
          return 'Error: ID must be unique';
        } else if (properties.id && properties.id < 0) {
          return 'Error: ID must be greater than or equal to 0';
        } else {
          for (let key in properties) {
            todo[key] = properties[key];
          }
        }
      } else {
        return 'Error: Invalid property';
      }
    },
    find(id) {
      return todos.find(todo => todo.id === id);
    },
    listTodos() {
      return todos.map(copyTodo);
    },
  };
})();

const todoManager = {
  allTodos() {
    return todoList.listTodos();
  },
  allCompletedTodos() {
    return todoList.listTodos().filter(todo => todo.completed);
  },
  allTodosMonthYear(month, year) {
    return todoList.listTodos().filter(todo => {
      return todo.month === month && todo.year === year;
    });
  },
  allCompletedTodosMonthYear(month, year) {
    return todoList.listTodos().filter(todo => {
      return todo.completed &&
        todo.month === month &&
        todo.year === year;
    });
  },
};

let todoData1 = { title: 'Buy Milk', month: '1', year: '2017', description: 'Milk for baby' };
let todoData2 = { title: 'Buy Apples', month: '', year: '2017', description: 'An apple a day keeps the doctor away' };
let todoData3 = { title: 'Buy chocolate', month: '1', year: '', description: 'For the cheat day' };
let todoData4 = { title: 'Buy Veggies', month: '', year: '', description: 'For the daily fiber needs' };
let todoSet = [todoData1, todoData2, todoData3, todoData4];

// TESTING TODO CONSTRUCTOR FUNCTION
// TEST: create a new todo
let testTodo = new Todo({ title: 'Buy cereal', month: '1', year: '2022', description: 'Love Cheerios' });
console.log('Create a new todo: ', testTodo);
// { id: 1, title: 'Buy cereal', month: '1', year: '2022', description: 'Love Cheerios', completed: false }
console.log('testTodo object is an instance of Todo: ', testTodo instanceof Todo);
console.log('Todo.prototype is the prototype of testTodo: ', Object.getPrototypeOf(testTodo) === Todo.prototype);

// TEST: create a new todo without optional month and year
let testTodoNoMonthYear = new Todo({ title: 'Buy cereal', description: 'Love Cheerios' });
console.log('Create a new todo without optional month and year: ', testTodoNoMonthYear);
// { id: 2, title: 'Buy cereal', month: '', year: '', description: 'Love Cheerios', completed: false }

// TEST: create a new todo with year but no month
let testTodoYearNoMonth = new Todo({ title: 'Buy cereal', year: '2022', description: 'Love Cheerios' });
console.log('Create a new todo with year but no month: ', testTodoYearNoMonth);
// { id: 3, title: 'Buy cereal', month: '', year: '2022', description: 'Love Cheerios', completed: false }

// TEST: create a new todo with no description
let testTodoNoDescription = new Todo({ title: 'Buy cereal', month: '1', year: '2022' });
console.log('Create a new todo with no description: ', testTodoNoDescription);
// { id: 4, title: 'Buy cereal', month: '1', year: '2022', description: '', completed: false }

// TEST: create a new completed todo
let testCompletedTodo = new Todo({ title: 'Buy milk', month: '2', year: '2022', description: 'Moo', completed: true });
console.log('Create a new completed todo: ', testCompletedTodo);
// { id: 5, title: 'Buy milk', month: '2', year: '2022', description: 'Moo', completed: true }

// TEST: create an invalid todo (todo object is empty)
let invalidTodoEmptyObject = new Todo({});
console.log('Invalid todo (todo object is empty) returns object with invalid property set to true: ',
  invalidTodoEmptyObject.invalid === true);
// true

// TEST: create an invalid todo (title is empty)
let invalidTodoEmptyTitle = new Todo({ title: '   ', month: '4', year: '2022', description: '' });
console.log('Invalid todo (title is empty) returns object with invalid property set to true: ',
  invalidTodoEmptyTitle.invalid === true);
// true

// TEST: create an invalid todo (title is undefined)
let invalidTodoUndefinedTitle = new Todo({ month: '4', year: '2022', description: '' });
console.log('Invalid todo (title is undefined) returns object with invalid property set to true: ',
  invalidTodoUndefinedTitle.invalid === true);
// true

// TEST: create an invalid todo (month is defined, year is undefined)
let invalidTodoMonthNoYear = new Todo({ title: 'A test task', month: '1', description: 'A test task' });
console.log('Invalid todo (month is defined, year is undefined) returns object with invalid property set to true: ',
  invalidTodoMonthNoYear.invalid === true);

// TEST: todo isWithinMonthYear method is defined
console.log('Todo.prototype.isWithinMonthYear method is defined: ', typeof testTodo.isWithinMonthYear === 'function');
// true

// TEST: todo isWithinMonthYear returns true when todo is within specified month-year
console.log('Todo.prototype.isWithinMonthYear returns true when todo is within specified month-year: ',
  testTodo.isWithinMonthYear('1', '2022') === true);
// true

// TEST: todo isWithinMonthYear returns false when todo is not within specified month-year
console.log('Todo.prototype.isWithinMonthYear returns false when todo is not within specified month-year: ',
  testCompletedTodo.isWithinMonthYear('1', '2022') === false);
// true

// TESTING todoList OBJECT
// TEST: initialize method is defined
console.log('todoList.initialize method is defined: ', typeof todoList.initialize === 'function');

// TEST: initialize a new set of todos
todoList.initialize(todoSet);
console.log('Initial set of todos has been initialized (returns 3 out of 4 todos since todoData3 is invalid): ',
  todoList.listTodos());

// TEST: add method is defined
console.log('todoList.add method is defined: ', typeof todoList.add === 'function');

// TEST: add a todo
console.log('Add todos: ');
todoList.add({ title: 'Call Jane', month: '3', year: '2022', description: 'Update project' });
console.log(todoList.find(9));
todoList.add({ title: 'Send email', month: '1', year: '2022', description: 'Send email to Bob' });
console.log(todoList.find(10));
todoList.add({ title: 'Clean bedroom', month: '2', year: '2022', description: 'Clean the bedroom' });
console.log(todoList.find(11));
todoList.add({title: 'Clean kitchen', month: '2', year: '2022', description: 'Clean the kitchen' });
console.log(todoList.find(12));

// TEST: adding invalid todo returns error statement && does not get added to todos array
let todoInvalid = new Todo({});
console.log('Adding invalid todo returns error statement (\'Error: Invalid todo\'): ', todoList.add(todoInvalid) === 'Error: Invalid todo');
console.log('Adding invalid todo does not add invalid object ({ invalid: true }) to todos list: ', todoList.listTodos());

// TEST: delete method is defined
console.log('todoList.delete method is defined: ', typeof todoList.delete === 'function');

// TEST: delete a todo
todoList.delete(9);
console.log('Delete a todo (todo object with ID 9 has been removed): ', todoList.listTodos());

// TEST: todoList.listTodos method is defined
console.log('todoList.listTodos method is defined: ', typeof todoList.listTodos === 'function');

// TEST: returning list of todos returns a new Array, not the original Array
console.log('todoList.listTodos returns a copy of the todos list, not the original: ', todoList.listTodos()[0] !== todoList.listTodos()[0]); // true

// TEST: todoList.update method is defined
console.log('todoList.update method is defined: ', typeof todoList.update === 'function');

// TEST: update a todo single property
console.log('Update a todo single property: ');
console.log('Before: ', todoList.find(6));
todoList.update(6, { title: 'Buy whole milk' });
console.log('After: ', todoList.find(6));

// TEST: update a todo multiple properties
console.log('Update a todo multiple properties: ');
console.log('Before: ', todoList.find(8));
todoList.update(8, { title:  'Buy lots of veggies', month: '1', year: '2022', completed: true });
console.log('After: ', todoList.find(8));

// TEST: update ID to number already in use returns error message
console.log('Update ID to number already in use returns error message (\'Error: ID must be unique\'): ',
  todoList.update(8, { id: 6 }) === 'Error: ID must be unique');
console.log('ID for todo object with ID 8 has not changed: ', todoList.find(8));

// TEST: update ID to a negative number returns error message
console.log('Update ID to negative number returns error message (\'Error: ID must be greater than or equal to 0\'): ',
  todoList.update(8, { id: -1 }) === 'Error: ID must be greater than or equal to 0');
console.log('ID for todo object with ID 8 has not changed: ', todoList.find(8));

// TEST: update ID to number not already in use changes ID value
todoList.update(8, { id: 100 });
console.log('Update ID to number not already in use changes ID value (from ID 8 to ID 100): ', todoList.find(100));

// TEST: update with invalid property
console.log('Update with invalid property returns error message (\'Error: Invalid property\'): ',
  todoList.update(100, { newProperty: 'hey' }) === 'Error: Invalid property');

// TEST: update with invalid property does not update todo object
console.log('Update with invalid property does not update todo object: ', todoList.find(100));

// TEST: todoManager OBJECT
// TEST: allTodos method is defined
console.log('allTodos method is defined: ', typeof todoManager.allTodos === 'function');

// TEST: return all todos
console.log('Return all todos: ', todoManager.allTodos());

// TEST: return all completed todos
console.log('Return all completed todos: ', todoManager.allCompletedTodos());

// TEST: return all todo objects within a given month-year combination
console.log('Return todo objects with month-year combination: ',
  todoManager.allTodosMonthYear('2', '2022'));

// TEST: return empty array when no todos match month-year combination
console.log('Return empty array when no todos match month-year combination: ',
  todoManager.allTodosMonthYear('12', '2023').length === 0);

// TEST: return all completed todo objects within a given month-year combination
console.log('Return completed todo objects with month-year combination: ',
  todoManager.allCompletedTodosMonthYear('1', '2022'));

// TEST: return empty array when no completed todos match month-year combination
console.log('Return empty array when no completed todos match month-year combination: ',
  todoManager.allCompletedTodosMonthYear('12', '2023').length === 0);
