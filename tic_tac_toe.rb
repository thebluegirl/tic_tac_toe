module WinningLines
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
end

class Player
  @@num_of_players = 0

  attr_accessor :name, :symbol ,:player_array

  def initialize(name)
    @name = name
    @symbol = self.player_symbol
    @player_array  = [@name, @symbol]
    @@num_of_players += 1  
  end

  protected 
  def player_symbol
    if @@num_of_players.even?
      @symbol = "X"
    else
      @symbol = "O"
    end
  end

  public
  def to_s
    puts "Player identifier: #{@name}, Player symbol: #{@symbol}"
  end
end

class Game
  include WinningLines

  attr_reader :players_hash
  attr_accessor :board, :free_spaces, :winner_present, :move_counter

  def initialize
    @board = Array.new(9)
    @free_spaces = (1..9).to_a
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players_hash = [@player1.player_array, @player2.player_array].to_h
    @move_counter = 0
    @winner_present = false
  end
  
  protected
  def print_board
    @board.each_with_index do |value, idx|
      if idx == 3 || idx == 6
        print "\n"
      end

      if value.class == String
        print "|#{value}|"
      else
        print "|#{idx + 1}|"
      end
    end
    print "\n"
  end

  def win_check
      WinningLines::WINNING_LINES.each do |array|
      if @board[array[0] - 1] == @board[array[1] - 1] && @board[array[1] - 1] == @board[array[2] - 1] && @board[array[0] - 1].class == String
        puts "WE HAVE OUR WINNER!!!"
        @winner_present = true
      end
    end
  end

  def game_end
    if @free_spaces.empty?
      puts "It's a tie."
    end

    if @free_spaces.empty? || @winner_present == true
      puts "This game has ended. Would you like to play another?"
      new_game_request = gets.chomp.downcase

      if new_game_request == "yes" || new_game_request == "y"
        Game.new.gameplay
      elsif new_game_request == "no" || new_game_request == "n"
        puts "Thank you for playing. Goodbye"
        exit
      else
        puts "I'm sorry, I do not understand. Please answer 'yes' or 'no'."
        self.game_end
      end
    end
  end

  def player_move
    puts "Where would you like to play?"
    play_slot = gets.to_i

    if play_slot > 9 || play_slot < 1
      puts "This move is out of bounds. Please choose a valid slot."
      self.player_move
      return 
    end

    if !@free_spaces.include?(play_slot)
      puts "This move has already been played. Please choose an available slot"
      self.player_move
      return
    end
    
    if @move_counter.even?
      @board[play_slot - 1] = players_hash.fetch("Player 1")
      @move_counter += 1
    else
      @board[play_slot - 1] = players_hash.fetch("Player 2")
      @move_counter += 1
    end

    @free_spaces.delete(play_slot)
    self.print_board
    self.win_check
  end

  public
  def gameplay
    until (@winner_present.class == TrueClass || @free_spaces.empty?) do
      @players_hash.to_a.cycle do |player_info|
        puts "#{player_info[0]}..."
        self.player_move
        self.game_end
      end
    end
  end
  
end

game = Game.new
game.gameplay
