require_relative 'message'

module Messages
  class GameOver < Message
    MESSAGE = 'Game Over! Start over [S/s], Restart [R/r] or Exit [E/e]'.freeze
    CONGRATULATIONS = ->(player) { "Congratulations #{player.name}, you are the winner. Restart [R/r] or Exit [E/e]" }.freeze
    OPTIONS = %w{ R r E e }.freeze

    attr_reader :input

    def initialize(winner, current_player)
      @winner, @player, @options = winner, current_player, OPTIONS
      @question = @winner ? CONGRATULATIONS.(@player) : MESSAGE
      ask { ask_again :initialize, [@winner, @player] }
    end
  end
end