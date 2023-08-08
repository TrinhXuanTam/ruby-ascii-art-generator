# frozen_string_literal: true

require_relative '../images/ascii_image'

module AsciiGen
  # Filter that rotates the grid by a number divisble by 90.
  class RotateFilter
    def initialize(degrees)
      raise ArgumentError, 'Value must be divisible by 90!' unless (degrees % 90).zero?

      @degrees = (degrees % 360 + 360) % 360
    end

    def apply(ascii_image)
      width = ascii_image.width
      height = ascii_image.height
      new_greyscale_grid = ascii_image.greyscale_grid
      rotations = @degrees / 90
      rotations.times do
        new_greyscale_grid = rotate new_greyscale_grid, width, height
      end

      AsciiImage.new new_greyscale_grid
    end

    def rotate(greyscale_grid, width, height)
      new_greyscale_grid = Array.new(width) { Array.new(height) }

      width.times do |x|
        height.times do |y|
          new_greyscale_grid[y][x] = greyscale_grid[width - 1 - x][y]
        end
      end

      new_greyscale_grid
    end
  end
end
