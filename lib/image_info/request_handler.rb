module ImageInfo
  class RequestHandler

    attr_reader :image

    def initialize(image)
      @image = image
    end

    def build
      ::Typhoeus::Request.new(image.uri.to_s, followlocation: true, accept_encoding: :gzip).tap do |request|
        request.on_complete { |response| on_complete(response) }
      end
    end

    private

    def on_complete(response)
      ::ImageInfo::Parser.new(image, response.body).call if response.success?
    end

  end
end
