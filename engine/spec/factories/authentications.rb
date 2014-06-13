FactoryGirl.define do 
    factory :authentication, class: Corgi::Authentication do 
      user
      provider 'sina'
      sequence(:uid) {|n| "11111111#{n}"}
      token 'test'
      token_secret '111'
    end
end