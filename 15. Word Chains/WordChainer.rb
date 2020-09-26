require 'set'

class WordChainer
    attr_reader :dictionary
    def initialize(dictionary_file_name="dictionary.txt")
        @dictionary = read_file_to_arr(dictionary_file_name)
    end

    def read_file_to_arr(file)
        Set.new(File.read(file).split)
    end
end