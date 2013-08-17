class Timeline < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :petition

  validates_presence_of :petition_id
  validates_presence_of :happened_at
end
