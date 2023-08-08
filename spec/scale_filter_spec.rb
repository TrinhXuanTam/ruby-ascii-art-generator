# frozen_string_literal: true

require 'rspec'

require_relative '../lib/ascii_gen/filters/scale_filter'
require_relative '../lib/ascii_gen/images/ascii_image'

module AsciiGen
  describe ScaleFilter do
    let(:ascii_image) { AsciiImage.new [[1, 3], [2, 4]] }

    it 'should throw on scale factor' do
      expect { ScaleFilter.new 5 }.to raise_error(ArgumentError)
    end

    it 'should remain unchanged' do
      filter = ScaleFilter.new 1
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[1, 3], [2, 4]])
    end

    it 'should scale up four times' do
      filter = ScaleFilter.new 4
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[1, 1, 3, 3], [1, 1, 3, 3], [2, 2, 4, 4], [2, 2, 4, 4]])
    end

    it 'should scale down four times' do
      filter = ScaleFilter.new 0.25
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[2]])
    end
  end
end
