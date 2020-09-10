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
end
