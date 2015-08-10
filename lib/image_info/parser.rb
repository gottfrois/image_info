require 'image_size'

module ImageInfo
  class Parser

    attr_reader :image

    def initialize(image, data)
      @image = image
      @data = data
    end

    def call
      return unless parser
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
    
    private
    
    def parser
      @parser ||= ::ImageSize.new(@data) 
    rescue ImageSize::FormatError
    end
  end
end
