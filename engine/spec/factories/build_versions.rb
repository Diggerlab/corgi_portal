# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :build_version, class: Corgi::BuildVersion do
    base_build 1
    latest_build 1
    publisher 1
    latest_version "MyString"
    latest_description "MyText"
    latest_url "MyString"
    published_at "2014-03-31 16:23:12"
  end
end
