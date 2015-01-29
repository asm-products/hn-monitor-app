require 'rails_helper'

describe User do
  describe "users can specify email frequency" do
    it "defaults to immediate" do
      user = create :user
      expect(user.notify_immediately?).to be true
    end

    it "validates frequency type" do
      expect { 
        create(:user, email_frequency: :not_a_type)
      }.to raise_error
      expect {
        create(:user, email_frequency: 1000)
      }.to raise_error
      create(:user, email_frequency: :notify_daily)
      expect(User.count).to eq 1
    end

    it "should query users by type" do
      create_list(:user, 5)
      create_list(:user, 3, email_frequency: :notify_weekly)
      expect(User.notify_immediately.count).to eq 5
      expect(User.notify_weekly.count).to eq 3
    end
  end
end