require 'image_size'
require 'image_info/null_parser'

module ImageInfo
  class Parser

    attr_reader :image, :data

    def initialize(image, data)
      @image = image
      @data = data
    end

    def call
      set_image_size
      set_image_type
    end

    private

    def set_image_size
      image.width  = parser.width
      image.height = parser.height
    end

    def set_image_type
      image.type = parser.format
    end

    def parser
      @parser ||= ::ImageSize.new(data)
    rescue ::ImageSize::FormatError, NoMethodError
      @parser ||= ::ImageInfo::NullParser.new
    end

  end
end
