def factors(number)
  dividend = number
  divisors = []
  while divisor > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end