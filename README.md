# Build nanDECK directive files in Ruby

[nanDECK](http://www.nand.it/nandeck/) is a tool used by game designers to build
decks of cards quickly using a series of drawing directives. There's some abiliity
for iterating over data and using variables, but not with the same flexibility
that a full-blown scripting language like Ruby can offer. `nandeck-ruby` provides
a series of primitives, composite objects, and boilerplate classes that let you
quickly build nanDECK files from a set of data from, say, a Google Drive
spreadsheet.

## Usage

``` ruby
# Gemfile

gem 'nandeck-ruby', git: 'git://github.com/johnbintz/nandeck-ruby.git'
```

``` ruby
# builder.rb
require 'nandeck'

class Card
  def self.width
    2.5
  end

  def self.height
    3.5
  end

  def self.border
    0.125
  end

  def self.real_border
    border * 2
  end

  def self.pixel
    0.03
  end
end

output = []
output += Nandeck::CardSize.new(300, Card.width, Card.height).to_a
output += Nandeck::PageSize.new(8.5, 11, :portrait).to_a
output += Nandeck::Margins.new(0.5, 0.25).to_a
output << "OVERSAMPLE = 2"
output << "IMAGEFILTER = Lanczos"

output << Nandeck::Rectangle.new(
  1,
  0, 0, Card.width, Card.height,
  '#000000', '#ffffff', Card.border
)
output << Nandeck::Image.new(
  1,
  "images/background.png",
  0, 0, Card.width, Card.height,
  flag: 'P', alpha_channel: "10@270"
)

area = Nandeck::Geometry.new(Card.border + 0.05, Card.real_border + 0.05, 0.688, 0.640)
output << Nandeck::Image.new(1, "images/balloon.png", *area.to_a)

Nandeck::Font.for(typeface: "Tahoma", flag: 'T') do |font|
  height = 0.41

  font.for(size: inches_to_points(height), color: "#000000") do |balloon_font|
    x, y = area.center.to_a

    output << balloon_font.text(1,
      "5", x - height / 2 - 0.10, y - height / 2 - 0.10, height + 0.20, height
    )
  end
end

line_height = 14

Nandeck::Font.for(
  typeface: "Tahoma", size: line_height, flag: "TB", color: '#000000'
) do |font|
  font.for color: '#ffffff' do |outline|
    output << Nandeck::TextBlock.new(
      1, outline, "name", 16,
      0.90, Card.real_border + 0.1, Card.width - Card.real_border - 1.00, 0.38,
      outline: Card.pixel * 2
    )
  end

  output << Nandeck::TextBlock.new(
    1, font, "name", 16,
    0.90, Card.real_border + 0.1, Card.width - Card.real_border - 1.00, 0.38
  )
end

File.open("output.txt", "w") do |fh|
  fh.print output.collect(&:to_s).join("\n")
end
```

