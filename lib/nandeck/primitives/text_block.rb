module Nandeck
  class TextBlock < Primitive
    def initialize(card_index, font, text, character_break, x, y, width, height, options = {})
      @card_index, @font, @text, @character_break, @x, @y, @width, @height = card_index, font, text, character_break, x, y, width, height

      @options = {
        line_height: font.size,
        line_height_adjustment: 0,
        outline: nil
      }.merge(options)
    end

    def line_height
      @options[:line_height]
    end

    def line_height_adjustment
      @options[:line_height_adjustment]
    end

    def line_height_inches
      points_to_inches(line_height)
    end

    def to_s
      sy = (@height - (lines.length * line_height_inches) / 2) - line_height_inches
      y = 0

      output = []

      @font.write do
        lines.each do |line|
          if line.length != 0
            output << @font.text(@card_index, line.join(' '), @x, @y + sy + y, @width, points_to_inches(line_height) * 2, { vertical: :top }.merge(@options) )
          end

          y += points_to_inches(line_height + line_height_adjustment)
        end
      end

      output.join("\n") + "\n"
    end

    def lines
      return @lines if @lines

      words = @text.to_s.split(' ')

      @lines = [ [] ]

      while !words.empty?
        if @lines.last.join(' ').length + words.first.length > @character_break
          @lines << []
        end

        @lines.last << words.shift
      end

      @lines
    end
  end
end

