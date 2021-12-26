undefined. # Lecture: Minitest

# Vocabulary

- **Test Suite:** the entire set of tests that accompanies your program or application. You can think of this as *all the tests* for a project.
- **Test:** a situation or context in which tests are run. For example, this test is about making sure you get an error message after trying to log in with the wrong password. A test can contain multiple assertions.
- **Assertion:** the actual verification step to confirm that the data returned by your program or application is indeed what is expected. You make one or more assertions within a test.

## Writing a First Test

Sample code:

```ruby
class Car
  attr_accessor :wheels

  def initialize
    @wheels = 4
  end
end
```

Test code:

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end
```

Breaking down the test code:

- `line 1` - `require ‘minitest/autorun` loads all necessary files from the `minitest` gem.
- `line 3` - `require_relative 'car’` requires the file to be tested, in this case `car.rb`, which contains the `Car` class.
- `line 5` - the test class `CarTest` is created. Note that this must subclass from `MiniTest::Test` . This will allow our test class to inherit all the necessary methods for writing tests.
- Within the test class we can then write tests by creating instance methods that start with `test_` . Through this naming convention, Minitest will know that these methods are individual tests that need to be run.
- Within each test — i.e., each instance method that starts with `test_` — we will need to make some *assertions*.
- **Assertions** are the output we are trying to verify. However, before making any assertions, we have to first set up the appropriate data or objects to make assertions against. This is what we do in `line 7` where a local variable `car` is initialized to an object of the `Car` class. The newly instantiated `car` object will then be used to verify that new `Car` objects indeed have 4 wheels.
- `assert_equal` , which is a method inherited from the `Minitest::Assert` module, takes two parameters: (1) the expected value, and (2) the test or actual value. If there's a discrepancy between the values, `assert_equal` will save the error and Minitest will report that error at the end of the test run.

## Reading Test Output

- A successful test produces output that looks like the following:

```plaintext
Run options: --seed 62238

# Running:

CarTest .

Finished in 0.001097s, 911.3428 runs/s, 911.3428 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

- The above represents the default output.
- The first ‘seed’ tells Minitest what order the tests were run in. In this example there is only 1 seed because we ran only 1 test.
- Most test suites have many tests that are run in random order.
- The ‘seed’ is how you tell Minitest to run the entire test suite in a particular order. However, this is rarely used, though it can be helpful if you have an especially tricky bug that only comes up when certain specific situations come up.
- The `.` after `CarTest` means that the test was run and nothing went wrong. If you skip a test using the `skip` keyword, it will say `S` . If you have a failure, it will say `F` .

## Expectation Syntax

- So far we've been using *assertion* or *assert-style* syntax. Minitest also has a completely different syntax called *expectation* or *spec-style* syntax.
- The following applies to expectation style syntax:
   - Tests are grouped into `describe` blocks.
   - Individual tests are written with the `it` method.
   - Instead of assertions we use *expectation matchers*.

```ruby
require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    _(car.wheels).must_equal 4
  end
end
```

- Even though the syntax is different, the above test (written with expectation syntax) produces the same output as if the test had been written in assertion syntax.
- Therefore, whether or not to use assertion or expectation style syntax is simply a stylistic preference.
- However, assertion syntax is much more intuitive for beginners. Expectation syntax was written to appease RSpec users.

