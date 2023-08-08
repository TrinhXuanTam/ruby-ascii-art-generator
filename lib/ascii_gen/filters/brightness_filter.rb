# frozen_string_literal: true

require_relative '../images/ascii_image'

module AsciiGen
  # Filter that adds a fixed brightness to each greyscale value.
  class BrightnessFilter
    def initialize(amount)
      @amount = amount
    end

    def apply(ascii_image)
      width = ascii_image.width
      height = ascii_image.height
      new_greyscale_grid = Array.new(width) { Array.new(height) }

      width.times do |x|
        height.times do |y|
          new_greyscale_grid[x][y] = add_brightness ascii_image.greyscale_grid[x][y]
        end
      end

      AsciiImage.new new_greyscale_grid
    end

    def add_brightness(greyscale)
      new_greyscale = greyscale + @amount

      return 0 if new_greyscale.negative?

      return 255 if new_greyscale > 255

      new_greyscale
    end
  end
end
