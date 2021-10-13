# frozen_string_literal: false

=begin

# Problem
- a bank of switches numbered 1 to `n`
- each switch is connected to 1 light
- initial state of each light is `off`
- to start, you turn every switch to an `on` position
- next pass, switches at even positions are toggled, starting from the beginning
- next pass, switches at odd positions are toggled, starting from the beginning
- process repeats until you have reached `n` repetitions.

- input: integer (total number of switches)
- output: array (lights in `on` position after `n` repetitions)

# Data Structure
- array (switches)
- array (output)

# Algorithm
- High Level
  - Given an array of positive integers, where each number represents a single light
  - Switch all lights to off position
  - Toggle lights according to following pattern:
    - Start at light in second position
    - Pattern = light position is a factor of the starting position
    - Move to light in next position and toggle lights using same pattern
    - End when last light is starting position
  - Return array of lights in on position

- initialize an array of objects with value 'off'. Size of array is `n`.
- initialize variable `state` with value `even`.
- iterate over array with index:
  - if `state` is `even`:
    - change value to `on` if the element's index is odd
  - if `state` is `odd`:
    - change value to `off` if the element's index is even
- iterate over array (select):
  - element = `on`

=end

def diamond_top(num)
  1.step(by: 2, to: num) do |i|
    puts "#{('*' * i).center(num)}"
  end
end

def diamond_bottom(num)
  (num - 2).step(by: -2, to: 1) do |i|
    puts "#{('*' * i).center(num)}"
  end
end

def diamond(num)
  diamond_top(num)
  diamond_bottom(num)
end

p diamond(1)
p diamond(3)
p diamond(9)
