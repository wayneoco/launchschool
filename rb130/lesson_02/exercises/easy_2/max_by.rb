def max_by(array)
  return nil if array.empty?

  current_max_element = array[0]
  current_max_value = yield(current_max_element)

  array[1..].each do |el|
    current_value = yield(el)
    if current_value > current_max_value
      current_max_value = current_value
      current_max_element = el
    end
  end
  current_max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
