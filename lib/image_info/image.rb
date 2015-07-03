require 'uri'

module ImageInfo
  class Image

    attr_reader :uri
    attr_accessor :size, :type

    def initialize(uri)
      @uri  = ::URI.parse(uri.to_s)
      @size = []
    end

    def valid?
      uri.is_a?(::URI::HTTP)
    end

  end
end
