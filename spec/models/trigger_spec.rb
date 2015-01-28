require 'rails_helper'

describe Trigger do
  describe "validates trigger_type" do
    it "should save if type is valid" do
      Trigger.create(trigger_type: 'domain', word: 'test.com')
      expect(Trigger.count).to eq 1
    end
    it "should not save if the type is not valid" do
      Trigger.create(trigger_type: 'invalid_type', word: 'test')
      expect(Trigger.count).to eq 0
    end
  end

  describe 'scopes' do
    before(:each) do
      @domain = FactoryGirl.create :domain_trigger
      @keyword = FactoryGirl.create :keyword_trigger
      @user = FactoryGirl.create :username_trigger
    end

    it { expect(Trigger.count).to eq 3 }

    describe 'domain' do
      it { expect(Trigger.domains.first).to eq @domain }
    end
    describe 'keyword' do
      it { expect(Trigger.keywords.first).to eq @keyword }
    end
    describe 'username' do
      it { expect(Trigger.usernames.first).to eq @user }
    end
  end

end