class Petition < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :category

  validates_uniqueness_of :name
  validates_presence_of :name
  validates_presence_of :category_id
end
