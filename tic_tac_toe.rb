# module WinningLines
#   winning_lines = Array.new([1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7])
# end

class Player
  @@num_of_players = 0
  @@player_symbols = ["X", "O"]

  attr_reader :symbol
  attr_accessor :name

  def initialize(name)
    if @@num_of_players <= 2
      @name = name
      @symbol = player_symbol
      @@num_of_players += 1  
    else
      return puts "Maximum players attained. Something isn't right here..."
    end
    
  end

  protected 
  def player_symbol
    if @@num_of_players < 1
      @@player_symbols.shift
    else
      @@player_symbols.pop
    end
  end

  public
  def to_s
    "Player identifier: #{@name}, Player symbol: #{symbol}"
  end
end

class Game
  def initialize
    @board = Array.new(9)
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end
  
  def print_board
    @board.each_index do |idx|
      if idx == 3 || idx == 6
        print "\n"
      end
      print "|__|"
    end
    print "\n"
  end

end

game = Game.new
game.print_board
