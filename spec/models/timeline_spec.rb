require 'spec_helper'

describe Timeline do
  it "FactoryGirl" do
    FactoryGirl.create(:timeline).new_record?.should be_false
  end
end
