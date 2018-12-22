require 'tic_tac_toe/version'
require 'tic_tac_toe/player'
require 'tic_tac_toe/modules/texts'
require 'tic_tac_toe/modules/string'
autoload :Board, 'tic_tac_toe/board'
autoload :Config, 'tic_tac_toe/modules/config'
autoload :Game, 'tic_tac_toe/modules/game'

module TicTacToe
  #
  # class Error < StandardError; end
  #
  class App
    include Texts
    attr_accessor :number_of_players, :config, :player_one, :player_two
    CONFIGURATION_CHOICES = ['y', 'Y', 'n', 'N', ''].freeze
    VALID_CHOICES = ['y', 'Y', ''].freeze

    def initialize
      @board = Board.new
    end

    def run
      greeting
      set_up!
      set_players self.config.player_one, self.config.player_two
      start_game
    end

    protected

    def valid_input?(option, args = [])
      return false unless args.class == Array
      args.include? option
    end

    def set_players(attrs_or_inst_1, attrs_or_inst_2)
      arg1, arg2 = attrs_or_inst_1, attrs_or_inst_2
      self.player_one = arg1.instance_of?(Player) ? arg1 : Player.new(arg1)
      self.player_two = arg2.instance_of?(Player) ? arg2 : Player.new(arg2)
    end

    def get_input
      gets.strip
    end

    private

    def set_up!
      self.config = Config::Player.new
    end

    def start_game
      @board.draw_legend
      @board.draw_boxes
      # Todo: Turns, play
      # @turn = Game::Turn.new()
      # @play = Game::Play.new @board
      #
    end

    def create_game_flow
      @game_flow = Turns.new
    end

    alias_method :will_config?, :valid_input?
    alias_method :busy_box?, :valid_input?
  end

  App.new.run
end
