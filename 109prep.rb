def common_prefix(strings)
  result = []
  prefix_max_length = strings.min_by(&:size).size
  (0...prefix_max_length).each do |index|
    current_char = strings[0][index]
    if strings.all? { |str| str[index] == current_char }
      result << current_char
    else
      return result.join('')
    end
  end
  result.join('')
end

p common_prefix(['flower', 'flow', 'flight']) #== 'fl'
p common_prefix(['dog', 'racecar', 'car']) #== ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) #== 'inters'
p common_prefix(['throne', 'dungeon']) #== ''
p common_prefix(['throne', 'throne']) #== 'throne'
