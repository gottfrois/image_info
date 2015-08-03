# encoding: utf-8
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

  describe 'parsing invalid uri does not crash' do

    context 'trys to fix invalid characters' do

      let(:uri) { 'http://karrierebibel.de/wp-content/uploads/2015/03/7_Todsünden_der_Jobsuche_sauer_wütend.jpg' }

      it { expect(instance.valid?).to eq(true) }

      it { expect(instance.uri).to eq(URI.parse 'http://karrierebibel.de/wp-content/uploads/2015/03/7_Tods%C3%BCnden_der_Jobsuche_sauer_w%C3%BCtend.jpg') }

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
