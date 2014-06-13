# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_code, class: Corgi::UserCode do
    code "MyString"
    user nil
  end
end
