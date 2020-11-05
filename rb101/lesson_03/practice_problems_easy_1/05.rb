(10..100).include?(42)  # => true
(10..100).cover?(42)    # => true . NOTE: when using a numeric range, `#cover?` and `#include?` give the same result.
(10..100) === 42        # => true