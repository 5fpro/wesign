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

    describe "success" do
      before{ signin_user user }

      it "type: post" do
        post "/petitions/#{petition.id}/timelines", :timeline => data
        get "/petitions/#{petition.id}"
        response.should be_success
      end

      it "type: url" do
        data[:content] = "http://google.com.tw asdasd asdasd"
        post "/petitions/#{petition.id}/timelines", :timeline => data
        get "/petitions/#{petition.id}"
        response.should be_success
        response.body.should match("<a href=\"http://google.com.tw\"")
      end

      it "type: youtube" do
        data[:content] = "https://www.youtube.com/watch?v=BS2bxWoWGDM asdasd asdasd"
        post "/petitions/#{petition.id}/timelines", :timeline => data
        get "/petitions/#{petition.id}"
        response.should be_success
        response.body.should match("embed/BS2bxWoWGDM")
      end

      pending "image"
      pending "event"

    end
  end
end
