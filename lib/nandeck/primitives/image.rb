module Nandeck
  class Image < Primitive
    attr_reader :card_index, :filename, :x, :y, :width, :height, :options 

    def initialize(card_index, filename, x, y, width, height, options = {})
      options = {
        angle: 0,
        flag: "PN",
        alpha_channel: 100
      }.merge(options)

      @card_index, @filename, @x, @y, @width, @height, @options = card_index, filename, x, y, width, height, options
    end

    def to_s
      %{IMAGE = #{@card_index}, "#{@filename}", #{geometry}, #{@options[:angle]}, #{@options[:flag]}, #{@options[:alpha_channel]}}
    end
  end
end

