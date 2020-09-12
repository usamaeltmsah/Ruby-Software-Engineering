def proper_factors(num)
    factors = []
    (1...num).each { |i| factors << i if num % i == 0 }
    factors
end

def aliquot_sum(num)
    proper_factors = proper_factors(num)
    proper_factors.sum
end