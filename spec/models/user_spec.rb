require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create :user
  end

  it "user data check & update" do
    user = User.last
    user.name.should == @user.name
    user.email.should == @user.email
    @user.update_attributes :name => "dahlia"
    user.reload
    user.name.should == "dahlia"
  end
end
