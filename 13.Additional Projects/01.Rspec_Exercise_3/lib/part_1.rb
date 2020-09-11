def is_prime?(num)
    return false if num < 2
    (2...num).each.all? { |i| num % i != 0  }
end