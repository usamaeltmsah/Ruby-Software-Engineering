require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = 0.5 * @board.size
    end

    def start_game
        self.board.place_random_ships
        puts "There are #{self.board.num_ships}hidden ships on the board."
        self.board.print
    end

    def lose?
        return false if @remaining_misses > 0
        puts 'you lose'
        return true
    end

    def win?
        return false if self.board.num_ships > 0
        print 'you win'
        return true
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        move = self.player.get_move
        @remaining_misses -= 1 if !self.board.attack(move)
        self.board.print
        puts "#{@remaining_misses} remaining misses"
    end
end
