module Game
  ##
  # Class that delivers an array of turns that defines one match.
  # 9 turns tops to finish the game
  # #
  class Turns
    attr_accessor :turns

    def initialize(player1, player2)
      @turns = []
      @player1 = starter_order(player1, player2) { player1.starts? }
      @player2 = starter_order(player1, player2) { player2.starts? }
      set_turns
    end

    def set_turns
      1..9.times do |x|
        @turns << Turn.new(@player1) if x % 2 == 0
        @turns << Turn.new(@player2) if x % 2 != 0
      end
    end

    private

    def starter_order(player1, player2)
      yield ? player1 : player2
    end

  end
end