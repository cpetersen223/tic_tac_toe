require_relative 'win'

module Game
  class Board
    LEGEND = %w{ 1 2 3 4 5 6 7 8 9 }.freeze
    attr_reader :plays

    def initialize
      @plays = LEGEND.clone freeze: false
      @boxes = Array.new 9, ' '
    end

    def check_box(move)
      @move = move
      @boxes[@move.value.to_i - 1] = @move.player.token
      subs_play
    end

    def subs_play
      @plays.delete @move.value
    end

    def check_winner
      @win    = Win.new @boxes
      @winner = @win.winner?
    end

    def draw_legend
      print %(
    ------------------- LEGEND ------------------
    ---------------------------------------------
)
      draw LEGEND
    end

    def draw_boxes
      print %(
    ------------------- BOARD -------------------
    ---------------------------------------------
)
      draw @boxes
    end

    private

    def draw(content)
      print <<HEREDOC
                       |     |
                    #{content[0]}  |  #{content[1]}  |  #{content[2]}
                 ______|_____|______
                       |     |
                    #{content[3]}  |  #{content[4]}  |  #{content[5]}
                 ______|_____|______
                       |     |
                    #{content[6]}  |  #{content[7]}  |  #{content[8]}
                       |     |
HEREDOC
    end
  end
end