FactoryGirl.define do
  factory :domain_trigger, class: Trigger do
    trigger_type 'domain'
    word 'getdropbox.com'
  end

  factory :keyword_trigger, class: Trigger do
    trigger_type 'keyword'
    word 'Dropbox'
  end

  factory :username_trigger, class: Trigger do
    trigger_type 'username'
    word 'dhouston'
  end
end