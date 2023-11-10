require './lib/tic_tac_toe.rb'

describe Player do
  describe '#player_symbol' do
    context 'test players symbols' do
      let(:player1) { described_class.new('player 1') }
      let(:player2) { described_class.new('player 2') }

      it 'player 1 uses X' do
        player1_symbol = player1.instance_variable_get(:@symbol)
        expect(player1_symbol).to eql('X')
      end

      it 'player 2 uses O' do
        player2_symbol = player2.instance_variable_get(:@symbol)
        expect(player2_symbol).to eql('O')
      end
    end
  end
end

describe Game do
  describe '#win_check' do
    subject(:game) { described_class.new }

    context 'test win condition for top row' do
      before do
        board = game.instance_variable_get(:@board)
        board[0] = board[1] = board[2] = "X"
      end

      it 'has a winner' do
        game.win_check
        winner_present = game.instance_variable_get(:@winner_present)
        expect(winner_present).to be true
      end
    end
  end
end
