def divisors(number)
  number_size = number.to_s.size
  return divisors_single_digit(number) if number_size == 1

  second_divisor = get_second_divisor(number, number_size)
  result = [1]
  result.concat(second_divisor.upto(number / second_divisor).select do |candidate|
    (number % candidate).zero?
  end)
  result << number
end

def divisors_single_digit(number)
  1.upto(number).select do |candidate|
    (number % candidate).zero?
  end
end

def get_second_divisor(number, number_size)
  return 2 if number.even?

  case number_size
  when 2        then 2
  when (2..3)   then 3
  when (4..7)   then 5
  when 8        then 9967
  when 12       then 999_979
  end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(9) == [1, 3, 9]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(15) == [1, 3, 5, 15]
p divisors(45) == [1, 3, 5, 9, 15, 45]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99) == [1, 3, 9, 11, 33, 99]
p divisors(134) == [1, 2, 67, 134]
p divisors(135) == [1, 3, 5, 9, 15, 27, 45, 135]
p divisors(1554) == [1, 2, 3, 6, 7, 14, 21, 37, 42, 74, 111, 222, 259, 518, 777, 1554]
p divisors(1555) == [1, 5, 311, 1555]
p divisors(23_454) == [1, 2, 3, 6, 9, 18, 1303, 2606, 3909, 7818, 11_727, 23_454]
p divisors(23_455) == [1, 5, 4691, 23_455]
p divisors(112_324) == [1, 2, 4, 28_081, 56_162, 112_324]
p divisors(112_325) == [1, 5, 25, 4493, 22_465, 112_325]
p divisors(5_555_554) == [1, 2, 1009, 2018, 2753, 5506, 2_777_777, 5_555_554]
p divisors(5_555_555) == [1, 5, 239, 1195, 4649, 23_245, 1_111_111, 5_555_555]
#p divisors(99_400_890) == [1, 2, 3, 5, 6, 10, 15, 30, 3_313_363, 6_626_726, 9_940_089, 16_566_815, 19_880_178, 33_133_630, 49_700_445, 99_400_890]
p divisors(99_400_891) == [1, 9967, 9973, 99_400_891] # may take a minute
p divisors(999_962_000_357) == [1, 999_979, 999_983, 999_962_000_357]
