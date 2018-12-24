require_relative 'message'

module Messages
  class Play < Message
    MOVE = ->(player) { "Pick your move #{player.name}" }.freeze

    attr_reader :input

    def initialize(player, moves)
      @player, @options = player, moves
      @question         = MOVE.(player)
      ask { ask_again __method__, [@player, @options] }
    end
  end
end