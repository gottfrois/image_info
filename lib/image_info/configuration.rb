module ImageInfo
  class Configuration

    attr_accessor :max_concurrency

    def initialize
      @max_concurrency = 20
    end

  end
end
