# frozen_string_literal: true

require_relative '../images/ascii_image'

module AsciiGen
  # Filter that resizes the greyscale grid.
  class ScaleFilter
    ALLOWED_SCALES = [0.25, 1, 4].freeze

    def initialize(scale_factor)
      unless ALLOWED_SCALES.include? scale_factor
        raise ArgumentError, 'Only scale factors of 0.25, 1 and 4 are supported!'
      end

      @scale_factor = scale_factor
    end

    def apply(ascii_image)
      case @scale_factor
      when 4
        scale_up_four_times ascii_image
      when 0.25
        scale_down_four_times ascii_image
      else
        ascii_image
      end
    end

    def scale_down_four_times(ascii_image)
      width = ascii_image.width / 2
      height = ascii_image.height / 2
      new_greyscale_grid = Array.new(width) { Array.new(height) }
      width.times do |x|
        height.times do |y|
          new_greyscale_grid[x][y] = greyscale_average_of_four ascii_image.greyscale_grid, x, y
        end
      end
      AsciiImage.new new_greyscale_grid
    end

    def greyscale_average_of_four(grid, x_coord, y_coord)
      x_offset = x_coord * 2
      y_offset = y_coord * 2
      values = [
        grid[x_offset][y_offset],
        grid[x_offset + 1][y_offset],
        grid[x_offset + 1][y_offset + 1],
        grid[x_offset][y_offset + 1]
      ]
      values.inject(0, :+) / 4
    end

    def scale_up_four_times(ascii_image)
      width = ascii_image.width
      height = ascii_image.height
      new_greyscale_grid = Array.new(width * 2) { Array.new(height * 2) }
      width.times do |x|
        height.times do |y|
          value = ascii_image.greyscale_grid[x][y]
          duplicate_four_times new_greyscale_grid, value, x, y
        end
      end
      AsciiImage.new new_greyscale_grid
    end

    def duplicate_four_times(grid, value, x_coord, y_coord)
      x_offset = x_coord * 2
      y_offset = y_coord * 2
      grid[x_offset][y_offset] = value
      grid[x_offset + 1][y_offset] = value
      grid[x_offset + 1][y_offset + 1] = value
      grid[x_offset][y_offset + 1] = value
    end
  end
end
