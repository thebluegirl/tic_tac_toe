require './lib/tic_tac_toe.rb'


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
