=begin

When appended to a method, `!` indicates a method is destructive (also called a bang method).
A destructive method is one that mutates the caller (i.e., modifies the object
  the caller is pointing to). Usually bang methods have a non-destructive counterpart
  as well, where the method creates a new string or new array, etc, rather than modify
  the original object.

When used as a prefix, `!` is used as an operator that returns a negative boolean value.

By contrast, a `?` has no functional power in Ruby. It is merely a convetion that,
  when appended to a method definition, indicates that the expected return value
  of the method is a boolean value. To demonstrate that the `?` has no functional power, a method
  functions exactly the same without the question mark.

1. `!=` means `not equal to` and should be used in conditional expressions
2. `!`, when used as a prefix to something like `user_name` means `not` and turns the object into the opposite
    of its boolean value.
3. `!`, when appended to something like `words.uniq!`, indicates that the method is destructive (i.e.,
  it mutates the caller or modifies the original object.)
4. A `?`, when used before something, indicates a ternary operator if preceded by a conditional and the
  expression it precedes is follwed by a colon, which is then followed by another expression. The expression
  that follows the `?` would be the first of two possible outcomes in a conditional statement.
5. If `?` is directly appended to a method, that indicates that the method expects a boolean return value.
  If `?` follows a conditional, and is in turn followed by an expression that is follwed by a colon plus another
  expression, that indicates a conditional using a ternary operator.
6. `!!` used before something like `!!username` indicates a double negative and turns the object into
  its boolean equivalent (e.g., `!!<some_object>` would haver a return value of true).