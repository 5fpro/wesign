class PetitionUser < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :petition, :counter_cache => :signs_count
  belongs_to :user
  
  validates_uniqueness_of :petition_id, :scope => [:user_id]

end
