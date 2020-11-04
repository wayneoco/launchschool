=begin

When appended to a method, `!` indicates a method is destructive (also called a bang method).
A destructive method is one that mutates the caller (i.e., modifies the object
  the caller is pointing to). Usually bang methods have a non-destructive counterpart
  as well, where the method creates a new string or new array, etc, rather than modify
  the original object.

When used as a prefix, `!` is used as an operator that returns a negative boolean value.

By contrast, a `?` has no functional power in Ruby. It is merely a convetion that,
  when appended to a method definition, indicates that the expected return value
  of the method is a boolean value.

1. `!=` means `not equal to` and should be used in conditional expressions
2. `!`, when used as a prefix to something like `user_name` means `not`