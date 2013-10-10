module Nandeck
  class CardSize
    def initialize(dpi, width, height)
      @dpi, @width, @height = dpi, width, height
    end

    def to_a
      output = []
      output << "UNIT = INCH"
      output << "CARDSIZE = #{@width}, #{@height}"
      output << "BORDER = NONE"
      output << "DPI = #{@dpi}"
      output
    end
  end
end

