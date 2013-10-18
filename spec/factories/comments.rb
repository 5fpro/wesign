# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user{ FactoryGirl.create :user }
    commentable{ FactoryGirl.create :petition }
    content "hahahahhahahaha"
  end
end
