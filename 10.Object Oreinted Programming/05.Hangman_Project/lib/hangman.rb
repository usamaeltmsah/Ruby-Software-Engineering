class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  
  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index { |c, i| arr << i if c == char }
    arr
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess_word[i] = char}
  end

  def try_guess(char)
    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    end
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    else
      indices = get_matching_indices(char)
      fill_indices(char, indices)
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    ch = gets.chomp
    return try_guess(ch)
  end

  def win?
    if @guess_word.join == @secret_word
      puts 'WIN'
      return true
      else
        return false
    end
  end
end
