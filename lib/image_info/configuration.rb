module ImageInfo
  class Configuration
    attr_accessor :max_concurrency, :max_image_size

    def initialize
      @max_concurrency = 20
      @max_image_size = -1
    end
  end
end
