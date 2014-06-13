FactoryGirl.define do
  factory :user , class: Corgi::User do
    sequence(:email) {|n| "test#{n}@test.com"}
    password "111111"
  end
end