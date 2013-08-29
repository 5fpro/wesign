# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :petition do
    category do
      FactoryGirl.create :category
    end
    user do
      FactoryGirl.create :user
    end
    sequence(:name){ |n| "petition#{n}" }
    pic File.open("#{Rails.root}/spec/fixtures/petition_pic.jpg")
    target "foofoo"
    intro "introintrointrointrointro"
    content "contentcontentcontentcontentcontent"
    signed_mail_title "mail_title"
    signed_mail_body "signed_mail_body signed_mail_body signed_mail_body"
  end
end
