# frozen_string_literal: true

require_relative '../images/ascii_image'

module AsciiGen
  # Filter that flips each greyscale value on X or Y axis.
  class FlipFilter
    ALLOWED_AXIS = %i[Y X].freeze

    def initialize(axis)
      raise ArgumentError, 'Value must be a string or symbol!' unless axis.is_a?(String) || axis.is_a?(Symbol)

      @axis = axis.upcase.to_sym
      raise ArgumentError, 'Value must be Y or X!' unless ALLOWED_AXIS.include? @axis
    end

    def apply(ascii_image)
      width = ascii_image.width
      height = ascii_image.height
      new_greyscale_grid = Array.new(width) { Array.new(height) }

      width.times do |x|
        height.times do |y|
          new_coords = flip_coords x, y, width, height
          new_greyscale_grid[x][y] = ascii_image.greyscale_grid[new_coords[0]][new_coords[1]]
        end
      end

      AsciiImage.new new_greyscale_grid
    end

    def flip_coords(x_coord, y_coord, width, height)
      case @axis
      when :X
        [width - 1 - x_coord, y_coord]
      when :Y
        [x_coord, height - 1 - y_coord]
      end
    end
  end
end
