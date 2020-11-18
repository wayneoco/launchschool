=begin
Whereas `File::path` is a Class method and returns the string representation of the file path, 
  `File#path` is an instance method and returns the string representation of the path when the file
  was created, which means that it's possible that `File#path` may not link
  to the actual file.
=end
