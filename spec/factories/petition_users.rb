# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :petition_user do
    petition do
      FactoryGirl.create :petition
    end
    user do
      FactoryGirl.create :user
    end
    comment "test"
  end
end
