# frozen_string_literal: true

require 'rspec'

require_relative '../lib/ascii_gen/filters/rotate_filter'
require_relative '../lib/ascii_gen/images/ascii_image'

module AsciiGen
  describe RotateFilter do
    let(:ascii_image) { AsciiImage.new [[1, 3], [2, 4]] }

    it 'should throw on invalid degrees not divisible by 90' do
      expect { FlipFilter.new 50 }.to raise_error(ArgumentError)
    end

    it 'should rotate all greyscale values clockwise' do
      filter = RotateFilter.new 90
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[2, 1], [4, 3]])
    end

    it 'should rotate all greyscale values counter-clockwise' do
      filter = RotateFilter.new(-90)
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[3, 4], [1, 2]])
    end

    it 'should remain unchanged' do
      filter = RotateFilter.new 360
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[1, 3], [2, 4]])
    end
  end
end
