require 'spec_helper'

describe PetitionMail do

  it "after_create :send_mail_to_user" do
    petition_user = FactoryGirl.create :petition_user
    petition = petition_user.petition
    sidekiq_reset!
    sidekiq_queue_size.should == 0
    FactoryGirl.create :petition_mail, :petition => petition
    sidekiq_queue_size.should == 1
  end

end
