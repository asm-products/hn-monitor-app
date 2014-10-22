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
end