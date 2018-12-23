require 'tic_tac_toe'

module Config
  class Player < ::TicTacToe::App
    PLAYER_ONE_DEFAULTS   = { token: :X, name: 'Player One', type: :human, starts: true }.freeze
    PLAYER_TWO_DEFAULTS   = { token: :O, name: 'Player Two', type: :bot }.freeze
    CONFIGURATION_CHOICES = ['y', 'Y', 'n', 'N', ''].freeze
    VALID_CONFIG_CHOICES  = ['y', 'Y', ''].freeze
    VALID_PLAYER_TYPES    = ['h', 'H', 'b', 'B', ''].freeze
    HUMAN_TYPES           = ['h', 'H', ''].freeze
    BOT_TYPES             = %w{ b B }.freeze
    WHO_STARTS_OPTIONS    = %w{ 1 2 }.freeze

    attr_reader :player_one, :player_two

    def initialize
      default?
      set_configuration
    end

    private

    def default?
      ask_configuration
      input = get_input
      return default? unless valid_input? input, CONFIGURATION_CHOICES
      @default = !will_config?(input, VALID_CONFIG_CHOICES)
    end

    def set_configuration
      @player_one_attrs, @player_two_attrs = PLAYER_ONE_DEFAULTS, PLAYER_TWO_DEFAULTS if @default
      @player_one_attrs ||= attrs :player_one
      @player_two_attrs ||= attrs :player_two
      who_starts?
      set_players @player_one_attrs, @player_two_attrs
    end

    def attrs(player)
      @player = player
      { token: token, name: name, type: type }
    end

    def token
      ask_player_for_token
      get_input
    end

    def name
      ask_player_for_name
      get_input
    end

    def type
      ask_player_for_type
      input = get_input
      return type unless valid_input? input, VALID_PLAYER_TYPES
      return :human if valid_input? input, HUMAN_TYPES
      :bot if valid_input? input, BOT_TYPES
    end

    def who_starts?
      input = get_input
      return who_starts? unless valid_input? input, WHO_STARTS_OPTIONS
      return @player_one_attrs[:starts] = true if input == '1'
      @player_two_attrs[:starts] = true
    end
  end
end
