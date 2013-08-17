# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timeline do
    petition do
      FactoryGirl.create :petition
    end
    happened_at Time.now
    title "titletitletitle"
    content "contentcontentcontentcontent"
  end
end
