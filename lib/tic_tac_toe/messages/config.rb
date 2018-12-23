require_relative 'message'

module Messages
  class Config < Message
    INITIAL = 'Do you want to set up the game? [Y/n]'.freeze
    PLAYERS_NUMBER = 'How many players wants to play? [1/2]'.freeze

    def initialize
      @message = INITIAL
      @options = [ 'Y', 'y', 'N', 'n', '' ]
      ask { new unless valid? }
    end

    def players_number
      @message = PLAYERS_NUMBER
      @options = %w{ 1 2 }
      ask { players_number unless valid? }
    end
  end
end