class PetitionUserMailer < ActionMailer::Base
  default from: Setting.aws_ses_render_mail

  def signed_mail_user(petition_user_id)
    petition_user = PetitionUser.find petition_user_id
    @user = petition_user.user
    @petition = petition_user.petition
    mail(:to => @user.email, :subject => @petition.signed_mail_title)
  end

  def petition_mail_user(petition_mail_id, user_id)
    @petition_mail = PetitionMail.find petition_mail_id
    @petition = @petition_mail.petition
    @user = User.find user_id
    mail(:to => @user.email, :subject => @petition_mail.title)
  end
end
