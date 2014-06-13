# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback, class: Corgi::Feedback do
    contact 'test@test.com'
    content 'feedback'
    ip '127.0.0.1'
    user
  end
end
