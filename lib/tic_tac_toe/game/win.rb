class Win
  def initialize(boxes)
    @boxes = boxes
  end

  ##
  # This algorithm use an iteration over a Range from 0 to 2 (3 turns) to
  # implement some logic of detection of the winning patrons over an array of
  # plays, ordered by the position in the array.
  #
  # This winning patrons are: the vertical, the horizontal and slopes (positive inverted and negative).
  # This method returns true or false for ease
  # #
  def winner?
    (0..2).each do |time|
      if time == 0
        break true if negative_slop_winner? time
      end
      if time == 2
        break true if positive_slope_inverted? time
      end
      break true if vertical_winner? time
      break true if horizontal_winner? time * 3
      break false if time == 2
    end
  end

  private

  # #
  # Horizontal: Should be 3 consecutive spots (var + 1 and var + 2) from the array beginning
  # on the first spot [0] and with a jump of 3 position every new iteration (var * 3)
  # Ex. first iteration: [0,1,2], second iteration: [3,4,5], third iteration: [6,7,8]
  # #
  def horizontal_winner?(position)
    compare position, 1, 2
  end

  # #
  # Vertical: Should be 3 spots separated by 3 spots (var + 3 and var + 6). Ex. first iteration: [0,3,6],
  # second iteration: [1,4,7], third iteration [2,5,8]
  # #
  def vertical_winner?(position)
    compare position, 3, 6
  end

  # #
  # Negative Slop: Verifies only the position [0,4,8]. The variant is of 4 and 8 from the initial position.
  # This will be verified only in the first round
  # #
  def negative_slop_winner?(position)
    compare position, 4, 8
  end

  # #
  # Positive Slop Inverted: Verifies only the position [2,4,6]. The variant is of 2 and 4 from the initial
  # position. This will be verified only in the last round
  # #
  def positive_slope_inverted?(position)
    compare position, 2, 4
  end

  def compare(position, variant1, variant2)
    box1, box2, box3 = @boxes[position], @boxes[position + variant1], @boxes[position + variant2]
    return false unless box1.present? && box2.present? && box3.present?
    box1 == box2 && box2 == box3
  end
end