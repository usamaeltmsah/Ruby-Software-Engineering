def proper_factors(num)
    factors = []
    (1...num).each { |i| factors << i if num % i == 0 }
    factors
end

def aliquot_sum(num)
    proper_factors = proper_factors(num)
    proper_factors.sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    return false
end

def ideal_numbers(n)
    i = 1
    j = 6        # First ideal
    perfect_numbers = []
    while i <= n
        while !perfect_number?(j)
            j += 1
        end
        i += 1
        perfect_numbers << j
        j += 1
    end
    perfect_numbers
end