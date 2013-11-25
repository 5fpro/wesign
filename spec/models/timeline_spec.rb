require 'spec_helper'

describe Timeline do
  it "FactoryGirl" do
    FactoryGirl.create(:timeline).new_record?.should be_false
  end

  describe "after create: parse_type" do
    
    it "youtube" do
      t = FactoryGirl.create(:timeline, :content => "hahaha https://www.youtube.com/watch?v=fK_QqFVkpmY\nhahah")
      t.type_of?(:youtube).should be_true
      t.youtube_link.present?.should be_true
    end

    it "url" do
      t = FactoryGirl.create(:timeline, :content => "dasdadads\nhttps://www.google.com/watch?v=fK_QqFVkpmY\nhahah")
      t.type_of?(:url).should be_true
      t.link.present?.should be_true
    end

    it "post" do
      t = FactoryGirl.create(:timeline, :content => "dasdadads\n")
      t.type_of?(:post).should be_true
    end

    it "event" do
      t = FactoryGirl.create(:timeline, :content => "dasdadads\n", :timeline_type => :event)
      t.type_of?(:event).should be_true
    end

  end
end
