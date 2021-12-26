def step(first, last, step)
  current_number = first
  loop do
    yield(current_number)
    break if current_number == last

    current_number += step
  end
  current_number
end

step(1, 10, 3) { |value| puts "value = #{value}" }
