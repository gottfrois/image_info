require 'image_info/configuration'

module ImageInfo
  module Configurable
    def config
      @config ||= ::ImageInfo::Configuration.new
    end

    def configure
      yield config if block_given?
    end
  end
end
