module Nandeck
  class Rectangle < Primitive
    def initialize(card_index, x, y, width, height, border_color, fill_color = "EMPTY", border_width = "0")
      @card_index, @x, @y, @width, @height, @border_color, @fill_color, @border_width = card_index, x, y, width, height, border_color, fill_color, border_width
    end

    def to_s
      %{RECTANGLE = #{@card_index}, #{geometry}, #{@border_color}, #{@fill_color}, #{@border_width}}
    end
  end
end

