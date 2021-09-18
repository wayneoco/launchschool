# frozen_string_literal: true

def staggered_case(string)
  new_str = []
  string.chars.each_index do |index|
    index.even? ? new_str << string[index].upcase : new_str << string[index].downcase
  end
  new_str.join
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case_alt1(string, alt = :odd)
  new_str = []
  case alt
  when :odd
    string.chars.each_index do |index|
      index.odd? ? new_str << string[index].upcase : new_str << string[index].downcase
    end
  else
    string.chars.each_index do |index|
      index.even? ? new_str << string[index].upcase : new_str << string[index].downcase
    end
  end
  new_str.join
end

puts staggered_case_alt1('I Love Launch School!', :even) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case_alt1('ALL_CAPS', :even) == 'AlL_CaPs'
puts staggered_case_alt1('ignore 77 the 444 numbers', :even) == 'IgNoRe 77 ThE 444 NuMbErS'
