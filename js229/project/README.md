# Application Specifications
- Build a todo app
- Todo app has a `todoManager`:
  - Responsibilities:
    - return a set of todos from a `todoList` based on certain criteria
- `todoList`
  - an object thta has a collection of `todo` objects
- `Todo`
  - creates `todo` objects
- `todo` objects:
  - have unique `id`s

## Todo
- `todo`s have unique `id`s.
- `todo`s have ONLY the following properties and shared methods:
  - PROPERTIES
    - id (unique)
    - title
    - completed
    - month
    - year
    - description
  - SHARED METHODS
    - isWithinMonthYear(month, year)

## todoList
- contains a collection of `todo` objects
- provides an interface for manipulating the collection of objects:
  - adding
  - updating
  - deleting
  - etc.
- maintains the integrity of the collection by returning only a copy of the collection anytime that a method returns all or a subset of it
- does not allow users or other objects to manipulate the values of `todo` objects directly.

- METHODS:
  - maintains a collection of `todo` objects
  - adds a `todo` object to the collection
  - deletes a `todo` object from the collection
  - initializes the collection with `todo` objects
  - updates existing properties of a specific `todo` object
  - returns a specified `todo` object based on its `id` property

## todoManager
- interfaces with the `todoList` object.
- has methods that query the `todoList` to return all or a subset of the `todo` objects as an array of `todo` objects
- can query the `todoList` in the following ways:
  - return all `todo` objects
  - return all completed `todo` objects
  - return all `todo` objects within a given month-year combination
  - return all completed `todo` objects within a given month-year combination
