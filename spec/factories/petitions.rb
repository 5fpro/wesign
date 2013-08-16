# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :petition do
    category do
      FactoryGirl.create :category
    end
    sequence(:name){ |n| "petition#{n}" }
    target "foofoo"
    intro "introintrointrointrointro"
    content "contentcontentcontentcontentcontent"
    signed_mail_title "mail_title"
    signed_mail_body "signed_mail_body signed_mail_body signed_mail_body"
  end
end
