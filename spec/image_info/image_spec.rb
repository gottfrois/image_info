require 'spec_helper'

describe ImageInfo::Image do

  let(:uri) { 'http://foo.com/foo.png' }
  let(:instance) { described_class.new(uri) }

  it { expect(instance.width).to eq(nil) }
  it { expect(instance.height).to eq(nil) }
  it { expect(instance.valid?).to eq(true) }

  describe '#size' do

    it { expect(instance.size).to eq([]) }

    context 'when set' do

      before do
        instance.width = 1
        instance.height = 2
      end

      it { expect(instance.size).to eq([1, 2]) }

    end

  end

  describe '#valid?' do

    subject(:valid?) { instance.valid? }

    context 'when uri is not valid' do

      let(:uri) { 'foo.png' }

      it { expect(valid?).to eq(false) }

    end

  end

end
