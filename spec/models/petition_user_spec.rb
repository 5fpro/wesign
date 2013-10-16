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
end
