# frozen_string_literal: true

module AsciiGen
  # Utility that transforms greyscale values to ascii characters.
  class AsciiImage
    GREYSCALE_CHARACTERS = ' .:-=+*#%@'

    attr_reader :greyscale_grid, :width, :height

    def initialize(greyscale_grid)
      @width = greyscale_grid.length
      @height = greyscale_grid[0].length
      @greyscale_grid = greyscale_grid
    end

    def greyscale_to_char(greyscale_value)
      char_index = (greyscale_value / 25).to_i
      char_index = GREYSCALE_CHARACTERS.length <= char_index ? GREYSCALE_CHARACTERS.length - 1 : char_index
      GREYSCALE_CHARACTERS[char_index]
    end

    def to_s
      res = ''
      character_grid = @greyscale_grid.map { |row| row.map { |greyscale| greyscale_to_char greyscale } }
      @width.times do |x|
        res += "#{character_grid[x].join('')}\n"
      end
      res
    end
  end
end
