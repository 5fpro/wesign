require 'spec_helper'

describe PetitionTag do
  it "FactoryGirl" do
    FactoryGirl.create(:petition_tag).new_record?.should be_false
  end
end
