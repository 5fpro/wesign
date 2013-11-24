require 'spec_helper'

describe CategoriesController do
  it "#index" do
    category = FactoryGirl.create :category
    get '/categories'
    response.should be_success
    response.body.should include(category.name)
  end

  describe "user sign in and sign out" do
    it "user sign in" do
      @user = FactoryGirl.create :user
      signin_user(@user)
      get '/'
      response.should be_success
      response.body.should match(@user.name)
      response.body.should match("#petition-start-up")
      response.body.should_not match("#sign-up")
      response.body.should_not match("請先登入以發起連署")
    end

    it "user sign out" do
      get '/'
      response.should be_success
      response.body.should match("#sign-up")
      response.body.should match("請先登入以發起連署")
    end
  end
end
