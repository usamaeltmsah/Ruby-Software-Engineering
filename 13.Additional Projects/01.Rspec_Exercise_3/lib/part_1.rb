def is_prime?(num)
    return false if num < 2
    (2...num).each.all? { |i| num % i != 0  }
end

def nth_prime(n)
    i = 1
    j = 2
    while i <= n
        while !is_prime?(j)
            j += 1
        end
        i += 1
        prime = j
        j += 1
    end
    prime
end