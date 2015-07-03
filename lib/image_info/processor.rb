require 'typhoeus'

require 'image_info/image'
require 'image_info/parser'
require 'image_info/request_handler'

module ImageInfo
  class Processor

    attr_reader :images

    def initialize(urls)
      @images = Array(urls).map { |uri| ::ImageInfo::Image.new(uri) }.keep_if(&:valid?)
    end

    def process
      images.each { |image| hydra.queue(::ImageInfo::RequestHandler.new(image).build) }
      hydra.run

      images
    end

    private

    def hydra
      @hydra ||= ::Typhoeus::Hydra.new(max_concurrency: max_concurrency)
    end

    def max_concurrency
      ::ImageInfo.config.max_concurrency
    end

  end
end
