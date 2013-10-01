require 'spec_helper'

describe PetitionUser do
  it "FactoryGirl" do
    FactoryGirl.create(:petition_user).new_record?.should be_false
  end
end
