require 'spec_helper'

describe ImageInfo::Image do

  let(:uri) { 'http://foo.com/foo.png' }
  let(:instance) { described_class.new(uri) }

  it { expect(instance.size).to eq([]) }
  it { expect(instance.valid?).to eq(true) }

  describe '#valid?' do

    subject(:valid?) { instance.valid? }

    context 'when uri is not valid' do

      let(:uri) { 'foo.png' }

      it { expect(valid?).to eq(false) }

    end

  end

end
