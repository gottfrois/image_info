require 'typhoeus'

require 'image_info/image'
require 'image_info/parser'
require 'image_info/request_handler'

module ImageInfo
  class Processor
    attr_reader :images, :options

    def initialize(urls, options = { max_concurrency: ::ImageInfo.config.max_concurrency })
      @images  = Array(urls).map { |uri| ::ImageInfo::Image.new(uri) }.keep_if(&:valid?)
      @options = options
    end

    def process
      images.each { |image| hydra.queue(::ImageInfo::RequestHandler.new(image).build) }
      hydra.run

      images
    end

    private

    def hydra
      @hydra ||= ::Typhoeus::Hydra.new(max_concurrency: options[:max_concurrency].to_i)
    end
  end
end
