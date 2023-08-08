# frozen_string_literal: true

require 'mini_magick'

require_relative 'pixel'

module AsciiGen
  # Utility that extracts pixel data from image.
  class Image
    ALLOWED_IMAGES = %i[.jpg .jpeg .png .gif].freeze

    attr_reader :width, :height

    def self.supported_file_extensions
      ALLOWED_IMAGES
    end

    def initialize(path)
      file_extension = File.extname(path).downcase.to_sym
      raise ArgumentError, 'File format not supported!' unless ALLOWED_IMAGES.include? file_extension

      image = MiniMagick::Image.open(path)
      @width = image.width
      @height = image.height
      @pixels = Array.new(@height) { Array.new(@width) }
      extract_pixel_data image.get_pixels
    end

    def extract_pixel_data(raw_pixels)
      @width.times do |x|
        @height.times do |y|
          pixel = raw_pixels[y][x]
          @pixels[y][x] = Pixel.new pixel[0], pixel[1], pixel[2]
        end
      end
    end

    def greyscale_grid
      @pixels.map { |row| row.map(&:greyscale) }
    end
  end
end
