module Nandeck
  class Primitive
    include Conversions

    def initializs(card_index)
      @card_index = card_index
    end

    def card_indexes
      return @card_indexes if @card_indexes

      @card_indexes = []

      @card_index.split(',').collect(&:strip).each do |part|
        if part['-']

        else
          @card_indexes << part
        end
      end

      @card_indexes
    end

    def to_s
      raise "Override me"
    end

    def geometry
      "#{@x}, #{@y}, #{@width}, #{@height}"
    end
  end
end

