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
          :abort if found_image_info?(buffer)
        end
      end
    end

    private

    def found_image_info?(chunk)
      ::ImageInfo::Parser.new(image, chunk).call
    rescue
      false
    end
  end
end
