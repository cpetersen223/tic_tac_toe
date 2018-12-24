class Win
  def initialize(boxes)
    @boxes = boxes
  end

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

  def horizontal_winner?(position)
    compare position, 1, 2
  end

  def vertical_winner?(position)
    compare position, 3, 6
  end

  def negative_slop_winner?(position)
    compare position, 4, 8
  end

  def positive_slope_inverted?(position)
    compare position, 2, 4
  end

  def compare(position, variant1, variant2)
    box1, box2, box3 = @boxes[position], @boxes[position + variant1], @boxes[position + variant2]
    return false unless box1.present? && box2.present? && box3.present?
    box1 == box2 && box2 == box3
  end
end