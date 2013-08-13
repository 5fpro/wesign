class Petition < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :category, :counter_cache => :petitions_count
  has_many :tags, :through => :petition_tags
  has_many :petition_tags
  has_many :timelines

  validates_uniqueness_of :name
  validates_presence_of :name
  validates_presence_of :category_id

end
