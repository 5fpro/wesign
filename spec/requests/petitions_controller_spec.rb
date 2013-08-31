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
        response.body.index(@petition.name).should > 0
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

    it "#show" do
      get "/petitions/#{@petition.id}"
      response.should be_success
      response.body.should match(@petition.name)
    end
  end
end
