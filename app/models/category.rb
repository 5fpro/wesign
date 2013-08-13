class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  validates_uniqueness_of :name
  validates_presence_of :name
end
