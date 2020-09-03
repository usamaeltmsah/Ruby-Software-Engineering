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