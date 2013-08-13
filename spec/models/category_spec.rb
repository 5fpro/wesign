require 'spec_helper'

describe Category do
  it "FactoryGirl" do
    FactoryGirl.create(:category).new_record?.should be_false
  end

  it "#petitions_count counter cache" do
    category = FactoryGirl.create :category 
    FactoryGirl.create :petition, :category => category
    category.reload
    category.petitions_count.should == 1
    Petition.last.destroy
    category.reload
    category.petitions_count.should == 0
  end
end
