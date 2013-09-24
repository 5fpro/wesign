require 'spec_helper'

describe PetitionsController do

  describe "user sign in" do
    before do
      @user = FactoryGirl.create :user
      signin_user(@user)
    end

    it "#new" do
      get "/petitions/new"
      response.body.index("petition[name]").should > 0
    end

    it "#create" do
      petition = { :name => "abc", :user_id => 1, :category_id => 1, :target => "target", :intro => "intro", :content => "content"}
      post "/petitions", :petition => petition
      response.should be_redirect
      Petition.last.name.should == "abc"
    end

    describe "exists petition" do

      before do
        @petition = FactoryGirl.create :petition, :user => @user
      end

      it "#edit" do
        get "/petitions/#{@petition.id}/edit"
        response.body.should match(@petition.name)
      end

      it "#update" do
        petition = { :name => "abc123" }
        put "/petitions/#{@petition.id}", :petition => petition
        @petition.reload
        @petition.name.should == "abc123"
      end

      it "#show" do
        get "/petitions/#{@petition.id}"
        response.should be_success
        response.body.should match(@petition.name)
      end

      it "user can sign petition" do
        post "/petitions/#{@petition.id}/sign", :comment => "abc123xyz"
        petition_user = PetitionUser.last
        petition_user.petition.should == @petition
        petition_user.user.should == @user
        petition_user.comment.should == "abc123xyz"
        get "/petitions/#{@petition.id}"
        response.body.should match("你已參加此連署")
        PetitionUser.last.petition.should == @petition
        PetitionUser.last.comment.should == "abc123xyz"
      end

    end
  end

  describe "user sign out" do

    before do
      @petition = FactoryGirl.create :petition, :name => "abc"
    end

    it "#new" do
      get "/petitions/new"
      response.should be_redirect
    end

    it "#create" do
      petition = { :name => "abc123"}
      post "/petitions", :petition => petition
      response.should be_redirect
      @petition.reload
      @petition.name.should == "abc"
    end

    it "#index" do
      get "/petitions"
      response.should be_success
      response.body.should match(@petition.name)
    end

    it "#show" do
      get "/petitions/#{@petition.id}"
      response.should be_success
      response.body.should match(@petition.name)
    end
  end
end
