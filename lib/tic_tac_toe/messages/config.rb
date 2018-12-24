require_relative 'message'

module Messages
  class Config < Message
    INITIAL         = 'Do you want to set up the game? [Y/n]'.freeze
    PLAYERS_NUMBER  = 'How many players wants to play? [1/2]'.freeze
    PLAYER_NAME     = ->(player) { "Enter the name of the player #{player}" }.freeze
    PLAYER_TOKEN    = ->(player, tokens) { "Which token wants to use the player #{player}? #{tokens}" }.freeze
    WHO_STARTS      = ->(player1, player2) { "Pick the player who is going to start: #{player1} [1] or #{player2} [2]" }.freeze

    def initialize
      @question, @options = INITIAL, [ 'Y', 'y', 'N', 'n', '' ]
      ask { ask_again __method__ }
    end

    def continue?
      ['Y', 'y', ''].include? @input
    end

    def players_number
      @question, @options = PLAYERS_NUMBER, %w{ 1 2 }
      ask { ask_again __method__ }
    end

    def player_name(player)
      @player = player
      @question = PLAYER_NAME.(player)
      ask
    end

    def player_token(player, tokens)
      @player, @options = player, tokens
      pretty_tokens     = "[#{@options.join('/')}]"
      @question         = PLAYER_TOKEN.(player, pretty_tokens)
      ask { ask_again :player_token, [@player, @options] }
    end

    def player_starts(player1, player2)
      @player1, @player2 = player1, player2
      @question, @options = WHO_STARTS.(@player1, @player2), PLAYERS_NUMBER, %w{ 1 2 }
      ask { ask_again :player_starts, [@player1, @player2] }
    end
  end
end