# frozen_string_literal: true

require 'rspec'

require_relative '../lib/ascii_gen/filters/invert_filter'
require_relative '../lib/ascii_gen/images/ascii_image'

module AsciiGen
  describe InvertFilter do
    let(:ascii_image) { AsciiImage.new [[1, 3], [2, 4]] }

    it 'should invert all greyscale values' do
      filter = InvertFilter.new
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[254, 252], [253, 251]])
    end
  end
end
