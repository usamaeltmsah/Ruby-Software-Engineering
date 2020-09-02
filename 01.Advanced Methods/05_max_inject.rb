# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

def max_inject(*arr)
    [*arr].max
end

def max_inject2(*arr)
    arr.inject do |max, el|
        if el > max
            el
        else
            max
        end
    end
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30
puts "----"
p max_inject(1, -4, 0, 7, 100)  # => 100
p max_inject(30, 50, 18)      # => 50
