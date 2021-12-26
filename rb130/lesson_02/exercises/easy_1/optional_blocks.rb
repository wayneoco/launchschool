def compute
  return yield if block_given?

  'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute_alt1(input)
  return 'Does not compute.' unless block_given?

  yield(input)
end

p compute_alt1(2) { |input| input + 1 } == 3
p compute_alt1('a') { |input| input + 'b' } == 'ab'
p compute_alt1(3) == 'Does not compute.'
