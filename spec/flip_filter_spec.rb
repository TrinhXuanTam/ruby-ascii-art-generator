# frozen_string_literal: true

require 'rspec'

require_relative '../lib/ascii_gen/filters/flip_filter'
require_relative '../lib/ascii_gen/images/ascii_image'

module AsciiGen
  describe FlipFilter do
    let(:ascii_image) { AsciiImage.new [[1, 3], [2, 4]] }

    it 'should throw on invalid flip axis' do
      expect { FlipFilter.new 'a' }.to raise_error(ArgumentError)
    end

    it 'should flip on the X axis' do
      filter = FlipFilter.new 'X'
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[2, 4], [1, 3]])
    end

    it 'should flip on the Y axis' do
      filter = FlipFilter.new 'Y'
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[3, 1], [4, 2]])
    end
  end
end
