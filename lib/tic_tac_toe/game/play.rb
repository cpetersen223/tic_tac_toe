require 'tic_tac_toe/messages/play'

module Game
  class Play
    attr_reader :value, :player

    def initialize(plays:, player:)
      @plays  = plays
      @player = player
      move
    end

    def move
      if @player.kind == :human
        play = Messages::Play.new @player, @plays
        @value  = play.input
      else
        @value = @plays.sample
      end
    end
  end
end