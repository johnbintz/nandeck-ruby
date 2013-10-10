module Nandeck
  class Line < Primitive
    def initialize(card_index, x, y, width, height, color, thickness)
      @card_index, @x, @y, @width, @height, @color, @thickness = card_index, x, y, width, height, color, thickness
    end

    def to_s
      %{LINE = #{@card_index}, #{geometry}, #{@color}, #{@thickness}}
    end
  end
end

