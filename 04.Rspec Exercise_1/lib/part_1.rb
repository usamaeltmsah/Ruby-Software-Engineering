def average(num1, num2)
    return (num1+num2) / 2.0
end

def average_array(arr)
    sum = 0.0
    arr.each { |el| sum += el}
    sum / arr.length
end

def repeat(str, num)
    new_str = ""
    num.times { || new_str+=str}
    new_str
end

def yell(str)
    str.upcase!
    str + "!"
end

def alternating_case(str)
    words = str.split
    new_words = []
    (0...words.length).each do |i|
        if i % 2 == 0
            new_words << words[i].upcase
        else
            new_words << words[i].downcase
        end
    end
    new_words.join(" ")
end