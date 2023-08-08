# frozen_string_literal: true

require 'rspec'

require_relative '../lib/ascii_gen/filters/brightness_filter'
require_relative '../lib/ascii_gen/images/ascii_image'

module AsciiGen
  describe BrightnessFilter do
    let(:ascii_image) { AsciiImage.new [[1, 3], [2, 4]] }

    it 'should add brightness' do
      filter = BrightnessFilter.new 50
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[51, 53], [52, 54]])
    end

    it 'should accept negative values' do
      filter = BrightnessFilter.new(-1)
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[0, 2], [1, 3]])
    end

    it 'should not overflow maximum greyscale value' do
      filter = BrightnessFilter.new 252
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[253, 255], [254, 255]])
    end

    it 'should not contain any negative values' do
      filter = BrightnessFilter.new(-3)
      res = filter.apply ascii_image
      expect(res.greyscale_grid).to eq([[0, 0], [0, 1]])
    end
  end
end
