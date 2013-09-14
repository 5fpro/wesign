# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authorization do
    provider "MyString"
    sequence(:uid){ |n| "12341234#{n}" }
    auth_type "MyString"
    auth_id 1
    factory :authorization_fb do 
      provider "facebook"
      auth{  FactoryGirl.create :user }
    end
  end
end
