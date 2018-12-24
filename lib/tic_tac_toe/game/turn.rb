module Game
  class Turn
    attr_accessor :player, :current

    def initialize(player, current = false)
      @player = player
      @current = current
    end
  end
end