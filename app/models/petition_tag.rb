class PetitionTag < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :petition
  belongs_to :tag
end
