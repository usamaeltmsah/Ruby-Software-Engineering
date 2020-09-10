class Code

  attr_reader :pegs

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

  def self.random(len)
    rand_pegs = []
    pegs = POSSIBLE_PEGS.keys
    len.times { || rand_pegs << pegs[rand(0..3)]}
    Code.new(rand_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end
end
