# frozen_string_literal: true

require_relative 'images/image'
require_relative 'images/ascii_image'

module AsciiGen
  # Utility loads an image, transforms the image into an ASCII art and optionally applies filters.
  class AsciiConverter
    def initialize(path)
      @image = Image.new path
    end

    def convert(filters)
      greyscale_grid = @image.greyscale_grid
      ascii_image = AsciiImage.new greyscale_grid
      filters.inject(ascii_image) { |image, filter| filter.apply image }
    end

    def self.supported_file_extensions
      Image.supported_file_extensions
    end
  end
end
