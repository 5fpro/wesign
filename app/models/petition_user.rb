class PetitionUser < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :petition
  belongs_to :user
end
