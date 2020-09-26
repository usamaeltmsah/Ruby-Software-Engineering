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

    def run(source, target)
        @current_words = Set.new [source]
        @all_seen_words = { source => nil }
        
        until @current_words.empty? || @all_seen_words.include?(target)
            explore_curent_words
        end
        @current_words.include?(target)
    end
    
    def explore_curent_words
        new_current_words = []
        @current_words.each do |word|
            adj_words = adjacent_words(word)
            adj_words.each do |adj_word|
                new_current_words << adj_word if !@all_seen_words.keys.include?(adj_word)
                @all_seen_words[adj_word] = word
            end
        end
        @current_words = new_current_words
        p @all_seen_words
    end
end

  p WordChainer.new.run("market", "winner")