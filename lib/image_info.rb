require 'image_info/version'
require 'image_info/processor'
require 'image_info/configurable'

module ImageInfo
  extend Configurable

  # Returns type and size given an url or a list of urls.
  #
  # @example
  #   ImageInfo.from('http://foo.com/foo.png').first.size
  #    => [250, 86]
  #
  # @example
  #   ImageInfo.from(['http://foo.com/foo.png', 'http://foo.com/bar.jpeg']).map(&:type)
  #    => [:png, :jpeg]
  #
  # @return [Array<ImageInfo::Image>]
  def self.from(urls, options = { max_concurrency: config.max_concurrency })
    ::ImageInfo::Processor.new(urls, options).process
  end

end
