require 'spec_helper'

describe Comment do
  it "FactoryGirl" do
    2.times{ FactoryGirl.create(:comment).new_record?.should be_false }
  end
end
