class Petition < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :category, :counter_cache => :petitions_count
  has_many :timelines, :dependent => :destroy
  has_many :petition_users, :dependent => :destroy
  has_many :users, :through => :petition_users
  accepts_nested_attributes_for :petition_users, :allow_destroy => true
  
  validates_presence_of :name, :category_id, :user_id, :target, :intro, :content
  
  mount_uploader :pic, PicUploader

  scope :recent, order("id DESC")
  scope :for_index_page, lambda{ |q| recent.search(q) }

  def self.search(q)
    petitions = scoped
    if q.present?
      q = "%#{q}%"
      petitions = petitions.where("name LIKE ? OR target LIKE ? OR intro LIKE ?OR content LIKE ?", q, q, q, q)
    end
    petitions
  end

end
