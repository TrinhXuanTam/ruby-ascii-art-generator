# frozen_string_literal: true

require_relative '../images/ascii_image'

module AsciiGen
  # Filter that substracts each greyscale value from maximum greyscale (255).
  class InvertFilter
    def apply(ascii_image)
      width = ascii_image.width
      height = ascii_image.height
      new_greyscale_grid = Array.new(width) { Array.new(height) }

      width.times do |x|
        height.times do |y|
          new_greyscale_grid[x][y] = 255 - ascii_image.greyscale_grid[x][y]
        end
      end

      AsciiImage.new new_greyscale_grid
    end
  end
end
