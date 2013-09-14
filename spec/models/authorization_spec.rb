require 'spec_helper'

describe Authorization do
  it "FactoryGirl" do
    FactoryGirl.create(:authorization).new_record?.should be_false
  end

  it "sync user fb_id" do
    au = FactoryGirl.create(:authorization_fb)
    user = au.auth
    user.fb_id.should == au.uid
    au.destroy
    user.reload
    user.fb_id.should be_nil
  end
end
