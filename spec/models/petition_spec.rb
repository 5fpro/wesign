require 'spec_helper'

describe Petition do
  it "FactoryGirl" do
    FactoryGirl.create(:petition).new_record?.should be_false
  end
  
  it "has_many :timelines, :dependent => :destroy" do
    petition = FactoryGirl.create :petition
    timeline = FactoryGirl.create :timeline, :petition => petition
    Timeline.count.should == 1
    petition.destroy
    Timeline.count.should == 0
  end
end
