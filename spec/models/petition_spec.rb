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

  describe "progress should be calculate" do
    
    before do
      @user = FactoryGirl.create :user
      @petition = FactoryGirl.create :petition, :user => @user
    end

    it "has targeting_count" do
      @petition.update_column :targeting_count ,10
      @petition.percentage_progress.should == 0
      Petition.update_counters @petition.id, :signs_count => 5
      @petition.reload
      @petition.percentage_progress.should == 50
      Petition.update_counters @petition.id, :signs_count => 10
      @petition.reload
      @petition.percentage_progress.should == 150
    end

    it "has no targeting_count & signs_count < 10000" do
      @petition.update_column :targeting_count ,nil
      @petition.percentage_targeting_count.should == 20
      Petition.update_counters @petition.id, :signs_count => 235
      @petition.reload
      @petition.percentage_targeting_count.should == 300
      Petition.update_counters @petition.id, :signs_count => 6743
      @petition.reload
      @petition.percentage_targeting_count.should == 9000
    end

    it "has no targeting_count & signs_count > 10000" do
      @petition.update_column :targeting_count ,nil
      @petition.percentage_targeting_count.should == 20
      Petition.update_counters @petition.id, :signs_count => 23500
      @petition.reload
      @petition.percentage_targeting_count.should == 30000
    end
  end
end
