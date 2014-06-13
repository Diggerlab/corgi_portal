# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product, class: Corgi::Product do
    sk_product_id "MyString"
    enabled false
    vcs_got 1
    gross 1.5
    short_name "MyString"
  end
end
