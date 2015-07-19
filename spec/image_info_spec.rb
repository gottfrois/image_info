require 'spec_helper'

describe ImageInfo do

  let(:url) { 'http://foo.com/ad.gif' }
  let(:data) { File.read(File.expand_path('../fixtures/ad.gif', __FILE__)) }

  before do
    stub_request(:get, url).to_return(body: data, status: 200)
  end

  subject(:image) { described_class.from(url).first }

  it { expect(image.width).to eq(300) }
  it { expect(image.height).to eq(250) }
  it { expect(image.size).to eq([300, 250]) }
  it { expect(image.type).to eq(:gif) }

end
