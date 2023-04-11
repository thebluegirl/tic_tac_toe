module WinningLines
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
end

class Player
  @@num_of_players = 0
  @@player_symbols = ["X", "O"]

  attr_reader :symbol
  attr_accessor :name, :player_array

  def initialize(name)
    @name = name
    @symbol = player_symbol
    @player_array  = [@name, @symbol]
    @@num_of_players += 1  
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
    puts "Player identifier: #{@name}, Player symbol: #{@symbol}"
  end
end

class Game
  attr_reader 
  attr_accessor :players_hash, :free_spaces

  def initialize
    @board = Array.new(9)
    @free_spaces = (1..9).to_a
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players_hash = [@player1.player_array, @player2.player_array].to_h
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

  def player_move
    puts "Where would you like to play?"
    play_slot = gets.to_i

    if play_slot > 9 || play_slot < 1
      puts "This move is out of bounds. Please choose a valid slot."
      self.player_move 
    end
  end
end

game = Game.new
p game.players_hash
game.player_move