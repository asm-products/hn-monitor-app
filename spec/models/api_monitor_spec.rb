require 'rails_helper'

describe ApiMonitor do
  before(:each) do
    ApiMonitor.create(hn_id: 8863)
  end

  context 'with no new items' do
    before(:each) do
      allow(ApiMonitor.client).to receive(:max_item).and_return('8863')
    end

    describe '.fetch_stories' do
      subject{ ApiMonitor.fetch_stories }
      it { is_expected.to be false }
      it { expect(Story).not_to receive(:create) }
    end

    describe '.new_stories' do
      it { expect(ApiMonitor.new_stories.size).to eq 0 }
    end

    describe '.max' do
      it { expect(ApiMonitor.max).to eq 8863 }
    end

    describe '.last_max' do
      it { expect(ApiMonitor.last_max).to eq 8863 }
    end
  end

  context 'with new items available' do
    let(:items) { ApiMonitor.new_stories }  
    before(:each) do
      ApiMonitor.create(hn_id: 8863)
      allow(ApiMonitor.client).to receive(:max_item).and_return('8867')
      story = instance_double(Story)
      allow(Story).to receive(:create).and_return(story)
    end

    describe '.fetch_stories' do
      it "attempts to create new story objects" do
        expect(Story).to receive(:create).exactly(2).times
        ApiMonitor.fetch_stories
      end
    end    
  
    describe '.new_stories' do
      it { items.each { |item| expect(item.type).to eq 'story' } }
      describe 'story' do
        let(:story) { items.first }

        it { expect(story.title).to eq "My YC app: Dropbox - Throw away your USB drive" }
        it { expect(story.url).to eq "http://www.getdropbox.com/u/2/screencast.html" }
        it { expect(story.by).to eq "dhouston" }
      end

      it 'updates last max' do
        expect{ ApiMonitor.new_stories }.to change{ ApiMonitor.last_max }.from(8863).to(8867)
      end
    end

    describe '.create_all' do
      it 'attempts to create new Story objects from the returned stories' do
        expect(Story).to receive(:create).exactly(2).times
        ApiMonitor.create_all items
      end
    end

    describe '.max' do
      it { expect(ApiMonitor.max).to eq 8867 }
    end
  end

  describe '.last_max' do
    it { expect(ApiMonitor.last_max).to eq 8863 }
  end

end

