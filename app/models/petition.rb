class Petition < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :category, :counter_cache => :petitions_count
  has_many :timelines, :dependent => :destroy
  
  validates_presence_of :name
  validates_presence_of :category_id
  validates_presence_of :user_id

  mount_uploader :pic, PicUploader

end
