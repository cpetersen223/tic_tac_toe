require 'tic_tac_toe/app'

module Game
  class Play < ::TicTacToe::App
    attr_accessor :coordinate, :player

    def initialize(board, player)
      @board = board
      @player = player
      get_play
    end

    private

    def get_play
      ask_player_for_play
      self.coordinate = get_input
      if invalid_input || bad_play
        wrong_play; get_play
      end
    end

    def valid_input?
      self.coordinate.to_i > 0
    end

    def invalid_input; !valid_input?; end

    def well_play?
      coordinate = self.coordinate.to_i - 1
      @board.validate coordinate
    end

    def bad_play; !well_play?; end
  end
end