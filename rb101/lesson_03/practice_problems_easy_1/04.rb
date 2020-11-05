`numbers.delete_at(1)` deletes the element at index [1]
`numbers.delete(1)` deletes the element whose value is `1`

*Special Note: While `delete` for the Array class operates on the Array itself and modifies it in place,
  `delete` for the String class returns a new String unless `!` is appended to `delete`. In other words,
  `!` is not needed when used on Array class objects.
