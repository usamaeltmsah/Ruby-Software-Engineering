def palindrome?(str)
    rev_str = ""
    i = str.length - 1
    while i >= 0
        rev_str += str[i]
        i -= 1
    end
    return rev_str == str
  end
  