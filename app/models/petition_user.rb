class PetitionUser < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :petition, :counter_cache => :signs_count
  belongs_to :user
  
  validates_uniqueness_of :petition_id, :scope => [:user_id]

  def self.linked_petitions(user)
    ids = PetitionUser.where(:user_id => user.id).map(&:petition_id)
    Petition.where(:id => ids)
  end

end
