# frozen_string_literal: true

def staggered_case(string)
  need_upper = false
  string.chars.map do |char|
    need_upper = !need_upper if (/[a-zA-Z]/).match?(char)
    need_upper ? char.upcase : char.downcase
  end.join
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

def staggered_case_alt1(string, count_all = :no)
  need_upper = false
  string.chars.map do |char|
    need_upper = !need_upper if (/[a-zA-Z]/).match?(char) || count_all == :yes
    need_upper ? char.upcase : char.downcase
  end.join
end

puts staggered_case_alt1('I Love Launch School!', :yes) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case_alt1('ALL CAPS') == 'AlL cApS'
puts staggered_case_alt1('ignore 77 the 444 numbers', :yes) == 'IgNoRe 77 ThE 444 NuMbErS'
