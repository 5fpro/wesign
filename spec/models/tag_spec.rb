require 'spec_helper'

describe Tag do
  it "FactoryGirl" do
    FactoryGirl.create(:tag).new_record?.should be_false
  end
end
