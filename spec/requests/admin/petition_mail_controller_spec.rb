require 'spec_helper'

describe PetitionMailController do
  
  before do
    @user = FactoryGirl.create :user
    signin_user(@user)
    @petition = FactoryGirl.create :petition, :user => @user
  end

  it "#create" do
    petition_mail = { :title => "abc", :body => "foofooooo", :petition_id => @petition.id }
    post "/petitions/#{@petition.id}/petition_mail", :petition_mail => petition_mail
    response.should be_redirect
    PetitionMail.last.title.should == "abc"
  end

end
