# frozen_string_literal: true

require 'rspec'

require_relative '../lib/ascii_gen/images/ascii_image'

module AsciiGen
  describe AsciiImage do
    it 'should have correct dimensions' do
      image = AsciiImage.new [[1, 2], [3, 4], [5, 6]]
      expect(image.width).to eq(3)
      expect(image.height).to eq(2)
    end

    it 'should convert into character representation' do
      image = AsciiImage.new [[0, 25, 50, 75, 100, 125, 150, 175, 200, 225, 250]]
      expect(image.to_s).to eq(" .:-=+*#%@@\n")
    end

    it 'should print multiline ascii image' do
      image = AsciiImage.new [[255, 255], [255, 255]]
      expect(image.to_s).to eq("@@\n@@\n")
    end
  end
end
