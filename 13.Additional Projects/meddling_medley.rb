### Phase 1: Modest problems.

def duos(str)
    c = 0
    len = str.length
    (1...len).each { |i| c += 1 if str[i] == str[i-1] }
    return c
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0