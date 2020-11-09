def factors(number)
    return if number <= 0
    divisor = number
    factors = []
    while divisor > 0 do
        factors << number / divisor if number % divisor == 0
        divisor -= 1
    end
    factors
end

