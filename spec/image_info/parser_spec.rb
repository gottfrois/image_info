require 'spec_helper'

describe ImageInfo::Parser do

  let(:uri) { 'http://foo.com' }
  let(:image) { ImageInfo::Image.new(uri) }
  let(:instance) { described_class.new(image, data) }

  describe '#call' do

    subject(:call) { instance.call }

    context 'animated_gif' do

      let(:data) { File.read(File.expand_path('../../fixtures/ad.gif', __FILE__)) }

      it { expect { call }.to change { image.type }.to eq(:gif) }
      it { expect { call }.to change { image.size }.to eq([300, 250]) }

    end

    context 'static gif' do

      let(:data) { File.read(File.expand_path('../../fixtures/basecamp.gif', __FILE__)) }

      it { expect { call }.to change { image.type }.to eq(:gif) }
      it { expect { call }.to change { image.size }.to eq([153, 36]) }

    end

    context 'png' do

      let(:data) { File.read(File.expand_path('../../fixtures/close.png', __FILE__)) }

      it { expect { call }.to change { image.type }.to eq(:png) }
      it { expect { call }.to change { image.size }.to eq([25, 25]) }

    end

    context 'jpeg' do

      let(:data) { File.read(File.expand_path('../../fixtures/upload_bird.jpg', __FILE__)) }

      it { expect { call }.to change { image.type }.to eq(:jpeg) }
      it { expect { call }.to change { image.size }.to eq([775, 525]) }

    end

    context 'tiff' do

      let(:data) { File.read(File.expand_path('../../fixtures/short.tif', __FILE__)) }

      it { expect { call }.to change { image.type }.to eq(:tiff) }
      it { expect { call }.to change { image.size }.to eq([50, 20]) }

    end

    context 'partial image with not enough data' do

      let(:data) { File.open(File.expand_path('../../fixtures/upload_bird.jpg', __FILE__)).read(50) }

      it { expect { call }.not_to change { image.type } }
      it { expect { call }.not_to change { image.size } }

    end
    
    
    context 'partial image with enough data' do

      let(:data) { File.open(File.expand_path('../../fixtures/upload_bird.jpg', __FILE__)).read(400) }

      it { expect { call }.to change { image.type }.to eq(:jpeg) }
      it { expect { call }.to change { image.size }.to eq([775, 525]) }

    end

  end

end
