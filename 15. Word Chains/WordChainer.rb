require 'set'

class WordChainer
    attr_reader :dictionary
    def initialize(dictionary_file_name="dictionary.txt")
        @dictionary = read_file_to_arr(dictionary_file_name)
    end

    def read_file_to_arr(file)
        Set.new(File.read(file).split)
    end

    def adjacent_words(word)
        adj_words = []

        word.each_char.with_index do |ch, i|
            ('a'..'z').each do |new_ch|
                next if ch == new_ch

                new_word = word.dup
                new_word[i] = new_ch

                adj_words << new_word if dictionary.include?(new_word)
            end
        end
        adj_words
    end
end