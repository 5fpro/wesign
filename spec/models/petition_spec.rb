require 'spec_helper'

describe Petition do
  it "FactoryGirl" do
    FactoryGirl.create(:petition).new_record?.should be_false
  end
end
