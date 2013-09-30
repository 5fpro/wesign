require 'spec_helper'

describe PetitionUser do
  it "FactoryGirl" do
    FactoryGirl.create(:petition_user).new_record?.should be_false
  end

  it "linked_petitions" do
    user = FactoryGirl.create :user
    petition_user = FactoryGirl.create :petition_user, :user => user
    petition_user2 = FactoryGirl.create :petition_user, :user => user
    petition_user3 = FactoryGirl.create :petition_user
    linked_petitions = PetitionUser.linked_petitions(user)
    linked_petitions.count.should == 2
    linked_petitions.first.should == petition_user.petition
  end
end
