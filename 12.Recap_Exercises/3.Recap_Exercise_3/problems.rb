def no_dupes?(arr)
    count = Hash.new(0)
    arr.each { |el| count[el] += 1 }
    no_dupes_arr = []
    count.each { |k, v| no_dupes_arr << k if v == 1}
    no_dupes_arr
end

# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

# ---------------------------------------------------------------------------
