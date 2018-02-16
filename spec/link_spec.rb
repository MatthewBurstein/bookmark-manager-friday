require 'link'

describe Link do
  context '#all' do
    it 'returns all the links' do
      links = Link.all.map(&:url)
      expect(links).to include("http://www.makersacademy.com") &&
      include("http://www.facebook.com") &&
      include("http://www.google.com")
    end
  end
  context '.add_new_link' do
    it 'add new link to the end of bookmark list' do
      Link.add_new_link('http://www.testlink.com', 'testlink')
      links = Link.all.map(&:url)
      expect(links).to include 'http://www.testlink.com'
    end
  end

  describe '::validate' do
    context "when link valid" do
      it "returns true" do
        link = 'https://www.goodlink.com'
        expect(described_class.validate(link)).to eq true
      end
    end

    context "when link not valid" do
      it "returns false" do
        link = 'htps://www.badlink.com'
        expect(described_class.validate(link)).to eq false
      end
    end
  end

  describe '#new' do
    subject(:link) { described_class.new(id, url, title) }
    let(:id)    { 'an id' }
    let(:url)   { 'an url' }
    let(:title) { 'a title' }

    it 'sets the @id' do
      expect(link.id).to eq id
    end

    it 'sets the @url' do
      expect(link.url).to eq url
    end
  end

  describe '.delete' do
    it 'deletes link from database' do
      test_link = 'http://www.google.com'
      test_link_id = '2'
      Link.delete(test_link_id)
      links = Link.all.map(&:url)
      expect(links).not_to include test_link
    end
  end

  describe '.update' do
    let(:options) { { id: '2', title: 'Reddit', url: 'http://www.reddit.com' } }
    it 'updates title in the database' do
      Link.update(options)
      links = Link.all.map(&:title)
      expect(links).to include options[:title]
    end
    it 'updates url in the database' do
      Link.update(options)
      links = Link.all.map(&:url)
      expect(links).to include options[:url]
    end
  end
end
