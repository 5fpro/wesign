class Authorization < ActiveRecord::Base

  belongs_to :auth, :polymorphic => true
  validates_presence_of :provider, :uid, :auth_type, :auth_id
  attr_accessible :provider, :uid, :auth_type, :auth_id, :auth_data
  serialize :auth_data, Hash
  attr_accessible :auth_data, :auth_id, :auth_type, :provider, :uid

  after_create do
    auth.update_column :fb_id, uid if is_fb_for_user?
  end

  after_destroy do
    auth.update_column :fb_id, nil if is_fb_for_user?
  end

  private

  def is_fb_for_user?
    provider.to_s == "facebook" && auth_type == "User"
  end
end
