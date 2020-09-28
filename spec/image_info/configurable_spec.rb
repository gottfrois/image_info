require 'spec_helper'

describe ImageInfo::Configurable do
  let(:klass) do
    Class.new do
      include ImageInfo::Configurable
    end
  end
  let(:instance) { klass.new }

  describe '#configure' do
    let(:configuration) { ImageInfo::Configuration.new }

    it 'yields' do
      expect(instance).to receive(:configure).and_yield(configuration)
      instance.configure { |c| }
    end
  end
end
