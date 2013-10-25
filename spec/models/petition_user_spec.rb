require 'spec_helper'

describe PetitionUser do
  it "FactoryGirl" do
    FactoryGirl.create(:petition_user).new_record?.should be_false
  end

  it "after create :create_comment" do
    FactoryGirl.create(:petition_user, :comment => "")
    Petition.last.comments.count.should == 0
    FactoryGirl.create(:petition_user, :comment => "123")
    Petition.last.comments.count.should == 1
  end

  it "after_create :send_first_mail_to_user" do
    petition = FactoryGirl.create :petition
    user = FactoryGirl.create :user
    sidekiq_reset!
    sidekiq_queue_size.should == 0
    FactoryGirl.create :petition_user, :petition => petition, :user => user
    sidekiq_queue_size.should == 1
  end
end
