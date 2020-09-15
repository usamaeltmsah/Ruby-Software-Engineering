### Phase 1: Problems that are pleasant.

def some?(arr, &prc)
    arr.any? { |el| prc.call(el) }
end

p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
p some?([8, 2]) { |n| n.even? }                                       # true
p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true

# ----------------------------------------------------------------------------

def exactly?(arr, n, &prc)
    c = 0
    arr.each { |el| c += 1 if prc.call(el) }
    return c == n
end

p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
p exactly?([4, 5], 3) { |n| n > 0 }                             # false
p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true

# ----------------------------------------------------------------------------

def filter_out(arr, &prc)
    filtered = []
    arr.each { |el| filtered << el if !prc.call(el) }
    filtered
end

p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]

# ----------------------------------------------------------------------------

def at_least?(arr, min, &prc)
    c = 0
    arr.each { |el| c += 1 if prc.call(el) }
    return true if c >= min
    return false
end

p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') } # false
p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') } # false
p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') } # true
p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') } # true
p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') } # true
p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') } # false
p at_least?([false, false, false], 3) { |bool| bool } # false
p at_least?([false, true, true], 3) { |bool| bool } # false
p at_least?([true, true, true], 3) { |bool| bool } # true
p at_least?([true, true, true, true], 3) { |bool| bool } # true