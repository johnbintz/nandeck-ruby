module Nandeck
  class Margins
    def initialize(left_right, top_bottom)
      @left_right, @top_bottom = left_right, top_bottom
    end

    def to_a
      output = []
      output << "MARGINS = #{@left_right}, #{@left_right}, #{@top_bottom}, #{@top_bottom}"
      output
    end
  end
end

