# frozen_string_literal: true

require 'thor'

require_relative 'version'
require_relative 'ascii_converter'
require_relative 'filters/invert_filter'
require_relative 'filters/brightness_filter'
require_relative 'filters/rotate_filter'
require_relative 'filters/flip_filter'
require_relative 'filters/scale_filter'

module AsciiGen
  # Command line interface for ascii gen
  class CLI < Thor
    default_task :help

    map %w[--version -v] => :version
    desc '--version, -v', 'Print the version.'
    def version
      puts "AsciiGen #{VERSION}"
    end

    map %w[--convert -c] => :convert
    method_option :source, type: :string, required: true
    method_option :destination, type: :string
    method_option :rotate, type: :numeric
    method_option :scale, type: :numeric
    method_option :brightness, type: :numeric
    method_option :flip, type: :string
    method_option :invert, type: :boolean
    desc '--convert, -c', 'Convert the image from source path to ascii art.'
    def convert
      converter = AsciiConverter.new options['source']
      ascii_image = converter.convert(extract_filters(options))
      print_output ascii_image, options['destination']
    rescue ArgumentError => e
      puts "Error: #{e.message}"
    end

    map %w[--supported -s] => :supported
    desc '--supported, -s', 'Supported file extensions.'
    def supported
      puts "Supported file extensions: #{AsciiConverter.supported_file_extensions.join(', ')}"
    end

    no_tasks do
      def print_output(ascii_image, path)
        if path.nil?
          puts ascii_image.to_s
        else
          File.open(path, 'w') { |file| file.write(ascii_image.to_s) }
        end
      end

      def extract_filters(options)
        brightness = options['brightness']
        invert = options['invert']
        degrees = options['rotate']
        axis = options['flip']
        scale_factor = options['scale']
        [
          *(BrightnessFilter.new brightness unless brightness.nil?), *(InvertFilter.new unless invert.nil?),
          *(RotateFilter.new degrees unless degrees.nil?), *(FlipFilter.new axis unless axis.nil?),
          *(ScaleFilter.new scale_factor unless scale_factor.nil?)
        ]
      end
    end
  end
end
