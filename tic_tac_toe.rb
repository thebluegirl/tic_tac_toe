class Player
  @@num_of_players = 0
  @@player_symbols = ["X", "O"]

  attr_reader :symbol
  attr_accessor :name

  def initialize(name)
    @name = name
    @symbol = player_symbol
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
    "Player identifier: #{@name}, Player symbol: #{symbol}"
  end
end

player1 = Player.new("Player 1")
puts player1

player2 = Player.new("Player 2")
puts player2
