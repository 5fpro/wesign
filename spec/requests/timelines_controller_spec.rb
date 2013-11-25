require 'spec_helper'

describe TimelinesController do
  describe "#create" do
    let(:user){ FactoryGirl.create(:user) }
    let(:petition){ FactoryGirl.create(:petition, :user => user) }
    let(:data){ { :title => "qqq", :content => "ooo" } }

    it "success" do
      signin_user user
      post "/petitions/#{petition.id}/timelines", :timeline => data
      response.should be_redirect
      petition.timelines.count.should == 1
    end

    it "fail if not login" do
      post "/petitions/#{petition.id}/timelines", :timeline => data
      response.should be_redirect
      petition.timelines.count.should == 0
    end

    it "fail as login another user" do
      signin_user FactoryGirl.create(:user)
      post "/petitions/#{petition.id}/timelines", :timeline => data
      response.should be_redirect
      petition.timelines.count.should == 0
    end

    it "fail if data not valid" do
      signin_user user
      data.delete :title
      post "/petitions/#{petition.id}/timelines", :timeline => data
      response.should be_redirect
      petition.timelines.count.should == 0
    end
  end
end
