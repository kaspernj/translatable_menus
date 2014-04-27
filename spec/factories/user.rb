FactoryGirl.define do
  factory :user do
    email { Forgery(:internet).email_address }
    password "secret password"
  end
end
