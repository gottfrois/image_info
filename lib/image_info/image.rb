require 'uri'

module ImageInfo
  class Image

    attr_reader :uri
    attr_accessor :width, :height, :type

    def initialize(uri)
      @uri = ::URI.parse(::URI.encode(uri.to_s))
    end

    def size
      [width, height].compact
    end

    def valid?
      uri.is_a?(::URI::HTTP)
    end

  end
end
