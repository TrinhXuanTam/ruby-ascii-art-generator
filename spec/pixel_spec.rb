# frozen_string_literal: true

require 'rspec'

require_relative '../lib/ascii_gen/filters/invert_filter'
require_relative '../lib/ascii_gen/images/pixel'

module AsciiGen
  describe Pixel do
    it 'should return pixel data' do
      red = 1
      green = 2
      blue = 3
      pixel = Pixel.new red, green, blue
      expect(pixel.red).to eq(red)
      expect(pixel.green).to eq(green)
      expect(pixel.blue).to eq(blue)
    end

    it 'should compute greyscale value from pixel data' do
      red = 50
      green = 100
      blue = 150
      pixel = Pixel.new red, green, blue
      expect(pixel.greyscale).to eq(red * 0.3 + green * 0.59 + blue * 0.11)
    end
  end
end
