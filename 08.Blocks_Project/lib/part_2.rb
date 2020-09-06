def all_words_capitalized?(words)
    words.all? { |w| w == w.capitalize}
end

def no_valid_url?(urls)
    doms = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        doms.any? { |dom| url.end_with?(dom)}
    end
end

def any_passing_students?(students)
    students.any? do |stud| 
        avg_grade = (stud[:grades].sum / stud[:grades].size)
        avg_grade >= 75
    end
end