class PetitionUser < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :petition, :counter_cache => :signs_count
  belongs_to :user
  
  validates_uniqueness_of :petition_id, :scope => [:user_id]


  after_create :create_comment

  private

  def create_comment
    petition.comments.create! :user => user, :commentable => self, :content => comment if comment.present?
  end
end
