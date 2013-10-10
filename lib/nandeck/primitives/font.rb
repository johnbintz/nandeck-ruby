module Nandeck
  class Font
    def self.for(settings)
      yield new(settings)
    end

    def initialize(settings)
      @settings = settings
    end

    def for(settings)
      yield self.class.new(@settings.merge(settings))
    end

    def size
      @settings[:size]
    end

    def write
      @writing = true
      @given_font_definition = false

      yield

      @writing = false
    end

    def text(card_index, text, x, y, width, height, options = {})
      options = {
        horizontal: :center,
        vertical: :wwcenter,
        angle: 0,
        alpha: 100,
        outline: nil
      }.merge(options)

      text = %{TEXT = #{card_index}, "#{text}", #{x}, #{y}, #{width}, #{height}, #{options[:horizontal]}, #{options[:vertical]}, #{options[:angle]}, #{options[:alpha]}}
      if options[:outline]
        text << %{, #{options[:outline]}}
      end

      output = ''

      if !@writing || !@given_font_definition
        output << %{FONT = #{@settings[:typeface]}, #{@settings[:size]}, #{@settings[:flag]}, #{@settings[:color]}\n}
        @given_font_definition = true
      end

      output << text

      output
    end
  end
end

