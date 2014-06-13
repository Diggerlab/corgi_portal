# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :password_request, class: Corgi::PasswordRequest do
    email 'test@test.com'
    ip '127.0.0.1'
    state 'pending'
  end
end
