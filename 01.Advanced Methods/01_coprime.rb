# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    i = [num_1, num_2].min

    while i > 1
        return false if num_1 % i == 0 && num_2 % i == 0
        i -= 1
    end
    return true
end

def coprime2?(num_1, num_2)
    (2..num_1).none? { |div| num_1 % div == 0 && num_2 % div == 0}
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
puts "----"
p coprime2?(25, 13)    # => true
p coprime2?(8, 9)     # => true
p coprime2?(30, 9)     # => false
p coprime2?(6, 24)     # => false