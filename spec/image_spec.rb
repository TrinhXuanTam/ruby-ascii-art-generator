# frozen_string_literal: true

require 'rspec'

require_relative '../lib/ascii_gen/images/image'

module AsciiGen
  describe Image do
    let(:image) { Image.new 'assets/test.png' }

    it 'should throw when invalid file extension is provided' do
      expect { Image.new 'test.tiff' }.to raise_error(ArgumentError)
    end

    it 'should have correct dimensions' do
      expect(image.width).to eq(3)
      expect(image.height).to eq(1)
    end

    it 'should convert to greyscale grid' do
      expect(image.greyscale_grid).to eq([[255 * 0.3, 255 * 0.59, 255 * 0.11]])
    end
  end
end
