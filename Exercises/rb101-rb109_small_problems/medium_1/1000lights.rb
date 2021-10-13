# frozen_string_literal: true

=begin

# PROBLEM
input: positive integer
output: array of integers

explicit rules:
  - input represents total number of switches
  - input also represents total number of rounds of play
  - each switch controls exactly one light
  - initial state of lights: off
  - first round: all lights are turned on
  - in each successive round switches are toggled according to the following rules:
    - start at switch 2, then move to each multiple of 2 up to the total number of switches
    - then start at 3, then move to each multiple of 3 up to the total number of switches


# EXAMPLES
 puts switches(5) == [1, 4]
  - round 1: all lights on
  - round 2: lights 2 and 4 are off; 1, 3, 5 are on
  - round 3: lights 2, 3, and 4 are off; 1 and 5 are on
  - round 4: lights 2 and 3 are off; 1, 4 and 5 are on
  - round 5: lights 2, 3, and 5 are off; 1 and 4 are on
 puts switches(10) == [1, 4, 9]
  - round 1: all lights turned on
    - { 1: on, 2: on, 3: on, 4: on, 5: on, 6: on, 7: on, 8: on, 9: on, 10: on }
  - round 2: 2, 4, 6, 8, 10 turned off
    - { 1: on, 2: off, 3: on, 4: off, 5: on, 6: off, 7: on, 8: off, 9: on, 10: off }
  - round 3: 3, 6, 9 turned off
    - { 1: on, 2: off, 3: off, 4: off, 5: on, 6: off, 7: on, 8: off, 9: off, 10: off }
  -round 4: 4, 8 turned off
    -
 puts switches(20) ==

=end

require 'pry'

def initialize_switches(total_lights)
  switches = {}
  1.upto(total_lights) { |num| switches[num] = false }
  switches
end

def find_and_switch_lights(total_lights, switches)
  1.upto(total_lights) do |num|
    switches.each do |position, status|
      switches[position] = !status if (position % num).zero?
    end
  end
end

def collect_on_lights(switches)
  switches.each_with_object([]) do |(key, value), array|
    array << key if value
  end
end

def switch_lights(total_lights)
  switches = initialize_switches(total_lights)
  find_and_switch_lights(total_lights, switches)
  collect_on_lights(switches)
end

p switch_lights(5)  #== [1, 4]
p switch_lights(10) #== [1, 4, 9]
p switch_lights(20)
p switch_lights(1000)
p switch_lights(2000)
