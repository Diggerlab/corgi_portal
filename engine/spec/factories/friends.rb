# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friend, class: Corgi::Friend do
    provider "email"
    user nil
  end
end
