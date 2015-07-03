require 'image_size'

module ImageInfo
  class Parser

    attr_reader :image, :bytes, :parser

    def initialize(image, data)
      @image      = image
      @bytes      = data.bytes
      @parser = ::ImageSize.new(data)
    end

    def call
      set_image_size
      set_image_type
    end

    private

    def set_image_size
      image.size = [parser.width, parser.height]
    end

    def set_image_type
      image.type = parser.format
    end

  end
end
