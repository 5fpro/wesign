require "spec_helper"

describe PetitionUserMailer do

  before do
    @petition_user = FactoryGirl.create :petition_user
    @petition = @petition_user.petition
    @user = @petition_user.user
    @petition_mail = FactoryGirl.create :petition_mail, :petition => @petition
  end

  it "send mail #signed_mail_user" do
    mail = PetitionUserMailer.signed_mail_user(@petition_user.id).deliver
    mail.subject.should match(@petition.signed_mail_title)
    mail.body.should match(@petition.signed_mail_body)
  end

  it "send mail #petition_mail_user" do
    mail = PetitionUserMailer.petition_mail_user(@petition_mail.id, @user.id).deliver
    mail.subject.should match(@petition_mail.title)
    mail.body.should match(@petition_mail.body)
  end

end
