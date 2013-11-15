# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :petition_mail do
    petition do
      FactoryGirl.create :petition
    end
    title "foofoo"
    body "barbar"
  end
end
