# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email){ |n| "user#{n}@5fpro.com" }
    sequence(:name){ |n| "user#{n}" }
    password "1234567890"
  end
end
