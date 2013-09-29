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

  scope :urgent, order("id DESC") # TODO
  scope :recent, order("id DESC")
  scope :hot, order("signs_count DESC")

  def real_targeting_count
    if targeting_count.present?
      targeting_count.to_i
    else
      if signs_count.to_i < 10000
        arr = [20, 50, 100, 150, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1500, 2000, 2500, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
        arr.each do |value|
          return value if signs_count.to_i <= value * 0.8
        end
      else
        (signs_count.to_i / 10000 + 1).ceil * 10000
      end
    end
  end

  def progress
    (Float(signs_count.to_i) / real_targeting_count * 100).ceil
  end

  def progress_until_max
    progress.to_i > 100 ? 100 : progress
  end

  def self.search(q)
    petitions = scoped
    if q.present?
      q = "%#{q}%"
      petitions = petitions.where("name LIKE ? OR target LIKE ? OR intro LIKE ?OR content LIKE ?", q, q, q, q)
    end
    petitions
  end

end
