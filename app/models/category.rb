class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :petitions, :dependent => :nullify
  
  validates_uniqueness_of :name
  validates_presence_of :name

  scope :ordered, order('weight DESC')

  before_destroy :can_delete?

  def can_delete?
    return true if petitions_count == 0
  end
  
end
