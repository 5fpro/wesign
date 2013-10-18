class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  validates_presence_of :user_id, :content

  scope :recent, order("id DESC")
  scope :actived, where(:deleted => false)
end
