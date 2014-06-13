# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account, class: Corgi::Account do
    vcs 1
    coins 1
    user nil
  end
end
