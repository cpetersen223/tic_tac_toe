require 'tic_tac_toe/version'
require 'tic_tac_toe/match'
require 'helpers/string'

module TicTacToe
  class Error < StandardError; end

  class App

    class << self
      def run
        Match.new
      end
    end
  end

  App.run
end
