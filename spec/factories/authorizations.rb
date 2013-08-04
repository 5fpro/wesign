# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authorization do
    provider "MyString"
    uid "MyString"
    auth_type "MyString"
    auth_id 1
    auth_data "MyText"
  end
end
