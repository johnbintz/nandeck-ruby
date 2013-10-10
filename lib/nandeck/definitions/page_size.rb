module Nandeck
  class PageSize
    def initialize(width, height, orientation)
      @width, @height, @orientation = width, height, orientation
    end

    def to_a
      output = []
      output << "PAGE = #{@width}, #{@height}, #{@orientation}"
      output
    end
  end
end

