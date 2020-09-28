require 'spec_helper'

describe ImageInfo::Processor do
  let(:instance) { described_class.new(urls) }

  describe '#process' do
    context 'with one valid url' do
      let(:urls) { 'http://foo.com' }
      let!(:stub) { stub_request(:get, urls).to_return(body: '', status: 200) }

      it 'requests url' do
        instance.process
        expect(stub).to have_been_requested
      end

      it { expect(instance.process.count).to eq(1) }
      it { expect(instance.process.first).to be_a(ImageInfo::Image) }
      it { expect(instance.process.first).to be_valid }
    end

    context 'with one invalid url' do
      let(:urls) { 'foo' }
      let!(:stub) { stub_request(:get, urls).to_return(body: '', status: 200) }

      it 'does not request url' do
        instance.process
        expect(stub).not_to have_been_requested
      end

      it { expect(instance.process.count).to eq(0) }
    end

    context 'with many valid urls' do
      let(:uri1) { 'http://foo.com' }
      let(:uri2) { '//bar.com' }
      let(:urls) { [uri1, uri2] }
      let!(:stub1) { stub_request(:get, uri1).to_return(body: '', status: 200) }
      let!(:stub2) { stub_request(:get, uri2).to_return(body: '', status: 200) }

      it 'requests url' do
        instance.process
        expect(stub1).to have_been_requested
        expect(stub2).to have_been_requested
      end

      it { expect(instance.process.count).to eq(2) }
      it { expect(instance.process.first).to be_a(ImageInfo::Image) }
      it { expect(instance.process.last).to be_a(ImageInfo::Image) }
      it { expect(instance.process.first).to be_valid }
      it { expect(instance.process.last).to be_valid }
    end

    context 'with some invalid urls' do
      let(:uri1) { 'http://foo.com' }
      let(:uri2) { 'bar' }
      let(:urls) { [uri1, uri2] }
      let!(:stub1) { stub_request(:get, uri1).to_return(body: '', status: 200) }
      let!(:stub2) { stub_request(:get, uri2).to_return(body: '', status: 200) }

      it 'requests url' do
        instance.process
        expect(stub1).to have_been_requested
        expect(stub2).not_to have_been_requested
      end

      it { expect(instance.process.count).to eq(1) }
      it { expect(instance.process.first).to be_a(ImageInfo::Image) }
      it { expect(instance.process.first).to be_valid }
    end
  end
end
