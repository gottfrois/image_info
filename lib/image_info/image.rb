require 'addressable/uri'

module ImageInfo
  class Image
    attr_reader :uri
    attr_accessor :width, :height, :type

    def initialize(uri)
      @uri        = ::Addressable::URI.parse(uri.to_s)
      @uri.scheme = 'http'  unless @uri.scheme
      @uri.normalize!
    rescue ::Addressable::URI::InvalidURIError
      @uri = NullUri.new
    end

    def size
      [width, height].compact
    end

    def valid?
      !!uri.host
    end

    class NullUri
      def host; end
    end
  end
end
