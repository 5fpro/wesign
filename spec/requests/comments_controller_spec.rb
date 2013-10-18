require 'spec_helper'

describe CommentsController do
  describe "/petitions/123/comments" do
    let(:petition){ FactoryGirl.create :petition }

    describe "POST #create" do

      context "not sign in" do
        before{ post "/petitions/#{petition.id}/comments", :comment => { :content => "1234" } }
        it{ petition.comments.actived.count.should == 0 }
      end

      context "not valid" do
        before{ signin_user }
        before{ post "/petitions/#{petition.id}/comments", :comment => { :content => "" } }
        it{ petition.comments.actived.count.should == 0 }
      end
        
      context "success" do
        before{ signin_user }
        before{ post "/petitions/#{petition.id}/comments", :comment => { :content => "12341234" } }
        it{ petition.comments.actived.count.should == 1 }
      end
    end
  end
end
