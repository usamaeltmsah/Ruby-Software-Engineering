def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dog_hashes)
    dog_hashes.reject { |hash| hash["age"] <= 2}
end