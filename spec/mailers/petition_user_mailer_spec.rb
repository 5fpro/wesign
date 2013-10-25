require "spec_helper"

describe PetitionUserMailer do

  before do
    @petition_user = FactoryGirl.create :petition_user
    @petition = @petition_user.petition
    @user = @petition_user.user
  end

  it "send mail #signed_mail_user" do
    mail = PetitionUserMailer.signed_mail_user(@petition_user.id).deliver
    mail.subject.should match(@petition.signed_mail_title)
    mail.body.should match(@petition.signed_mail_body)
  end

end
