module Nandeck
  class Geometry
    def initialize(x, y, width, height)
      @x, @y, @width, @height = x, y, width, height
    end

    def to_a
      [ @x, @y, @width, @height ]
    end

    def center
      [ @x + @width / 2, @y + @height / 2 ]
    end
  end
end

