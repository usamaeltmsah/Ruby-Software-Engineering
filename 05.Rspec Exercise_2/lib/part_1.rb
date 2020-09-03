def partition(arr, n)
    md_arr, less_arr, greateq_arr = [], [], []

    arr.each do |el|
        if el < n
            less_arr << el
        else
            greateq_arr << el
        end
    end
    md_arr.push(less_arr, greateq_arr)
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |k, v| new_hash[k] = v}
    hash2.each { |k, v| new_hash[k] = v}
    new_hash
end

def censor(sent, arr)
    vowels = "aeiou"
    words = sent.split
    (0...words.length).each do |i|
        k = arr.index(words[i].downcase)
        if k != nil
            (0...words[k].length).each { |j| words[i][j] = '*' if vowels.include?(words[i][j].downcase)}
        end
    end
    words.join(" ")
  end

  def power_of_two?(n)
    i = 0
    while i < n
        return true if 2 ** i == n
        i += 1
    end
    return false
  end