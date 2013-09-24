class Petition < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :category, :counter_cache => :petitions_count
  has_many :timelines, :dependent => :destroy
  has_many :petition_users, :dependent => :destroy
  has_many :users, :through => :petition_users
  accepts_nested_attributes_for :petition_users, :allow_destroy => true
  
  validates_presence_of :name, :category_id, :user_id, :target, :intro, :content
  
  mount_uploader :pic, PicUploader

  def percentage_progress
    if targeting_count.present?
      (Float(signs_count.to_i) / targeting_count.to_i * 100).ceil
    else
      # TODO
    end
  end

end
