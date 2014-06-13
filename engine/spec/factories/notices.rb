# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notice, class: Corgi::Notice do
    enabled true
    start_up "2014-03-31 12:15:07"
    end_up "2014-03-31 12:15:07"
    content "MyText"
  end
end
