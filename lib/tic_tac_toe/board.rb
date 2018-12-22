require 'tic_tac_toe/app'

class Board < TicTacToe::App
  LEGEND = %w{ 1 2 3 4 5 6 7 8 9 }.freeze

  def initialize
    @boxes = Array.new 9, ' '
  end

  def validate(coordinate)
    return false unless coordinate.class == Integer
    @boxes[coordinate].blank?
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