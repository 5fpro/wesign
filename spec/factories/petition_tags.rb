# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :petition_tag do
    petition do
      FactoryGirl.create :petition
    end
    tag do
      FactoryGirl.create :tag
    end
  end
end
