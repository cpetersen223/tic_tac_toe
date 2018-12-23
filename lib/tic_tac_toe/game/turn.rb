module Game
  class Turn
    def initialize(player, current = false)
      @player = player
      @current = current
    end
  end
end