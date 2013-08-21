require 'spec_helper'

describe UsersController do

  before do
    @user = FactoryGirl.create :user
  end

  describe "#edit" do
    it "sign in" do
      signin_user(@user)
      get "/users/#{@user.id}/edit"
      response.should be_success
      response.body.should include(@user.name)
    end
    
    it "sign out" do
      get "/users/#{@user.id}/edit"
      response.should be_redirect
    end
  end

  describe "#update" do
    it "sign in" do
      signin_user(@user)
      put "/users/#{@user.id}", :user => { :name => "aabbcc" ,:phone => "02-34567890" }
      response.should be_redirect
      @user.reload
      @user.name.should == "aabbcc"
      @user.phone.should == "02-34567890"
    end

    it "sign out" do
      put "/users/#{@user.id}", :user => { :name => "aabbcc" ,:phone => "02-34567890" }
      response.should be_redirect
      @user.reload
      @user.name.should_not == "aabbcc"
      @user.phone.should_not == "02-34567890"
    end
  end
end
