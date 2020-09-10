class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars_arr)
    pegs_chars = POSSIBLE_PEGS.keys
    chars_arr.all? { |ch| pegs_chars.include?(ch.upcase) }
  end

  def initialize(char_arr)
    raise "Not valid pegs!" if !Code.valid_pegs?(char_arr)
    @pegs = char_arr.map(&:upcase)
  end
end
