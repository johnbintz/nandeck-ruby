module Nandeck
  module Conversions
    def point_to_pixel(point)
      point * 300.0 / 72.0
    end

    def pixel_to_point(pixel)
      pixel * 72.0 / 300.0
    end

    def inches_to_points(inch)
      inch * 72.0
    end

    def points_to_inches(point)
      point / 72.0
    end
  end
end
