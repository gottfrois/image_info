require 'stringio'

module ImageInfo
  class RequestHandler

    attr_reader :image, :buffer

    def initialize(image)
      @image = image
      @buffer = StringIO.new
    end

    def build
      ::Typhoeus::Request.new(image.uri.to_s, followlocation: true, accept_encoding: :gzip).tap do |request|
        request.on_body do |chunk|
          buffer.write(chunk)
          buffer.rewind
          :abort if max_image_size_reached? || found_image_info?
        end
      end
    end

    private

    def found_image_info?
      ::ImageInfo::Parser.new(image, buffer).call
    end

    def max_image_size_reached?
      return false if max_image_size <= 0
      buffer.size > max_image_size
    end

    def max_image_size
      ::ImageInfo.config.max_image_size
    end
  end
end
