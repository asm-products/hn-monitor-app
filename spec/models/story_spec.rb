require 'rails_helper'

describe Story do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :hn_id }
    it { should validate_presence_of :link }
    it { should validate_presence_of :hn_user }
    it { should validate_presence_of :triggers }

    it { should validate_uniqueness_of :title }
  end

  describe '#add_trigger' do
    let(:item) { FactoryGirl.attributes_for(:story) }

    context "when there are no matching triggers" do
      it { expect{ Story.create(item) }.not_to change{ Story.count } }
    end

    context 'when the story matches a trigger' do
      before(:each) { @link = FactoryGirl.create(:domain_trigger) }

      it { expect{ Story.create!(item) }.to change{ Story.count }.by(1) }

      it "creates a story with an association to the trigger" do
        story = Story.create!(item)
        expect(story.triggers.first).to eq @link
      end
    end
  end


end
