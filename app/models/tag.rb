class Tag < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :petitions, :through => :petition_tags
  has_many :petition_tags
end