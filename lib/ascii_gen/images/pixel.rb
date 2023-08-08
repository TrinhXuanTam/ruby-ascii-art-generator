# frozen_string_literal: true

module AsciiGen
  # Pixel wrapper object.
  class Pixel
    attr_reader :red, :green, :blue

    def initialize(red, green, blue)
      @red = red
      @green = green
      @blue = blue
    end

    def greyscale
      (0.3 * @red) + (0.59 * @green) + (0.11 * @blue)
    end
  end
end
